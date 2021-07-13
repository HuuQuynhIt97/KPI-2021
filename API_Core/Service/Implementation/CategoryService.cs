using Models.Data;
using Models.EF;
using Microsoft.EntityFrameworkCore;

using Service.Helpers;
using Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.ViewModels.Category;

namespace Service.Implementation
{

    public class CategoryService : ICategoryService
    {
        private readonly DataContext _dbContext;
        //start cate_kind
        public async Task<bool> AddCateKind(CateKind entity)
        {
            _dbContext.Cate_Kinds.Add(entity);
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
        public async Task<bool> UpdateCateKind(CateKind entity)
        {
            var item = await _dbContext.Cate_Kinds.FirstOrDefaultAsync(x => x.ID == entity.ID);

            item.Cate_Kind_Name = entity.Cate_Kind_Name;

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
        public async Task<bool> RemoveCateKind(int Id)
        {

            try
            {
                var cate_kind = await _dbContext.Cate_Kinds.FindAsync(Id);
                _dbContext.Cate_Kinds.Remove(cate_kind);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return false;
            }

        }

        public async Task<object> GetAllCateKind()
        {
            return await _dbContext.Cate_Kinds.ToListAsync();
        }
        //end cate_kind

        public CategoryService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<bool> Add(Category entity)
        {
            entity.Code = entity.Code.ToUpper();

            try
            {
                _dbContext.Categories.Add(entity);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch
            {

                return false;
            }
        }


        public async Task<bool> AddAsync(CategoryVM entity)
        {
            var list_level = entity.LevelID2.DistinctBy( x => x.id );
            entity.Code = entity.Code.ToUpper();

            try
            {
                //if (entity.NameVI == null)
                //{
                //    entity.NameVI = entity.NameEn;
                //}
                var cat = new Category
                {
                    Name = entity.NameEn,
                    Code = entity.Code,
                    LevelID = 0,
                    Cate_Kind_ID = entity.Cate_Kind_ID,
                    UserID = entity.UserID,
                    CreateTime = DateTime.Now
                };
                _dbContext.Categories.Add(cat);
                await _dbContext.SaveChangesAsync();
                var listCategoryLangs = new List<CategoryLang> {
                        new CategoryLang { Name = entity.NameVI, LanguageID = "vi", CategoryID = cat.ID},
                        new CategoryLang { Name = entity.NameTW, LanguageID = "zh-TW", CategoryID = cat.ID},
                        new CategoryLang { Name = entity.NameEn, LanguageID = "en", CategoryID = cat.ID},
                        };
                _dbContext.CategoryLangs.AddRange(listCategoryLangs);
                await _dbContext.SaveChangesAsync();
                foreach (var item in list_level)
                {

                    var cat_level = new Models.EF.CategoryLevel
                    {
                        Cate_ID = cat.ID,
                        Level_ID = item.id.ToInt()
                    };
                    _dbContext.CategoryLevels.Add(cat_level);
                    await _dbContext.SaveChangesAsync();
                    
                }
                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return false;
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

        public async Task<List<Category>> GetAll()
        {
            return await _dbContext.Categories.ToListAsync();
        }


        public async Task<List<Category>> GetAllById(int Id)
        {
            return await _dbContext.Categories.Where(x => x.ID == Id).ToListAsync();
        }

        public async Task<object> GetAllPaging2(string keyword, string lang, int page = 1, int pageSize = 10)
        {
            var arr = new string[] { "vi", "en", "zh-TW" };
            var arrEn = new string[] { "en" };
            var arrZh = new string[] { "zh-TW" };
            var arrLocal = new string[] { "vi" };

            var arrayLang = new string[] { "en", "vi", "zh-TW" };
            string LangE = "en";
            string LangC = "zh-TW";
            string LangV = "vi";

            keyword = keyword.ToSafetyString();
            int index = 1;
            var model = await _dbContext.Categories.Include(x => x.CategoryLangs).Select(x => new CategoryViewModel
            {
                ID = x.ID,
                Names = x.CategoryLangs.Where(a => arr.Contains(a.LanguageID)).Select(a => a.Name).ToList(),
                EngLishName = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == LangE).Name,
                ChineseName = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == LangC).Name,
                LocalLanguage = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == LangV).Name,
                Name = x.Name,
                UserID = x.UserID,
                Index = index.ToSafetyString(),
                KPI_Kind_ID = x.Cate_Kind_ID,
                KPI_Kind_Name = _dbContext.KPI_Kinds.FirstOrDefault(b => b.ID == x.Cate_Kind_ID).KPI_Kind_Name,
                CreatedBy = _dbContext.Users.FirstOrDefault(b => b.ID == x.UserID).Alias,
                LevelID = x.LevelID,
                Level = _dbContext.CategoryLevels.Where(y => y.Cate_ID == x.ID).OrderBy(y => y.Level_ID).Select(z => z.Level_ID.ToString()).ToList(),
                Code = x.Code,
                CreateTime = x.CreateTime
            }).ToListAsync();

            if (!keyword.IsNullOrEmpty())
            {
                model = model.Where(x => x.Name.ToString().ToLower().Contains(keyword.ToString().ToLower())).ToList();
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
            var pagedList = PagedList<CategoryViewModel>.Create(model, page, pageSize);
            return new
            {
                data = model,
                total = model.Count(),
                pageCount = pagedList.TotalPages,
                status = true,
                page,
                pageSize,
                totalPage,
                currenPage
            };

        }

        //public async Task<object> GetAllPaging2(string keyword, string lang, int page = 1, int pageSize = 10)
        //{
        //    var arr = new string[] { "vi", "en", "zh-TW" };
        //    var arrEn = new string[] { "en" };
        //    var arrZh = new string[] { "zh-TW" };
        //    var arrLocal = new string[] { "vi" };

        //    var arrayLang = new string[] { "en", "vi", "zh-TW" };
        //    string LangE = "en";
        //    string LangC = "zh-TW";
        //    string LangV = "vi";

        //    keyword = keyword.ToSafetyString();
        //    int index = 1;
        //    var model = await _dbContext.Categories.Include(x => x.CategoryLangs).Select(x => new CategoryViewModel
        //    {
        //        ID = x.ID,
        //        Names = x.CategoryLangs.Where(a => arr.Contains(a.LanguageID)).Select(a => a.Name).ToList(),
        //        EngLishName = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == LangE).Name,
        //        ChineseName = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == LangC).Name,
        //        LocalLanguage = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == LangV).Name,
        //        Name = x.Name,
        //        UserID = x.UserID,
        //        Index = index.ToSafetyString(),
        //        KPI_Kind_ID = x.Cate_Kind_ID,
        //        KPI_Kind_Name = _dbContext.KPI_Kinds.FirstOrDefault(b => b.ID == x.Cate_Kind_ID).KPI_Kind_Name,
        //        CreatedBy = _dbContext.Users.FirstOrDefault(b => b.ID == x.UserID).Alias,
        //        LevelID = x.LevelID,
        //        Code = x.Code,
        //        CreateTime = x.CreateTime
        //    }).ToListAsync();

        //    var models = model.GroupBy(x => new { x.EngLishName });
        //    var todolist = new List<CategoryViewModel>();
        //    foreach (var item in models)
        //    {
        //        var items = item.FirstOrDefault();
        //        var level_list = item.Select(x => x.LevelID.ToString()).OrderBy(x => x).ToList();
        //        var itemTodolist = new CategoryViewModel();
        //        itemTodolist.ID = items.ID;
        //        itemTodolist.Names = items.Names;
        //        itemTodolist.EngLishName = items.EngLishName;
        //        itemTodolist.ChineseName = items.ChineseName;
        //        itemTodolist.LocalLanguage = items.LocalLanguage;
        //        itemTodolist.Name = items.Name;
        //        itemTodolist.UserID = items.UserID;
        //        itemTodolist.Index = index.ToSafetyString();
        //        itemTodolist.KPI_Kind_ID = items.KPI_Kind_ID;
        //        itemTodolist.KPI_Kind_Name = items.KPI_Kind_Name;
        //        itemTodolist.CreatedBy = _dbContext.Users.FirstOrDefault(b => b.ID == items.UserID).Alias;
        //        itemTodolist.LevelID = items.LevelID;
        //        itemTodolist.Level = level_list;
        //        itemTodolist.Code = items.Code;
        //        itemTodolist.CreateTime = items.CreateTime;
        //        todolist.Add(itemTodolist);
        //    }

        //    if (!keyword.IsNullOrEmpty())
        //    {
        //        model = model.Where(x => x.Name.ToString().ToLower().Contains(keyword.ToString().ToLower())).ToList();
        //    }

        //    int totalRow = model.Count();
        //    int totalPage = (int)Math.Ceiling((double)totalRow / pageSize);
        //    var currenPage = page;
        //    if (totalPage > 0)
        //    {
        //        if (currenPage < 1)
        //            currenPage = 1;

        //        if (currenPage > totalPage)
        //            currenPage = totalPage.ToInt();
        //    }
        //    model = model.OrderBy(x => x.KPI_Kind_Name).ToList();
        //    //var models = model.GroupBy(x => new { x.EngLishName }).ToList();
        //    model.ForEach(item =>
        //    {
        //        item.Index = index.ToString();
        //        index++;
        //    });
        //    var pagedList = PagedList<CategoryViewModel>.Create(model, page, pageSize);

        //    return new
        //    {
        //        data = model,
        //        total = model.Count(),
        //        pageCount = pagedList.TotalPages,
        //        status = true,
        //        data2 = todolist,
        //        page,
        //        pageSize,
        //        totalPage,
        //        currenPage
        //    };

        //}

        public async Task<object> GetAllPaging3(string keyword, string lang, int page = 1, int pageSize = 10)
        {
            var arr = new string[] { "vi", "en", "zh-TW" };
            var arrEn = new string[] { "en" };
            var arrZh = new string[] { "zh-TW" };
            var arrLocal = new string[] { "vi" };
            var arrayLang = new string[] { "en", "vi", "zh-TW" };
            string LangE = "en";
            string LangC = "zh-TW";
            string LangV = "vi";
            keyword = keyword.ToSafetyString();

            var model = await _dbContext.Categories.Include(x => x.CategoryLangs).Select(x => new CategoryViewModel
            {

                ID = x.ID,
                Names = x.CategoryLangs.Where(a => arr.Contains(a.LanguageID)).Select(a => a.Name).ToList(),
                EngLishName = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == LangE).Name,
                ChineseName = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == LangC).Name,
                LocalLanguage = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == LangV).Name,
                Name = x.Name,
                UserID = x.UserID,
                KPI_Kind_ID = x.Cate_Kind_ID,
                KPI_Kind_Name = _dbContext.KPI_Kinds.FirstOrDefault(b => b.ID == x.Cate_Kind_ID).KPI_Kind_Name,
                CreatedBy = _dbContext.Users.FirstOrDefault(b => b.ID == x.UserID).Alias,
                LevelID = x.LevelID,
                Code = x.Code,
                CreateTime = x.CreateTime

            }).ToListAsync();

            if (!keyword.IsNullOrEmpty())
            {
                model = model.Where(x => x.Name.ToString().ToLower().Contains(keyword.ToString().ToLower())).ToList();
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

            var pagedList = PagedList<CategoryViewModel>.Create(model, page, pageSize);

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

        public async Task<Category> GetById(int Id)
        {
            return await _dbContext.Categories.FirstOrDefaultAsync(x => x.ID == Id);
        }

        public async Task<object> GetById2(int Id)
        {
            return await _dbContext.Categories
                .Include(x => x.CategoryLangs)
                .Where(x => x.ID == Id)
                .Select(x => new
                {
                    NameVI = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == "vi").Name,
                    NameEn = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == "en").Name,
                    NameTW = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == "zh-TW").Name,
                    x.ID,
                    x.Cate_Kind_ID,
                    x.LevelID,
                    List_Level = _dbContext.CategoryLevels.Where(y => y.Cate_ID == x.ID).Select(z => z.Level_ID.ToString()).ToList(),
                    x.Code
                }).FirstOrDefaultAsync();
        }

