using Models.Data;
using Models.EF;
using Microsoft.EntityFrameworkCore;
using Service;
using Service.Helpers;
using Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.ViewModels.KPI;
using Models.ViewModels.Category;
using System.Threading;
using Microsoft.Extensions.Configuration;


namespace Service.Implementation
{

    public class UserService : IUserService
    {
        private readonly DataContext _dbContext;
        //private readonly IConfiguration _configuration;
        private readonly IConfiguration _configuration;
        private readonly IMailExtension _mailHelper;
        public UserService(DataContext dbContext, IMailExtension mailExtension, IConfiguration configuration)
        {
            _configuration = configuration;
            _mailHelper = mailExtension;
            _dbContext = dbContext;
        }
        public async Task<bool> Checkpermisson(int userid)
        {
            var model = await (_dbContext.Roles.Join(
                _dbContext.Users,
               p => p.ID,
               u => u.Permission,
               (p, u) => new
               {
                   UserID = u.ID,
                   PermissionID = p.ID,

               })).Where(x => x.UserID == userid).FirstOrDefaultAsync();

            return model != null ? true : false;
        }
        public async Task<object> GetListAllRoles(int userid)
        {
            var model = await _dbContext.Roles.Select(x => new
            {
                x.ID,
                x.Name,
                State = _dbContext.Users.FirstOrDefault(a => a.ID == userid && a.Role == x.ID) != null ? true : false
            }).ToListAsync();
            return model;
        }

