using Models.Data;
using Models.EF;
using Models.ViewModels.Comment;
using Models.ViewModels.KPI;
using Microsoft.EntityFrameworkCore;
using Service.Helpers;
using Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.ViewModels.Category;
using Service.SignalR;
using Microsoft.AspNetCore.SignalR;

namespace Service.Implementation
{

    public class KPIService : IKPIService
    {
        private readonly DataContext _dbContext;
        private readonly IHubContext<HenryHub> _hubContext;
        public KPIService(DataContext dbContext, IHubContext<HenryHub> hubContext)
        {
            _dbContext = dbContext;
            _hubContext = hubContext;
        }

        public async Task<bool> AddAsync(KPIVM entity)
        {
            try
            {
                //string code = string.Empty;
                for (int i = 1; i < 10000; i++)
                {
                    string code = i.ToString("D4");
                    if (!await _dbContext.KPIs.AnyAsync(x => x.Code == code))
                    {
                        entity.Code = code;
                        break;
                    }
                }
                var kpi = new KPI { ID = entity.ID,LevelID=1,CategoryCode=entity.Code, Unit = entity.Unit, Name = entity.NameEn, CreateTime = DateTime.Now, Code = entity.Code };
                _dbContext.KPIs.Add(kpi);
                await _dbContext.SaveChangesAsync();

                var listKPILangs = new List<KPILang> {
                    new KPILang { Name = entity.NameVI, LanguageID = "vi", KPIID = kpi.ID},
                    new KPILang { Name = entity.NameTW, LanguageID = "zh-TW", KPIID=kpi.ID},
                    new KPILang { Name = entity.NameEn, LanguageID = "en", KPIID=kpi.ID},
                    };
                _dbContext.KPILangs.AddRange(listKPILangs);
                List<KPILevel> kpiLevelList = new List<KPILevel>();
                var levels = _dbContext.Levels.ToList();

                foreach (var level in levels)
                {
                    var kpilevel = new KPILevel();
                    kpilevel.LevelID = level.ID;
                    kpilevel.KPIID = kpi.ID;
                    kpiLevelList.Add(kpilevel);
                }

                _dbContext.KPILevels.AddRange(kpiLevelList);
              await  _dbContext.SaveChangesAsync();

                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public async Task<bool> AddAsync2(KPIVM entity)
        {
            try
            {
                //if (entity.NameVI == null)
                //{
                //    entity.NameVI = entity.NameEn;
                //}
                //string code = string.Empty;
                for (int i = 1; i < 10000; i++)
                {
                    string code = i.ToString("D4");
                    if (!await _dbContext.KPIs.AnyAsync(x => x.Code == code))
                    {
                        entity.Code = code;
                        break;
                    }
                }
                var kpi = new KPI 
                { 
                    ID = entity.ID, 
                    LevelID = 1, 
                    CategoryCode = entity.Code, 
                    Unit = entity.Unit, 
                    Description = entity.Description,
                    KPI_Kind_ID = entity.KPI_Kind_ID,
                    Name = entity.NameEn, 
                    CreateTime = DateTime.Now, 
                    Code = entity.Code, 
                    UserID = entity.UserID,
                    Status = entity.Status
                };
                _dbContext.KPIs.Add(kpi);
                await _dbContext.SaveChangesAsync();

                var listKPILangs = new List<KPILang> {
                    new KPILang { Name = entity.NameVI, LanguageID = "vi", KPIID = kpi.ID},
                    new KPILang { Name = entity.NameTW, LanguageID = "zh-TW", KPIID = kpi.ID},
                    new KPILang { Name = entity.NameEn, LanguageID = "en", KPIID = kpi.ID},
                    };
                _dbContext.KPILangs.AddRange(listKPILangs);
                List<KPILevel> kpiLevelList = new List<KPILevel>();
                var levels = _dbContext.Levels.ToList();

                foreach (var level in levels)
                {
                    var kpilevel = new KPILevel();
                    kpilevel.LevelID = level.ID;
                    kpilevel.KPIID = kpi.ID;
                    kpiLevelList.Add(kpilevel);
                }

                _dbContext.KPILevels.AddRange(kpiLevelList);
                await _dbContext.SaveChangesAsync();
                

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        //start kpi_kind
        public async Task<bool> AddKPIKINDAsync(KPIKINDVM entity)
        {
            var kpi_kind = new KPIKind
            {
                ID = entity.ID,
                KPI_Kind_Name = entity.NameEn
            };

            _dbContext.KPI_Kinds.Add(kpi_kind);
            await _dbContext.SaveChangesAsync();

            var listKPIKindLangs = new List<KPIKindLang> {
                    new KPIKindLang { Name = entity.NameVI, LanguageID = "vi", KPI_Kind_ID = kpi_kind.ID},
                    new KPIKindLang { Name = entity.NameTW, LanguageID = "zh-TW", KPI_Kind_ID = kpi_kind.ID},
                    new KPIKindLang { Name = entity.NameEn, LanguageID = "en", KPI_Kind_ID = kpi_kind.ID},
                    };
            _dbContext.KPI_Kind_Langs.AddRange(listKPIKindLangs);
            try
            {
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


        public async Task<bool> UpdateKPIKIND(KPIKINDVM entity)
        {
            try
            {
                var item = await _dbContext.KPI_Kinds.FirstOrDefaultAsync(x => x.ID == entity.ID);
                item.KPI_Kind_Name = entity.NameEn;
                var listLang = _dbContext.KPI_Kind_Langs.Where(x => x.KPI_Kind_ID  == item.ID).ToList();
                if (listLang == null || listLang.Count == 0)
                {
                    var listKPILangs = new List<KPIKindLang> {
                    new KPIKindLang { Name = entity.NameVI, LanguageID = "vi", KPI_Kind_ID=item.ID},
                    new KPIKindLang { Name = entity.NameTW, LanguageID = "zh-TW", KPI_Kind_ID=item.ID},
                    new KPIKindLang { Name = entity.NameEn, LanguageID = "en", KPI_Kind_ID=item.ID},
                    };
                    _dbContext.KPI_Kind_Langs.AddRange(listKPILangs);
                }
                else
                {
                    listLang.ForEach(x =>
                    {
                        switch (x.LanguageID)
                        {
                            case "zh-TW":
                                x.Name = entity.NameTW;
                                break;
                            case "en":
                                x.Name = entity.NameEn;
                                break;
                            case "vi":
                                x.Name = entity.NameVI;
                                break;
                            default:
                                break;
                        }
                    });
                }

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

        public async Task<bool> RemoveKpiKind(int Id)
        {

            try
            {
                var kpi = await _dbContext.KPI_Kinds.FindAsync(Id);
                _dbContext.KPI_Kinds.Remove(kpi);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return false;
            }

        }

        public async Task<object> GetAllKpiKind()
        {
            var arrayLang = new string[] { "en", "vi", "zh-TW" };
            string LangE = "en";
            string LangC = "zh-TW";
            string LangV = "vi";
            int index = 1;
            var model = await _dbContext.KPI_Kinds.Include(x => x.KPIKindLangs).Select(
                x => new KPIKINDVM
                {
                    ID = x.ID,
                    Index = index.ToSafetyString(),
                    NameEn =  x.KPIKindLangs.FirstOrDefault(x => x.LanguageID == LangE).Name,
                    NameTW = x.KPIKindLangs.FirstOrDefault(x => x.LanguageID == LangC).Name,
                    NameVI = x.KPIKindLangs.FirstOrDefault(x => x.LanguageID == LangV).Name,
                }
            ).ToListAsync();

            model.ForEach(item =>
            {
                item.Index = index.ToString();
                index++;
            });

            return model;
        }

        public async Task<object> GetAllKpiKindWithLang(string lang)
        {
            //var model = await _dbContext.KPI_Kinds.ToListAsync();

            //var model = await _dbContext.KPI_Kinds.Select(x => new
            //{
            //    x.ID,
            //    Name = _dbContext.KPI_Kind_Langs.FirstOrDefault(x => x.LanguageID == lang).Name ?? x.KPI_Kind_Name,
                
            //}).ToListAsync();

            var model = await _dbContext.KPI_Kinds.Include(x => x.KPIKindLangs).Select(
                x => new
                {
                    x.ID,
                    Name = x.KPIKindLangs.FirstOrDefault(x => x.LanguageID == lang).Name ?? x.KPI_Kind_Name,
                
                }).ToListAsync();
            return model;
        }
        //end kpi_kind

        public async Task<bool> AddKPILevel(KPILevel entity)
        {
            _dbContext.KPILevels.Add(entity);
            try
            {
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public int Total()
        {
            return _dbContext.KPIs.ToList().Count();
        }
        public async Task<bool> UpdateAsync(KPIVM entity)
        {
            entity.Code = entity.Code.ToSafetyString().ToUpper();
            try
            {
                var item = await _dbContext.KPIs.FirstOrDefaultAsync(x => x.ID == entity.ID);
                item.Unit = entity.Unit;
                item.KPI_Kind_ID = entity.KPI_Kind_ID;
                item.Name = entity.NameEn;
                item.Description = entity.Description;
                item.Status = entity.Status;
                var listLang = _dbContext.KPILangs.Where(x => x.KPIID == item.ID).ToList();
                if (listLang == null || listLang.Count == 0)

                {
                    var listKPILangs = new List<KPILang> {
                    new KPILang { Name = entity.NameVI, LanguageID = "vi", KPIID = item.ID },
                    new KPILang { Name = entity.NameTW, LanguageID = "zh-TW", KPIID = item.ID },
                    new KPILang { Name = entity.NameEn, LanguageID = "en", KPIID = item.ID },
                    };

                    _dbContext.KPILangs.AddRange(listKPILangs);
                }
                else
                {
                    listLang.ForEach(x =>
                    {
                        switch (x.LanguageID)
                        {
                            case "zh-TW":
                                x.Name = entity.NameTW;
                                break;
                            case "en":
                                x.Name = entity.NameEn;
                                break;
                            case "vi":
                                x.Name = entity.NameVI;
                                break;
                            default:
                                break;
                        }
                    });
                }

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
        public List<Category> GetCategoryCode()
        {
            return _dbContext.Categories.ToList();
        }

        public async Task<bool> Delete(int id)
        {
            try
            {
                var kpi = await _dbContext.KPIs.FindAsync(id);
                _dbContext.KPIs.Remove(kpi);

                var kpiLevel = await _dbContext.KPILevels.Where(x => x.KPIID == id).ToListAsync();
                _dbContext.KPILevels.RemoveRange(kpiLevel);
                await _dbContext.SaveChangesAsync();
                
                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return false;
            }

        }

        public async Task<bool> Delete2(int id, int userid)
        {
            var user = _dbContext.Users.FirstOrDefault(x => x.ID == userid);

            if (user.Permission == 1) {
                try
                {
                    var kpi = await _dbContext.KPIs.FindAsync(id);
                    _dbContext.KPIs.Remove(kpi);

                    var kpiLevel = await _dbContext.KPILevels.Where(x => x.KPIID == id).ToListAsync();
                    _dbContext.KPILevels.RemoveRange(kpiLevel);
                    await _dbContext.SaveChangesAsync();
                    return true;
                }
                catch (Exception ex)
                {
                    var message = ex.Message;
                    return false;
                }
            }
            else
            {
                var kpi = await _dbContext.KPIs.Where(x=>x.UserID == userid).FirstOrDefaultAsync();
                _dbContext.KPIs.Remove(kpi);

                var kpiLevel = await _dbContext.KPILevels.Where(x => x.KPIID == id).ToListAsync();
                _dbContext.KPILevels.RemoveRange(kpiLevel);
                await _dbContext.SaveChangesAsync();
                return true;
            }

             

        }
        public async Task<object> GetAllAjax()
        {
            return await _dbContext.KPIs.Select(x => new
            {
                x.ID,
                x.Code,
                x.Name,
                x.LevelID,
                CategoryName = _dbContext.Categories.FirstOrDefault(a => a.ID == x.CategoryID),
                Unit = _dbContext.Units.FirstOrDefault(u => u.ID == x.Unit)

            }).ToListAsync();
        }
        public async Task<KPI> GetbyId(int ID)
        {
            return await _dbContext.KPIs.FirstOrDefaultAsync(x => x.ID == ID);
        }
        public async Task<object> ListCategory()
        {
            return await _dbContext.Categories.ToListAsync();
        }

        public async Task<object> LoadData(int? categoryID, string name , string lang , int page = 1, int pageSize = 10)
        {
            var arrayLang = new string[] { "en", "vi", "zh-TW" };
            string LangE = "en";
            string LangC = "zh-TW";
            string LangV = "vi";
            categoryID = categoryID.ToInt();
            name = name.ToSafetyString().ToLower();
            var user = _dbContext.Users.ToList();
            int index = 1;
            var model = await _dbContext.KPIs.Select(
                x => new KPIViewModel
                {
                    ID = x.ID,
                    Name = x.Name,
                    Names = x.KPILangs.Where(a => arrayLang.Contains(a.LanguageID)).Select(a => a.Name).ToList(),
                    EnglishName = x.KPILangs.FirstOrDefault(x => x.LanguageID == LangE).Name,
                    ChineseName = x.KPILangs.FirstOrDefault(x => x.LanguageID == LangC).Name,
                    LocalLanguage = x.KPILangs.FirstOrDefault(x => x.LanguageID == LangV).Name,
                    Code = x.Code,
                    UserID = x.UserID,
                    Index = index.ToSafetyString(),
                    LevelID = x.LevelID,
                    KPI_Kind_ID = x.KPI_Kind_ID,
                    Description = x.Description,
                    KPI_Kind_Name = _dbContext.KPI_Kinds.FirstOrDefault(y => y.ID == x.KPI_Kind_ID).KPI_Kind_Name,
                    CreatedBy = _dbContext.Users.FirstOrDefault(b => b.ID == x.UserID).Alias,
                    CategoryID = x.CategoryID,
                    CategoryName = _dbContext.Categories.FirstOrDefault(c => c.ID == x.CategoryID).Name,
                    Unit = _dbContext.Units.FirstOrDefault(u => u.ID == x.Unit).Name,
                    UnitID = _dbContext.Units.FirstOrDefault(u => u.ID == x.Unit).ID,
                    CreateTime = x.CreateTime,
                    Status = x.Status
                }
                ).ToListAsync();
            if (!name.IsNullOrEmpty())
            {
                model = model.Where(x => x.Name.ToString().ToLower().Contains(name.ToString().ToLower())).ToList();
            }
            if (categoryID != 0)
            {
                model = model.Where(x => x.CategoryID == categoryID).ToList();
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
            model = model.OrderBy(x => x.KPI_Kind_Name).ToList();
            model.ForEach(item =>
            {
                item.Index = index.ToString();
                index++;
            });
            var pagedList = PagedList<KPIViewModel>.Create(model, page, pageSize);
            return new
            {
                data = model,
                total = model.Count,
                pageCount = pagedList.TotalPages,
                status = true,
                page,
                pageSize,
                totalPage,
                currenPage
            };
        }

        public async Task<object> LoadData2(int? categoryID, string name, string lang, int page = 1, int pageSize = 10)
        {
            var arrayLang = new string[] { "en", "vi", "zh-TW" };
            categoryID = categoryID.ToInt();
            name = name.ToSafetyString().ToLower();
            var model = await _dbContext.KPIs.Select(
                x => new KPIViewModel
                {
                    ID = x.ID,
                    Name = x.Name,
                    Names = x.KPILangs.Where(a => arrayLang.Contains(a.LanguageID)).Select(a => a.Name).ToList(),
                    Code = x.Code,
                    LevelID = x.LevelID,
                    CategoryID = x.CategoryID,
                    UserID = x.UserID,
                    CreatedBy = _dbContext.Users.FirstOrDefault(b => b.ID == x.UserID).Alias,
                    CategoryName = _dbContext.Categories.FirstOrDefault(c => c.ID == x.CategoryID).Name,
                    Unit = _dbContext.Units.FirstOrDefault(u => u.ID == x.Unit).Name,
                    UnitID = _dbContext.Units.FirstOrDefault(u => u.ID == x.Unit).ID,
                    CreateTime = x.CreateTime,
                    Status = x.Status
                }).ToListAsync();
            if (!name.IsNullOrEmpty())
            {
                model = model.Where(x => x.Name.ToString().ToLower().Contains(name.ToString().ToLower())).ToList();
            }
            if (categoryID != 0)
            {
                model = model.Where(x => x.CategoryID == categoryID).ToList();
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
            model = model.OrderByDescending(x => x.CreateTime).ToList();
            var pagedList = PagedList<KPIViewModel>.Create(model, page, pageSize);
            return new
            {
                data = pagedList,
                total = pagedList.Count,
                pageCount = pagedList.TotalPages,
                status = true,
                page,
                pageSize,
                totalPage,
                currenPage
            };
        }

        public async Task<object> Autocomplete(string search)
        {
            if (search != "")
                return await _dbContext.KPIs.Where(x => x.Name.Contains(search)).Select(x => x.Name).Take(5).ToListAsync();
            else
                return "";
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

        public async Task<bool> Remove(int Id)
        {

            try
            {
                var kpi = await _dbContext.KPIs.FindAsync(Id);
                _dbContext.KPIs.Remove(kpi);

                var kpiLevel = await _dbContext.KPILevels.Where(x => x.KPIID == Id).ToListAsync();
                _dbContext.KPILevels.RemoveRange(kpiLevel);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return false;
            }

        }

        

        public async Task<object> GetByIdd(int Id)
        {
            return await _dbContext.KPIs
                .Include(x => x.KPILangs)
                .Where(x => x.ID == Id)
                .Select(x => new
                {
                    NameVI = x.KPILangs.FirstOrDefault(x => x.LanguageID == "vi").Name,
                    NameEn = x.KPILangs.FirstOrDefault(x => x.LanguageID == "en").Name,
                    NameTW = x.KPILangs.FirstOrDefault(x => x.LanguageID == "zh-TW").Name,
                    x.ID,
                    x.Unit,
                    x.KPI_Kind_ID,
                    x.Description,
                    x.Code,
                    x.Status
                }).FirstOrDefaultAsync();
        }

        public Task<List<KPI>> GetAllById(int Id)
        {
            throw new NotImplementedException();
        }

        public async Task<PagedList<KPI>> GetAllPaging(string keyword, int page, int pageSize)
        {
            var source = _dbContext.KPIs.AsQueryable();
            if (!keyword.IsNullOrEmpty())
            {
                source = source.Where(x => x.Name.ToString().ToLower().Contains(keyword.ToString().ToLower()));
            }
            return await PagedList<KPI>.CreateAsync(source, page, pageSize);
        }
        public async Task<object> GetAll(string kpilevelcode, string period)
        {
            if (!string.IsNullOrEmpty(kpilevelcode) && !string.IsNullOrEmpty(period))
            {
                //label chartjs
                var item = await _dbContext.KPILevels.FirstOrDefaultAsync(x => x.KPILevelCode == kpilevelcode);
                var modelLevel = await _dbContext.Levels.FirstOrDefaultAsync(x => x.ID == item.LevelID);
                var label = modelLevel.Name;
                //datasets chartjs
                var model = await _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode).ToListAsync();

                if (period == "W".ToUpper())
                {

                    var datasets = model.Where(x => x.Period == "W").OrderBy(x => x.Week).Select(x => x.Value).ToArray();

                    //data: labels chartjs
                    var labels = model.Where(x => x.Period == "W").OrderBy(x => x.Week).Select(x => x.Week).ToArray();


                    return new
                    {
                        datasets,
                        labels,
                        label
                    };
                }
                else if (period == "M".ToUpper())
                {

                    var datasets = model.Where(x => x.Period == "M").OrderBy(x => x.Month).Select(x => x.Value).ToArray();

                    //data: labels chartjs
                    var labels = model.Where(x => x.Period == "M").OrderBy(x => x.Month).Select(x => x.Month).ToArray();
                    return new
                    {
                        datasets,
                        labels,
                        label
                    };
                }
                else if (period == "Q".ToUpper())
                {
                    var datasets = model.Where(x => x.Period == "Q").OrderBy(x => x.Quarter).Select(x => x.Value).ToArray();

                    //data: labels chartjs
                    var labels = model.Where(x => x.Period == "Q").OrderBy(x => x.Quarter).Select(x => x.Quarter).ToArray();
                    return new
                    {
                        datasets,
                        labels,
                        label
                    };
                }
                else if (period == "Y".ToUpper())
                {

                    var datasets = model.Where(x => x.Period == "Y").OrderBy(x => x.Year).Select(x => x.Value).ToArray();

                    //data: labels chartjs
                    var labels = model.Where(x => x.Period == "Y").OrderBy(x => x.Year).Select(x => x.Year).ToArray();
                    return new
                    {
                        datasets,
                        labels,
                        label
                    };
                }
                else
                {
                    return "";
                }
            }
            else
            {
                return "";
            }
        }
        public async Task<object> ListComments(int dataid, int userid)
        {

            var actionPlan = _dbContext.ActionPlans;
            //Cat chuoi
            //lay tat ca comment cua kpi
            var listcmts = await _dbContext.Comments.Where(x => x.DataID == dataid).ToListAsync();

            //Tong tat ca cac comment cua kpi
            var totalcomment = listcmts.Count();

            //Lay ra tat ca lich su cmt
            var seenCMT = _dbContext.SeenComments;

            //Lay ra tat ca lich su cmt
            var user = _dbContext.Users;

            //Lay ra tat ca cac comment cua kpi(userid nao post comment len thi mac dinh userid do da xem comment cua chinh minh roi)
            var data = await _dbContext.Comments.Where(x => x.DataID == dataid)
               .Select(x => new CommentViewModel
               {
                   CommentID = x.ID,
                   UserID = x.UserID,
                   CommentMsg = x.CommentMsg,
                   //KPILevelCode = x.KPILevelCode,
                   CommentedDate = x.CommentedDate,
                   FullName = user.FirstOrDefault(a => a.ID == x.UserID).FullName,
                   //Period = x.Period,
                   Read = seenCMT.FirstOrDefault(a => a.CommentID == x.ID && a.UserID == userid) == null ? true : false,
                   IsHasTask = actionPlan.FirstOrDefault(a => a.DataID == dataid && a.CommentID == x.ID) == null ? false : true,
                   Task = actionPlan.FirstOrDefault(a => a.DataID == dataid && a.CommentID == x.ID) == null ? false : true
               })
               .OrderByDescending(x => x.CommentedDate)
               .ToListAsync();

            return new
            {
                data,
                total = _dbContext.Comments.Where(x => x.DataID == dataid).Count()
            };

        }

        public Task<object> GetAllAjax(string kpilevelcode, string period)
        {
            throw new NotImplementedException();
        }

        public async Task<List<KPI>> GetAll()
        {
            return await _dbContext.KPIs.ToListAsync();
        }

        public Task<bool> Add(KPI entity)
        {
            throw new NotImplementedException();
        }

        Task<KPI> ICommonService<KPI>.GetById(int Id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> Update(KPI entity)
        {
            
            throw new NotImplementedException();
        }

        public Task<PagedList<KPI>> GetAllPaging(string keyword, string lang, int page, int pageSize)
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