        public async Task<bool> Remove(int Id)
        {
            try
            {
                //First , delete category_lang 
                var cate_lang = _dbContext.CategoryLangs.Where(x => x.CategoryID == Id).ToList();
                _dbContext.CategoryLangs.RemoveRange(cate_lang);
                var category = await GetById(Id);
                _dbContext.Categories.Remove(category);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> Update(Category entity)
        {
            entity.Code = entity.Code.ToUpper();
            try
            {
                var iteam = await _dbContext.Categories.FirstOrDefaultAsync(x => x.ID == entity.ID);
                iteam.Name = entity.Name;
                iteam.Code = entity.Code;
                iteam.Cate_Kind_ID = entity.Cate_Kind_ID;
                iteam.LevelID = entity.LevelID;
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

        public async Task<bool> UpdateAsync(CategoryVM entity)
        {
            var list_level = entity.LevelID2.DistinctBy(x => x.id);
            entity.Code = entity.Code.ToUpper();
            try
            {
                var iteam = await _dbContext.Categories.FirstOrDefaultAsync(x => x.ID == entity.ID);
                var item_level = _dbContext.CategoryLevels.Where(x => x.Cate_ID == entity.ID).ToList();
                if (item_level != null)
                {
                    _dbContext.CategoryLevels.RemoveRange(item_level);
                    await _dbContext.SaveChangesAsync();
                }
                iteam.Name = entity.NameEn;
                iteam.Cate_Kind_ID = entity.Cate_Kind_ID;
                iteam.Code = entity.Code;
                foreach (var item in list_level)
                {
                    var cat_level = new Models.EF.CategoryLevel
                    {
                        Cate_ID = entity.ID,
                        Level_ID = item.id.ToInt()
                    };
                    _dbContext.CategoryLevels.Add(cat_level);
                    await _dbContext.SaveChangesAsync();
                }

                var item_occategories = _dbContext.OCCategories.Where(x => x.CategoryID == entity.ID).ToList();
                var item_cate_level = _dbContext.CategoryLevels.Where(x => x.Cate_ID == entity.ID).ToList();

                foreach (var item2 in item_occategories)
                {
                    var level_oc = _dbContext.Levels.FirstOrDefault(x => x.ID == item2.OCID).LevelNumber;
                    foreach (var item3 in item_cate_level)
                    {
                        if (level_oc != item3.Level_ID)
                        {
                            item2.Status = false;
                            _dbContext.OCCategories.Update(item2);
                            await _dbContext.SaveChangesAsync();
                        }
                    }
                }
                iteam.LevelID = 0;
                await _dbContext.SaveChangesAsync();
                var listLang = _dbContext.CategoryLangs.Where(x => x.CategoryID == iteam.ID).ToList();
                if (listLang == null || listLang.Count == 0)
                {
                    var listCategoryLangs = new List<CategoryLang> {
                    new CategoryLang { Name = entity.NameVI, LanguageID = "vi",CategoryID=iteam.ID},
                    new CategoryLang { Name = entity.NameTW, LanguageID = "zh-TW",CategoryID=iteam.ID},
                    new CategoryLang { Name = entity.NameEn, LanguageID = "en",CategoryID=iteam.ID},
                    };
                    _dbContext.CategoryLangs.AddRange(listCategoryLangs);
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

        public async Task<object> GetAllByCategory(int page, int pageSize, int level, int ocID)
        {
            var ocCategories = _dbContext.OCCategories;
            var model = await _dbContext.Categories
                .Select(x => new
                {
                    x.Name,
                    x.ID,
                    x.LevelID,
                    x.CreateTime,
                    Total = _dbContext.CategoryKPILevels.Join(_dbContext.KPILevels,
                                cat => cat.KPILevelID,
                                kpil => kpil.ID,
                                (cat, kpil) => new { cat.CategoryID, cat.Status, kpil.Checked }
                            ).Where(a => a.CategoryID == x.ID && a.Status == true && a.Checked == true).Count(),
                    Status = ocCategories.FirstOrDefault(a => a.CategoryID == x.ID && a.OCID == ocID) == null ? false : ocCategories.FirstOrDefault(a => a.CategoryID == x.ID && a.OCID == ocID).Status
                }).Where(x => x.Status == true && x.Total > 0).ToListAsync();

            if (level > 0)
            {
                model = model.Where(x => x.LevelID == level).ToList();
            }

            int totalRow = model.Count();

            model = model.OrderByDescending(x => x.CreateTime)

              .Skip((page - 1) * pageSize)
              .Take(pageSize).ToList();

            return new
            {
                data = model,
                total = totalRow,
                status = true,
                page,
                pageSize
            };
        }

        public async Task<object> GetAllByCategory2( int level, string lang, int ocID,int page, int pageSize)
        {
            var ocCategories = _dbContext.OCCategories;

            var model = await _dbContext.Categories.Include(x => x.CategoryLangs)
                .Select(x => new
                {
                    Name = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == lang).Name ?? x.Name,
                    x.ID,
                    LevelID = _dbContext.CategoryLevels.FirstOrDefault(y => y.Level_ID == level && y.Cate_ID == x.ID).Level_ID,
                    Kind = _dbContext.KPI_Kinds.FirstOrDefault(y => y.ID == x.Cate_Kind_ID).KPI_Kind_Name,
                    x.CreateTime,
                    Total = _dbContext.CategoryKPILevels.Join(_dbContext.KPILevels,
                                cat => cat.KPILevelID,
                                kpil => kpil.ID,
                                (cat, kpil) => new { cat.CategoryID, cat.Status, kpil.Checked, kpil.LevelID }
                            ).Where(a => a.CategoryID == x.ID && a.Status == true && a.Checked == true && a.LevelID == ocID).Count(),
                    Status = ocCategories.FirstOrDefault(a => a.CategoryID == x.ID && a.OCID == ocID) == null ? false : ocCategories.FirstOrDefault(a => a.CategoryID == x.ID && a.OCID == ocID).Status
                }).Where(x => x.Status == true && x.Total > 0).ToListAsync();

            if (level > 0)
            {
                model = model.Where(x => x.LevelID == level).ToList();
            }

            int totalRow = model.Count();

            model = model.OrderBy(x => x.Kind)
              .Skip((page - 1) * pageSize)
              .Take(pageSize).ToList();

            return new
            {
                data = model,
                total = totalRow,
                status = true,
                page,
                pageSize
            };
        }

        public async Task<object> GetCategoryByOC(int page, int pageSize, int level, int ocID)
        {
            var ocCategories = _dbContext.OCCategories;
            var model = await _dbContext.Categories
                .Select(x => new
                {
                    x.Name,
                    x.ID,
                    x.LevelID,
                    x.CreateTime,
                    Status = ocCategories.FirstOrDefault(a => a.CategoryID == x.ID && a.OCID == ocID) == null ? false : ocCategories.FirstOrDefault(a => a.CategoryID == x.ID && a.OCID == ocID).Status
                }).ToListAsync();

            if (level > 0)
            {
                model = model.Where(x => x.LevelID == level).ToList();
            }
            int totalRow = model.Count();

            model = model.OrderByDescending(x => x.CreateTime)

              .Skip((page - 1) * pageSize)
              .Take(pageSize).ToList();
            return new
            {
                data = model,
                total = totalRow,
                status = true,
                page,
                pageSize,
                totalPage = (int)Math.Ceiling((double)totalRow / pageSize)
            };
        }

        public async Task<object> GetCategoryByOC2( int level, string lang, int ocID,int page, int pageSize)
        {
            var ocCategories = _dbContext.OCCategories;
            var model = await _dbContext.Categories.Include(x => x.CategoryLangs)
                .Select(x => new
                {
                    Name = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == lang).Name ?? x.Name,
                    x.ID,
                    LevelID = _dbContext.CategoryLevels.FirstOrDefault(y => y.Level_ID == level && y.Cate_ID == x.ID).Level_ID,
                    x.CreateTime,
                    x.Cate_Kind_ID,
                    KPI_Kind_Name = _dbContext.KPI_Kinds.FirstOrDefault(y => y.ID == x.Cate_Kind_ID).KPI_Kind_Name,
                    x.Code,
                    modifyBy = ocCategories.FirstOrDefault(a => a.CategoryID == x.ID && a.OCID == ocID) == null ? "#N/A" : ocCategories.FirstOrDefault(a => a.CategoryID == x.ID && a.OCID == ocID).ModifyBy,
                    Status = ocCategories.FirstOrDefault(a => a.CategoryID == x.ID && a.OCID == ocID) == null ? false : ocCategories.FirstOrDefault(a => a.CategoryID == x.ID && a.OCID == ocID).Status
                }).ToListAsync();

            if (level > 0)
            {
                model = model.Where(x => x.LevelID == level ).ToList();
            }

            int totalRow = model.Count();

            model = model.OrderBy(x => x.KPI_Kind_Name).Skip((page - 1) * pageSize).Take(pageSize).ToList();
            return new
            {
                data = model,
                total = totalRow,
                status = true,
                page,
                pageSize,
                totalPage = (int)Math.Ceiling((double)totalRow / pageSize)
            };
        }

        Task<PagedList<Category>> ICommonService<Category>.GetAllPaging(string keyword, string lang, int page, int pageSize)
        {
            throw new NotImplementedException();
        }

       
    }
}