        public async Task<bool> ChangePassword(string username, string newpass)
        {
            var item = await _dbContext.Users.FirstOrDefaultAsync(x => x.Username == username);

            try
            {

                //var pass = newpass.ToSafetyString().SHA256Hash();
                byte[] passwordHash, passwordSalt;
                CreatePasswordHash(newpass, out passwordHash, out passwordSalt);
                item.Password = newpass.SHA256Hash();
                item.PasswordHash = passwordHash;
                item.PasswordSalt = passwordSalt;
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task<bool> LockUser(int id)
        {
            var item = await _dbContext.Users.FirstOrDefaultAsync(x => x.ID == id);

            item.IsActive = !item.IsActive;
            try
            {
                _dbContext.SaveChanges();
                return true;
            }
            catch
            {

                return false;
            }
        }
        public async Task<bool> AddUserToLevel(int id, int levelid,string modifyBy)
        {
            var itemUser = await _dbContext.Users.FirstOrDefaultAsync(x => x.ID == id);
            if (itemUser != null)
            {
                if (itemUser.LevelID == levelid)
                {
                    itemUser.LevelID = 0;
                    //itemUser.ModifyBy = null;
                    itemUser.ModifyBy = modifyBy;
                }
                else
                {
                    itemUser.LevelID = levelid;
                    itemUser.ModifyBy = modifyBy;
                }
            }


            try
            {
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch
            {

                return false;
            }

        }
        public async Task<int> AddAsync(User user)
        {
            user.Code = user.Code.ToSafetyString().ToUpper();
            List<KPILevel> kpiLevelList = new List<KPILevel>();

            try
            {
                if((await _dbContext.Users.FirstOrDefaultAsync(x => x.Email.ToLower().Contains(user.Email.ToLower())) != null))
                {
                    return 3;
                }
                
                byte[] passwordHash, passwordSalt;
                CreatePasswordHash(user.Password, out passwordHash, out passwordSalt);
                user.Password = user.Password.SHA256Hash();
                user.PasswordHash = passwordHash;
                user.PasswordSalt = passwordSalt;
                user.State = true;
                user.IsActive = true;
                _dbContext.Users.Add(user);
                await _dbContext.SaveChangesAsync();
                var kpiVM = await (from kpi in _dbContext.KPIs
                                   join cat in _dbContext.Categories on kpi.CategoryID equals cat.ID
                                   select new KPIViewModel
                                   {
                                       KPIID = kpi.ID,
                                   }).ToListAsync();
                foreach (var kpi in kpiVM)
                {
                    var kpilevel = new KPILevel();
                    kpilevel.LevelID = user.ID;
                    kpilevel.KPIID = kpi.KPIID;
                    kpiLevelList.Add(kpilevel);
                }

                _dbContext.KPILevels.AddRange(kpiLevelList);
                await _dbContext.SaveChangesAsync();

                return 1;
            }
            catch
            {
                return 0;
            }
        }
        private bool disposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _dbContext.Dispose();
                }
            }
            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        public async Task<bool> Remove(int ID)
        {
            var findUser = await _dbContext.Users.FirstOrDefaultAsync(x => x.ID == ID);
            try
            {
                _dbContext.Users.Remove(findUser);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return false;
            }
        }

        public async Task<List<User>> GetAll()
        {
            return await _dbContext.Users.Where(x => x.Role > 1 && x.State == true).ToListAsync();
        }

        public async Task<object> GetUserOnline()
        {
            return await _dbContext.Users.Where(x=> x.IsOnlines == true).ToListAsync();
        }
        public async Task<object> LoadDataUser(int levelid, string code, int page, int pageSize)
        {
            var model = await _dbContext.Users.Where(x => x.Permission != 1 || x.Role != 1 && x.State == true).GroupJoin(_dbContext.Levels,
                user => user.LevelID,
                oc => oc.ID,
                (user, oc) => new { oc, user })
                .SelectMany(x => x.oc.DefaultIfEmpty(),
                (user, oc) => new { oc, user })
                    .Select(x => new
                    {
                        x.user.user.ID,
                        x.user.user.Username,
                        OCName = x.oc.Name ?? "#N/A",
                        x.user.user.Role,
                        x.user.user.TeamID,
                        ModifyBy = x.user.user.ModifyBy ?? "#N/A",
                        FullName = x.user.user.Alias,
                        Status = x.user.user.LevelID == levelid ? true : false
                    }).ToListAsync();
            if (!string.IsNullOrEmpty(code))
            {
                //model = model.Where(a => a.Username.Contains(code)).ToList();
                model = model.Where(a => a.Username.ToString().ToLower().Contains(code.ToString().ToLower())).ToList();
            }
            int totalRow = model.Count();

            int totalPage = (int)Math.Ceiling((double)totalRow / pageSize);
            var currenPage = page;
            if (totalPage > 0)
            {
                if (currenPage < 1)
                    currenPage = 1;

                if (currenPage > totalPage)
                    currenPage = totalPage.ToInt();
            }
            int skip = (currenPage - 1) * pageSize;
            model = model.OrderBy(x => x.Username)
              .Skip((page - 1) * pageSize)
              .Take(pageSize).ToList();


            return new
            {
                data = model,
                total = totalRow,
                status = true,
                page,
                skip,
                pageSize,
                totalPage,
                currenPage
            };
        }
        public async Task<object> LoadDataUser2(int levelid, string code)
        {
            var model = await _dbContext.Users.Where(x => x.Permission != 1 || x.Role != 1 && x.State == true).GroupJoin(_dbContext.Levels,
                user => user.LevelID,
                oc => oc.ID,
                (user, oc) => new { oc, user })
                .SelectMany(x => x.oc.DefaultIfEmpty(),
                (user, oc) => new { oc, user })
                    .Select(x => new
                    {
                        x.user.user.ID,
                        x.user.user.Username,
                        OCName = x.oc.Name ?? "#N/A",
                        x.user.user.Role,
                        x.user.user.TeamID,
                        FullName = x.user.user.Alias,
                        Status = x.user.user.LevelID == levelid ? true : false
                    }).ToListAsync();
            if (!string.IsNullOrEmpty(code))
            {
                model = model.Where(a => a.Username.Contains(code)).ToList();
            }
            int totalRow = model.Count();

            //int totalPage = (int)Math.Ceiling((double)totalRow / pageSize);
            //var currenPage = page;
            //if (totalPage > 0)
            //{
            //    if (currenPage < 1)
            //        currenPage = 1;

            //    if (currenPage > totalPage)
            //        currenPage = totalPage.ToInt();
            //}
            //int skip = (currenPage - 1) * pageSize;
            //model = model.OrderBy(x => x.Username)
            //  .Skip((page - 1) * pageSize)
            //  .Take(pageSize).ToList();


            return new
            {
                data = model,
                total = totalRow,
                status = true,
                //page,
                //skip,
                //pageSize,
                //totalPage,
                //currenPage
            };
        }

        public async Task<object> LoadDataUser3(int levelid, string code, int page, int pageSize)
        {
            var model = await _dbContext.Users.Where(x => x.Permission != 1 || x.Role != 1 && x.State == true).GroupJoin(_dbContext.Levels,
                user => user.LevelID,
                oc => oc.ID,
                (user, oc) => new { oc, user })
                .SelectMany(x => x.oc.DefaultIfEmpty(),
                (user, oc) => new { oc, user })
                    .Select(x => new
                    {
                        x.user.user.ID,
                        x.user.user.Username,
                        OCName = x.oc.Name ?? "#N/A",
                        x.user.user.Role,
                        x.user.user.TeamID,
                        FullName = x.user.user.Alias,
                        Status = x.user.user.LevelID == levelid ? true : false
                    }).ToListAsync();
            if (!string.IsNullOrEmpty(code))
            {
                //model = model.Where(a => a.Username.Contains(code)).ToList();
                model = model.Where(a => a.Username.ToString().ToLower().Contains(code.ToString().ToLower())).ToList();
            }
            int totalRow = model.Count();

            int totalPage = (int)Math.Ceiling((double)totalRow / pageSize);
            var currenPage = page;
            if (totalPage > 0)
            {
                if (currenPage < 1)
                    currenPage = 1;

                if (currenPage > totalPage)
                    currenPage = totalPage.ToInt();
            }
            int skip = (currenPage - 1) * pageSize;
            model = model.OrderBy(x => x.Username)
              .Skip((page - 1) * pageSize)
              .Take(pageSize).ToList();


            return new
            {
                data = model,
                total = totalRow,
                status = true,
                page,
                skip,
                pageSize,
                totalPage,
                currenPage
            };
        }
        public async Task<User> GetById(int ID)
        {
            return await _dbContext.Users.FirstOrDefaultAsync(x => x.ID == ID);
        }

        public async Task<object> FindByEmail(string email,string username)
        {
            try
            {
                var listEmail = new List<string>();
                var item = await _dbContext.Users.FirstOrDefaultAsync(x => x.Email == email && x.Username == username);
                if(item != null)
                {
                    var password = "shc@1234";
                    byte[] passwordHash, passwordSalt;
                    CreatePasswordHash(password, out passwordHash, out passwordSalt);
                    item.Password = password.SHA256Hash();
                    item.PasswordHash = passwordHash;
                    item.PasswordSalt = passwordSalt;
                    listEmail.Add(email);
                    _dbContext.SaveChanges();

                    if (listEmail.Count > 0)
                    {
                        var model = listEmail.DistinctBy(x => x);
                        //string URL = _configuration.GetSection("AppSettings:URL").ToSafetyString();
                        //string from = ConfigurationManager.AppSettings["FromEmailAddress"].ToSafetyString();
                        string content = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                       <p>Password has been reset.</p>" +
                                       "<p>Username: <b>" + item.Username + "</b> </p>" +
                                       "<p>Password: <b>" + password + "</b> </p>" +
                                       "<p>Please : <a href='" + _configuration["AppSettings:URL"] + "'>Click here to login</a></p>" +
                                       "<br/>" +

                                         @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                        <p>密碼已經被重新設定.</p>" +
                                        "<p>使用者名稱: <b>" + item.Username + "</b> </p>" +
                                         "<p>密碼: <b>" + password + "</b> </p>" +
                                        "<p>連結 : <a href='" + _configuration["AppSettings:URL"] + "'>請點選這裡登入</a></p>";
                        Thread thread = new Thread(async () =>
                        {
                            await _mailHelper.SendEmailRange(model.Select(x => x).ToList(), "[KPI System] Recovery Password(密碼重設)", content);
                        });
                        thread.Start();
                    }
                    return true;
                }
                else
                {
                    //var message = "Email not Exist";
                    return false;
                }
            }
            catch (Exception ex)
            {

                return false;
            }
        }

        public async Task<object> FindByEmail1(string email)
        {
            try
            {
                var listEmail = new List<string>();
                var item = await _dbContext.Users.FirstOrDefaultAsync(x => x.Email == email);
                if (item != null)
                {
                    var password = "shc@1234";
                    byte[] passwordHash, passwordSalt;
                    CreatePasswordHash(password, out passwordHash, out passwordSalt);
                    item.Password = password.SHA256Hash();
                    item.PasswordHash = passwordHash;
                    item.PasswordSalt = passwordSalt;
                    listEmail.Add(email);
                    _dbContext.SaveChanges();

                    if (listEmail.Count > 0)
                    {
                        var model = listEmail.DistinctBy(x => x);
                        //string URL = _configuration.GetSection("AppSettings:URL").ToSafetyString();
                        //string from = ConfigurationManager.AppSettings["FromEmailAddress"].ToSafetyString();
                        string content = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                       <p>Password has been reset.</p>" +
                                       "<p>Username: <b>" + item.Username + "</b> </p>" +
                                       "<p>Password: <b>" + password + "</b> </p>" +
                                        "<p>Please : <a href='" + _configuration["AppSettings:URL"] + "'>Click here to login</a></p>" +
                                         "<br/>" +

                                         @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                        <p>密碼已經被重新設定.</p>" +
                                        "<p>使用者名稱: <b>" + item.Username + "</b> </p>" +
                                         "<p>密碼: <b>" + password + "</b> </p>" +
                                        "<p>連結 : <a href='" + _configuration["AppSettings:URL"] + "'>請點選這裡登入</a></p>";
                        Thread thread = new Thread(async () =>
                        {
                            await _mailHelper.SendEmailRange(model.Select(x => x).ToList(), "[KPI System] Recovery Password(密碼重設)", content);
                        });
                        thread.Start();
                    }
                    return true;
                }
                else
                {
                    //var message = "Email not Exist";
                    return false;
                }
            }
            catch (Exception ex)
            {

                return false;
            }
        }
        private void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using (var hmac = new System.Security.Cryptography.HMACSHA512())
            {
                passwordSalt = hmac.Key;
                passwordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
            }
        }

        public async Task<bool> Update(User user)
        {
            //var item = await GetById(user.ID);
            //item.Username = user.Username;
            //try
            //{
            //    await _dbContext.SaveChangesAsync();
            //    return true;

            //}
            //catch
            //{

            //    return false;
            //}
            var code = user.Code.ToSafetyString().ToUpper();
            var item = await _dbContext.Users.FirstOrDefaultAsync(x => x.ID == user.ID);

            item.Username = user.Username;
            item.Code = code;
            item.FullName = user.FullName;
            item.Email = user.Email;
            item.Skype = user.Skype;
            item.Permission = user.Permission;
            item.Role = user.Permission;
            item.Alias = user.Alias;
            try
            {
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                //logging
                return false;
            }
        }


        public async Task<List<User>> GetAllById(int Id)
        {
            return await _dbContext.Users.Where(x => x.ID == Id).ToListAsync();

        }


        public async Task<PagedList<User>> GetAllPaging(string keyword, int page, int pageSize)
        {
            return await PagedList<User>.CreateAsync(_dbContext.Users, page, pageSize);
        }

        public Task<object> Sidebars(int role, int userid)
        {
            throw new NotImplementedException();
        }

        public async Task<object> LoadData(string name, int page, int pageSize)
        {
            var model = await _dbContext.Users.Select(x => new
            {
                x.ID,
                x.Username,
                x.FullName,
                x.Code,
                PermissionName = _dbContext.Roles.FirstOrDefault(a => a.ID == x.Role).Name,
                x.State,
                x.Email,
                x.Skype,
                x.UserID,
                x.CreatedBy,
                x.Permission,
                x.Alias,
                x.IsActive

            }).ToListAsync();

            if (!string.IsNullOrEmpty(name))
            {
                name = name.ToUpper().ToSafetyString();
                model = model.Where(x => x.Code.Contains(name) || x.Username.Contains(name)).ToList();
            }

            int totalRow = model.Count();
            int totalPage = (int)Math.Ceiling((double)totalRow / pageSize);
            var currenPage = page;
            if (totalPage > 0)
            {
                if (currenPage < 1)
                    currenPage = 1;

                if (currenPage > totalPage)
                    currenPage = totalPage.ToInt();
            }
            model = model.OrderByDescending(x => x.ID)
              .Skip((page - 1) * pageSize)
              .Take(pageSize).ToList();


            return new
            {
                data = model,
                total = totalRow,
                status = true,
                page,
                pageSize,
                totalPage,
                currenPage
            };
        }

        Task<bool> ICommonService<User>.Add(User entity)
        {
            throw new NotImplementedException();
        }

        public Task<PagedList<User>> GetAllPaging(string keyword, string lang, int page, int pageSize)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetAllPaging2(string keyword, string lang, int page, int pageSize)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetAllPaging3(string keyword, string lang, int page, int pageSize)
        {
            throw new NotImplementedException();
        }

        public Task<bool> AddAsync(CategoryVM entity)
        {
            throw new NotImplementedException();
        }
    }
}