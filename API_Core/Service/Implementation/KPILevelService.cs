using Models.Data;
using Models.EF;
using Models.ViewModels.KPILevel;
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
  
    public class KPILevelService : IKPILevelService
    {
        private readonly DataContext _dbContext;

        public KPILevelService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }
        public Task<bool> Add(KPILevel entity)
        {
            throw new NotImplementedException();
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
        /// <summary>
        /// Lấy ra danh sách tất cả các KPILevel
        /// </summary>
        /// <param name="levelID"></param>
        /// <param name="categoryID"></param>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <returns>Danh sách KPI theo điều kiện</returns>
        public async Task<object> LoadData(int levelID, int categoryID, int page, int pageSize = 3)
        {
            var model = await (from kpiLevel in _dbContext.KPILevels
                               where kpiLevel.LevelID == levelID
                               join kpi in _dbContext.KPIs on kpiLevel.KPIID equals kpi.ID
                               join unit in _dbContext.Units on kpi.Unit equals unit.ID
                               join level in _dbContext.Levels on kpiLevel.LevelID equals level.ID
                               select new KPILevelViewModel
                               {
                                   ID = kpiLevel.ID,
                                   KPILevelCode = kpiLevel.KPILevelCode,
                                   UserCheck = kpiLevel.KPILevelCode,
                                   KPIID = kpiLevel.KPIID,
                                   KPICode = kpi.Code,
                                   LevelID = kpiLevel.LevelID,
                                   LevelNumber = kpi.LevelID,
                                   Period = kpiLevel.Period,

                                   Weekly = kpiLevel.Weekly,
                                   Monthly = kpiLevel.Monthly,
                                   Quarterly = kpiLevel.Quarterly,
                                   Yearly = kpiLevel.Yearly,

                                   Checked = kpiLevel.Checked,
                                   WeeklyChecked = kpiLevel.WeeklyChecked,
                                   MonthlyChecked = kpiLevel.MonthlyChecked,
                                   QuarterlyChecked = kpiLevel.QuarterlyChecked,
                                   YearlyChecked = kpiLevel.YearlyChecked,
                                   CheckedPeriod = kpiLevel.CheckedPeriod,

                                   TimeCheck = kpiLevel.TimeCheck,

                                   CreateTime = kpiLevel.CreateTime,
                                   Unit = unit.Name,
                                   CategoryID = kpi.CategoryID,
                                   KPIName = kpi.Name,
                                   LevelCode = level.Code,
                               }).ToListAsync();
            if (categoryID != 0)
            {
                model = model.Where(x => x.CategoryID == categoryID).ToList();
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

        public async Task<object> LoadData2(int levelID, int categoryID,string lang, int page, int pageSize = 3)
        {
            //var kpilanguage = _dbContext.KPILangs.Where(x => x.LanguageID == lang);
            var model = await (from occategory in _dbContext.OCCategories
                       where occategory.OCID == levelID
                       where occategory.Status == true
                       join category in _dbContext.Categories on occategory.CategoryID equals category.ID
                       join kpi in _dbContext.KPIs on category.Cate_Kind_ID equals kpi.KPI_Kind_ID
                       join kpiLevel in _dbContext.KPILevels on kpi.ID equals kpiLevel.KPIID where kpiLevel.LevelID == levelID
                       join unit in _dbContext.Units on kpi.Unit equals unit.ID
                       join level in _dbContext.Levels on kpiLevel.LevelID equals level.ID

                       select new KPILevelViewModel
                       {
                           ID = kpiLevel.ID,
                           KPILevelCode = kpiLevel.KPILevelCode,
                           UserCheck = kpiLevel.KPILevelCode,
                           KPIID = kpiLevel.KPIID,
                           //IsConversion = kpiLevel.IsConversion ?? false,
                           KPICode = kpi.Code,
                           LevelID = kpiLevel.LevelID,
                           LevelNumber = kpi.LevelID,
                           Period = kpiLevel.Period,
                           Kind = _dbContext.KPI_Kinds.FirstOrDefault(x => x.ID == kpi.KPI_Kind_ID).KPI_Kind_Name,
                           Name = kpi.KPILangs.FirstOrDefault(x => x.LanguageID == lang).Name ?? kpi.Name,
                           Weekly = kpiLevel.Weekly,
                           Monthly = kpiLevel.Monthly,
                           HalfYear = kpiLevel.HalfYear,
                           Quarterly = kpiLevel.Quarterly,
                           Yearly = kpiLevel.Yearly,
                           Checked = kpiLevel.Checked,
                           WeeklyChecked = kpiLevel.WeeklyChecked,
                           MonthlyChecked = kpiLevel.MonthlyChecked,
                           HalfYearChecked = kpiLevel.HalfYearChecked,
                           QuarterlyChecked = kpiLevel.QuarterlyChecked,
                           YearlyChecked = kpiLevel.YearlyChecked,
                           CheckedPeriod = kpiLevel.CheckedPeriod,
                           ModifyBy = kpiLevel.ModifyBy ?? "#N/A",
                           TimeCheck = kpiLevel.TimeCheck,

                           CreateTime = kpiLevel.CreateTime,
                           Unit = unit.Name,
                           CategoryID = kpi.CategoryID,

                           KPIName = kpi.KPILangs.FirstOrDefault(x => x.LanguageID == lang).Name ?? kpi.Name,
                           LevelCode = level.Code,

                       }).ToListAsync();
            //var model = await (from kpiLevel in _dbContext.KPILevels
            //                   where kpiLevel.LevelID == levelID
            //                   join kpi in _dbContext.KPIs on kpiLevel.KPIID equals kpi.ID
            //                   join unit in _dbContext.Units on kpi.Unit equals unit.ID
            //                   join level in _dbContext.Levels on kpiLevel.LevelID equals level.ID
            //                   select new KPILevelViewModel
            //                   {
            //                       ID = kpiLevel.ID,
            //                       KPILevelCode = kpiLevel.KPILevelCode,
            //                       UserCheck = kpiLevel.KPILevelCode,
            //                       KPIID = kpiLevel.KPIID,
            //                       KPICode = kpi.Code,
            //                       LevelID = kpiLevel.LevelID,
            //                       LevelNumber = kpi.LevelID,
            //                       Period = kpiLevel.Period,
            //                       Name = kpi.KPILangs.FirstOrDefault(x => x.LanguageID == lang).Name ?? kpi.Name,
            //                       Weekly = kpiLevel.Weekly,
            //                       Monthly = kpiLevel.Monthly,
            //                       HalfYear = kpiLevel.HalfYear,
            //                       Quarterly = kpiLevel.Quarterly,
            //                       Yearly = kpiLevel.Yearly,
            //                       Checked = kpiLevel.Checked,
            //                       WeeklyChecked = kpiLevel.WeeklyChecked,
            //                       MonthlyChecked = kpiLevel.MonthlyChecked,
            //                       HalfYearChecked = kpiLevel.HalfYearChecked,
            //                       QuarterlyChecked = kpiLevel.QuarterlyChecked,
            //                       YearlyChecked = kpiLevel.YearlyChecked,
            //                       CheckedPeriod = kpiLevel.CheckedPeriod,
            //                       ModifyBy = kpiLevel.ModifyBy ?? "#N/A",
            //                       TimeCheck = kpiLevel.TimeCheck,

            //                       CreateTime = kpiLevel.CreateTime,
            //                       Unit = unit.Name,
            //                       CategoryID = kpi.CategoryID,

            //                       KPIName = kpi.KPILangs.FirstOrDefault(x => x.LanguageID == lang).Name ?? kpi.Name,
            //                       LevelCode = level.Code,

            //                   }).ToListAsync();

            if (categoryID != 0)
            {
                model = model.Where(x => x.CategoryID == categoryID).ToList();
            }

            int totalRow = model.Count();

            model = model.Skip((page - 1) * pageSize).Take(pageSize).DistinctBy(x => x.ID).OrderBy(x => x.Kind).ToList();

            return new
            {
                data = model,
                total = totalRow,
                status = true,
                page,
                pageSize
            };
        }
        public async Task<object> LoadData3(int levelID, int categoryID,string name, string lang, int page, int pageSize = 3)
        {
            //var kpilanguage = _dbContext.KPILangs.Where(x => x.LanguageID == lang);

            name = name.ToSafetyString().ToLower();
            var model = await (from occategory in _dbContext.OCCategories
                         where occategory.OCID == levelID
                         where occategory.Status == true
                         join category in _dbContext.Categories on occategory.CategoryID equals category.ID
                         join kpi in _dbContext.KPIs on category.Cate_Kind_ID equals kpi.KPI_Kind_ID
                         join kpiLevel in _dbContext.KPILevels on kpi.ID equals kpiLevel.KPIID
                         where kpiLevel.LevelID == levelID
                         join unit in _dbContext.Units on kpi.Unit equals unit.ID
                         join level in _dbContext.Levels on kpiLevel.LevelID equals level.ID
                         select new KPILevelViewModel
                         {
                             ID = kpiLevel.ID,
                             KPILevelCode = kpiLevel.KPILevelCode,
                             UserCheck = kpiLevel.KPILevelCode,
                             KPIID = kpiLevel.KPIID,
                             KPICode = kpi.Code,
                             LevelID = kpiLevel.LevelID,
                             LevelNumber = kpi.LevelID,
                             Period = kpiLevel.Period,
                             Name = kpi.KPILangs.FirstOrDefault(x => x.LanguageID == lang).Name ?? kpi.Name,
                             Weekly = kpiLevel.Weekly,
                             Monthly = kpiLevel.Monthly,
                             HalfYear = kpiLevel.HalfYear,
                             Quarterly = kpiLevel.Quarterly,
                             Yearly = kpiLevel.Yearly,
                             Checked = kpiLevel.Checked,
                             WeeklyChecked = kpiLevel.WeeklyChecked,
                             MonthlyChecked = kpiLevel.MonthlyChecked,
                             HalfYearChecked = kpiLevel.HalfYearChecked,
                             QuarterlyChecked = kpiLevel.QuarterlyChecked,
                             YearlyChecked = kpiLevel.YearlyChecked,
                             CheckedPeriod = kpiLevel.CheckedPeriod,
                             ModifyBy = kpiLevel.ModifyBy ?? "#N/A",
                             TimeCheck = kpiLevel.TimeCheck,

                             CreateTime = kpiLevel.CreateTime,
                             Unit = unit.Name,
                             CategoryID = kpi.CategoryID,

                             KPIName = kpi.KPILangs.FirstOrDefault(x => x.LanguageID == lang).Name ?? kpi.Name,
                             LevelCode = level.Code,

                         }).ToListAsync();

            //var model = await (from kpiLevel in _dbContext.KPILevels
            //                   where kpiLevel.LevelID == levelID
            //                   join kpi in _dbContext.KPIs on kpiLevel.KPIID equals kpi.ID
            //                   //join kpilang in kpilanguage on kpi.ID equals kpilang.KPIID
            //                   join unit in _dbContext.Units on kpi.Unit equals unit.ID
            //                   join level in _dbContext.Levels on kpiLevel.LevelID equals level.ID
            //                   select new KPILevelViewModel
            //                   {
            //                       ID = kpiLevel.ID,
            //                       KPILevelCode = kpiLevel.KPILevelCode,
            //                       UserCheck = kpiLevel.KPILevelCode,
            //                       KPIID = kpiLevel.KPIID,
            //                       KPICode = kpi.Code,
            //                       Name = kpi.KPILangs.FirstOrDefault(x => x.LanguageID == lang).Name ?? kpi.Name,
            //                       LevelID = kpiLevel.LevelID,
            //                       LevelNumber = kpi.LevelID,
            //                       Period = kpiLevel.Period,

            //                       Weekly = kpiLevel.Weekly,
            //                       Monthly = kpiLevel.Monthly,
            //                       Quarterly = kpiLevel.Quarterly,
            //                       Yearly = kpiLevel.Yearly,

            //                       Checked = kpiLevel.Checked,
            //                       WeeklyChecked = kpiLevel.WeeklyChecked,
            //                       MonthlyChecked = kpiLevel.MonthlyChecked,
            //                       QuarterlyChecked = kpiLevel.QuarterlyChecked,
            //                       YearlyChecked = kpiLevel.YearlyChecked,
            //                       CheckedPeriod = kpiLevel.CheckedPeriod,

            //                       TimeCheck = kpiLevel.TimeCheck,

            //                       CreateTime = kpiLevel.CreateTime,
            //                       Unit = unit.Name,
            //                       CategoryID = kpi.CategoryID,

            //                       KPIName = kpi.KPILangs.FirstOrDefault(x => x.LanguageID == lang).Name ?? kpi.Name,
            //                       LevelCode = level.Code,
            //                   }).ToListAsync();


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

            model = model.OrderByDescending(x => x.CreateTime).Skip((page - 1) * pageSize).Take(pageSize).ToList();

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

        public Task<List<KPILevel>> GetAll()
        {
            throw new NotImplementedException();
        }
        public async Task<object> GetAll(int page, int pageSize)
        {
            var model = await _dbContext.KPILevels
                .Where(x => x.UserCheck == "1")
                .Join(_dbContext.KPIs,
                kpilevel => kpilevel.KPIID,
                kpi => kpi.ID,
                (kpilevel, kpi) => new
                {
                    ID = kpilevel.ID,
                    Name = kpi.Name,
                    kpilevel.KPILevelCode,
                    CreateTime = kpilevel.CreateTime,
                })
                .ToListAsync();
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
        public Task<List<KPILevel>> GetAllById(int Id)
        {
            throw new NotImplementedException();
        }
        public async Task<object> GetDetail(int ID)
        {
            var item = await _dbContext.KPILevels.FirstOrDefaultAsync(x => x.ID == ID);
            var codeW = item.KPILevelCode + (item.WeeklyChecked ?? false == true ? "W" : "");
            var codeM = item.KPILevelCode + (item.MonthlyChecked ?? false == true ? "M" : "");
            var codeH = item.KPILevelCode + (item.HalfYearChecked ?? false == true ? "H" : "");
            var codeQ = item.KPILevelCode + (item.QuarterlyChecked ?? false == true ? "Q" : "");
            var codeY = item.KPILevelCode + (item.YearlyChecked ?? false == true ? "Y" : "");

            string WorkingPlanOfWeekly = (await _dbContext.WorkingPlans.FirstOrDefaultAsync(x => x.Code == codeW))?.Content ?? "Not avaiable!";
            string WorkingPlanOfMonthly = (await _dbContext.WorkingPlans.FirstOrDefaultAsync(x => x.Code == codeM))?.Content ?? "Not avaiable!";
            string WorkingPlanOfHalfYear = (await _dbContext.WorkingPlans.FirstOrDefaultAsync(x => x.Code == codeH))?.Content ?? "Not avaiable!";
            string WorkingPlanOfQuarterly = (await _dbContext.WorkingPlans.FirstOrDefaultAsync(x => x.Code == codeQ))?.Content ?? "Not avaiable!";
            string WorkingPlanOfYearly = (await _dbContext.WorkingPlans.FirstOrDefaultAsync(x => x.Code == codeY))?.Content ?? "Not avaiable!";

            return new
            {
                status = true,
                data = item,
                WorkingPlanOfWeekly,
                WorkingPlanOfMonthly,
                WorkingPlanOfHalfYear,
                WorkingPlanOfQuarterly,
                WorkingPlanOfYearly,
            };
        }
        public Task<PagedList<KPILevel>> GetAllPaging(string keyword, int page, int pageSize)
        {
            throw new NotImplementedException();
        }

        public Task<KPILevel> GetById(int Id)
        {
            throw new NotImplementedException();
        }

        public int GetByUsername(string username)
        {
            try
            {
                var userid = _dbContext.Users.FirstOrDefault(x => x.Username.Equals(username)).ID;

                return userid;

            }
            catch (Exception ex)
            {

                return 0;

            }
        }

        public Task<bool> Remove(int Id)
        {
            throw new NotImplementedException();
        }
        public async Task<bool> AddWorkingPlan(WorkingPlan entity)
        {
            var item = await _dbContext.WorkingPlans.FirstOrDefaultAsync(x => x.Code == entity.Code);
            if (item != null)
            {
                item.Content = entity.Content;
            }
            else
            {
                _dbContext.WorkingPlans.Add(entity);

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
        public async Task<bool> Update(KPILevelForUpdate entity)
        {
            var kind_ID = _dbContext.KPIs.FirstOrDefault(x => x.ID == entity.KPIID).KPI_Kind_ID;
            var cate_ID = _dbContext.Categories.FirstOrDefault(x => x.Cate_Kind_ID == kind_ID).ID;

            var cate_result = new CategoryKPILevel();

            var item = await _dbContext.CategoryKPILevels.FirstOrDefaultAsync(x => x.KPILevelID == entity.ID && x.CategoryID == cate_ID);

            if (item == null)
            {
                cate_result.KPILevelID = entity.ID;
                cate_result.CategoryID = cate_ID;
                cate_result.Status = true;
                cate_result.ModifyBy = entity.ModifyBy;
                _dbContext.CategoryKPILevels.Add(cate_result);
            }
            else
            {
                if (entity.Checked == null)
                {
                    item.ModifyBy = entity.ModifyBy;
                    item.Status = true;
                }
                else
                {
                    item.ModifyBy = entity.ModifyBy;
                    item.Status = entity.Checked.ToBool();
                }
            }
            _dbContext.SaveChanges();

            var comparedt = new DateTime(2001, 1, 1);
            var kpiLevel = await _dbContext.KPILevels.FirstOrDefaultAsync(x => x.ID == entity.ID);
            var kpiModel = await _dbContext.KPIs.FirstOrDefaultAsync(x => x.ID == kpiLevel.KPIID);
            var ocModel = await _dbContext.Levels.FirstOrDefaultAsync(x => x.ID == kpiLevel.LevelID);
            if (entity.Weekly != null)
            {
                kpiLevel.Weekly = entity.Weekly;
            }
            if (!entity.Monthly.IsNullOrEmpty())
            {
                kpiLevel.Monthly = Convert.ToDateTime(entity.Monthly);
            }
            if (!entity.Target.IsNullOrEmpty())
            {
                string code = ocModel.LevelNumber + ocModel.Code + kpiModel.Code + entity.Period;
                var status = await AddWorkingPlan(new WorkingPlan { Code = code, Content = entity.Target });
            }
            if (!entity.HalfYear.IsNullOrEmpty())
            {
                kpiLevel.HalfYear = Convert.ToDateTime(entity.HalfYear);
            }
            if (!entity.Quarterly.IsNullOrEmpty())
            {
                kpiLevel.Quarterly = Convert.ToDateTime(entity.Quarterly);
            }
            if (!entity.Yearly.IsNullOrEmpty())
            {
                kpiLevel.Yearly = Convert.ToDateTime(entity.Yearly);
            }
            if (entity.WeeklyChecked != null)
            {
                kpiLevel.WeeklyChecked = entity.WeeklyChecked;
            }
            if (entity.MonthlyChecked != null)
            {
                kpiLevel.MonthlyChecked = entity.MonthlyChecked;
            }
            if (entity.HalfYearChecked != null)
            {
                kpiLevel.HalfYearChecked = entity.HalfYearChecked;
            }
            if (entity.QuarterlyChecked != null)
            {
                kpiLevel.QuarterlyChecked = entity.QuarterlyChecked;
            }
            if (entity.MonthlyChecked != null)
            {
                kpiLevel.MonthlyChecked = entity.MonthlyChecked;
            }
            if (entity.YearlyChecked != null)
            {
                kpiLevel.YearlyChecked = entity.YearlyChecked;
            }
            if (entity.WeeklyPublic != null)
            {
                kpiLevel.WeeklyPublic = entity.WeeklyPublic;
            }
            if (entity.MonthlyPublic != null)
            {
                kpiLevel.MonthlyPublic = entity.MonthlyPublic;
            }
            if (entity.HalfYearPublic != null)
            {
                kpiLevel.HalfYearPublic = entity.HalfYearPublic;
            }
            if (entity.QuarterlyPublic != null)
            {
                kpiLevel.QuarterlyPublic = entity.QuarterlyPublic;
            }
            if (entity.YearlyPublic != null)
            {
                kpiLevel.YearlyPublic = entity.YearlyPublic;
            }
            if (entity.Checked != null)
            {
                kpiLevel.Checked = entity.Checked;
                kpiLevel.KPILevelCode = ocModel.LevelNumber + ocModel.Code + kpiModel.Code;
            }

            kpiLevel.UserCheck = entity.UserCheck;
            kpiLevel.TimeCheck = DateTime.Now;
            kpiLevel.CreateTime = DateTime.Now;
            kpiLevel.ModifyBy = entity.ModifyBy;

            try
            {
                _dbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                //logging
                return false;
            }

        }
        public async Task<object> LoadDataPerfomance(string kpilevelcode)
        {
            try
            {
                var item_data = _dbContext.ScorePerfomances.Where(x => x.KPILevel_Code == kpilevelcode).ToList();
                return new
                {
                    data = item_data
                };
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return false;
            }

            //throw new NotImplementedException();
        }
        public async Task<bool> UpdateScoreData(KPILevelForUpdate entity)
        {
            //throw new NotImplementedException();
            var item = _dbContext.Datas.Find(entity.ID);
            if (item != null)
            {
                item.Score = entity.Score;
            }

            try
            {
                _dbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return false;
            }
        }
        public async Task<object> AddScorePerfomance(ScoreViewModel entity)
        {
            //var item = _dbContext.ScorePerfomances.FirstOrDefault(x => x.KPILevel_ID  == entity.KPILevel_ID);
            try
            {
                var result = new ScorePerfomance();
                result.Score = entity.Score;
                result.Min = entity.Min;
                result.Max = entity.Max;
                result.KPILevel_ID = entity.KPILevel_ID;
                result.KPILevel_Code = entity.KPILevel_Code;
                _dbContext.ScorePerfomances.Add(result);
                await _dbContext.SaveChangesAsync();

                return new
                {
                    data = _dbContext.ScorePerfomances.Where(x => x.KPILevel_ID == entity.KPILevel_ID).ToList()
                };
            }
            catch (Exception ex)
            {

                return false;
                throw;
            }
            //try
            //{
            //    if (item == null)
            //    {
            //        //var ScoreList = new List<ScorePerfomance>();
            //        //for (int i = 1; i < 11; i++)
            //        //{
            //        //    var result = new ScorePerfomance();
            //        //    result.Score = i.ToString();
            //        //    result.Min = "0";
            //        //    result.Max = "0";
            //        //    result.KPILevel_ID = entity.KPILevel_ID;
            //        //    result.KPILevel_Code = entity.KPILevel_Code;
            //        //    ScoreList.Add(result);
            //        //}
                   


            //    }
            //    else
            //    {
            //        var data = _dbContext.ScorePerfomances.Where(x => x.KPILevel_ID == entity.KPILevel_ID).ToList();
            //        return new { 
            //            data = data
            //        };
            //    }
            //    //return new
            //    //{
            //    //    data = _dbContext.ScorePerfomances.Where(x => x.KPILevel_ID == kpilevelid).ToList()
            //    //};
            //}
            //catch (Exception ex)
            //{
            //    return false;
            //    throw;
            //}
           
            //throw new NotImplementedException();
        }

        public async Task<bool> UpdateScorePerfomanceData(ScoreViewModel entity)
        {
            //throw new NotImplementedException();
            var item = _dbContext.ScorePerfomances.Find(entity.ID);
            if (item != null)
            {
                item.Score = entity.Score;
                item.Min = entity.Min;
                item.Max = entity.Max;
                item.KPILevel_Code = entity.KPILevel_Code;
            }

            try
            {
                _dbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return false;
            }
        }
        public async Task<object> UpdateConversionKPILevel(KPILevelForUpdate entity)
        {
            var item = _dbContext.KPILevels.Find(entity.ID);
            if (item != null)
            {
                //item.IsConversion = entity.IsConversion;
            }

            var item_data = _dbContext.Datas.Where(x => x.KPILevelCode == entity.KPILevelCode && x.Value != "0").ToList();

            try
            {
                _dbContext.SaveChanges();
                return new {
                    data = item_data
                };
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return false;
            }

        }
        public async Task<bool> UpdateKPILevel(KPILevelForUpdate entity)
        {
            var kpiLevel = await _dbContext.KPILevels.FirstOrDefaultAsync(x => x.ID == entity.ID);
            var kpiModel = await _dbContext.KPIs.FirstOrDefaultAsync(x => x.ID == kpiLevel.KPIID);
            var ocModel = await _dbContext.Levels.FirstOrDefaultAsync(x => x.ID == kpiLevel.LevelID);
            if (entity.Weekly != null)
            {
                kpiLevel.Weekly = entity.Weekly;
            }
            if (!entity.Monthly.IsNullOrEmpty())
            {
                kpiLevel.Monthly = Convert.ToDateTime(entity.Monthly);
            }
            if (!entity.Quarterly.IsNullOrEmpty())
            {
                kpiLevel.Quarterly = Convert.ToDateTime(entity.Quarterly);
            }
            if (!entity.Yearly.IsNullOrEmpty())
            {
                kpiLevel.Yearly = Convert.ToDateTime(entity.Yearly);
            }
            if (entity.WeeklyChecked != null)
            {
                kpiLevel.WeeklyChecked = entity.WeeklyChecked;
            }
            if (entity.MonthlyChecked != null)
            {
                kpiLevel.MonthlyChecked = entity.MonthlyChecked;
            }
            if (entity.QuarterlyChecked != null)
            {
                kpiLevel.QuarterlyChecked = entity.QuarterlyChecked;
            }
            if (entity.MonthlyChecked != null)
            {
                kpiLevel.MonthlyChecked = entity.MonthlyChecked;
            }
            if (entity.YearlyChecked != null)
            {
                kpiLevel.YearlyChecked = entity.YearlyChecked;
            }
            if (entity.WeeklyPublic != null)
            {
                kpiLevel.WeeklyPublic = entity.WeeklyPublic;
            }
            if (entity.MonthlyPublic != null)
            {
                kpiLevel.MonthlyPublic = entity.MonthlyPublic;
            }
            if (entity.QuarterlyPublic != null)
            {
                kpiLevel.QuarterlyPublic = entity.QuarterlyPublic;
            }
            if (entity.YearlyPublic != null)
            {
                kpiLevel.YearlyPublic = entity.YearlyPublic;
            }

            if (entity.Checked != null)
            {
                kpiLevel.Checked = entity.Checked;
                kpiLevel.KPILevelCode = ocModel.LevelNumber + ocModel.Code + kpiModel.Code;
            }

            if (kpiLevel.WeeklyChecked == false
                && kpiLevel.MonthlyChecked == false
                && kpiLevel.QuarterlyChecked == false
                && kpiLevel.YearlyChecked == false)
            {
                kpiLevel.Checked = false;
                kpiLevel.KPILevelCode = ocModel.LevelNumber + ocModel.Code + kpiModel.Code;
            }
            else
            {
                kpiLevel.Checked = true;
                kpiLevel.KPILevelCode = ocModel.LevelNumber + ocModel.Code + kpiModel.Code;
            }
            try
            {
                _dbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                //logging
                return false;
            }

        }
        public async Task<object> GetAllPaging(int levelID, int categoryID, int page, int pageSize = 3)
        {
            var model = await (from kpiLevel in _dbContext.KPILevels
                               where kpiLevel.LevelID == levelID
                               join kpi in _dbContext.KPIs on kpiLevel.KPIID equals kpi.ID
                               join unit in _dbContext.Units on kpi.Unit equals unit.ID
                               join level in _dbContext.Levels on kpiLevel.LevelID equals level.ID
                               select new KPILevelViewModel
                               {
                                   ID = kpiLevel.ID,
                                   KPILevelCode = kpiLevel.KPILevelCode,
                                   UserCheck = kpiLevel.KPILevelCode,
                                   KPIID = kpiLevel.KPIID,
                                   KPICode = kpi.Code,
                                   LevelID = kpiLevel.LevelID,
                                   LevelNumber = kpi.LevelID,
                                   Period = kpiLevel.Period,

                                   Weekly = kpiLevel.Weekly,
                                   Monthly = kpiLevel.Monthly,
                                   Quarterly = kpiLevel.Quarterly,
                                   Yearly = kpiLevel.Yearly,

                                   Checked = kpiLevel.Checked,
                                   WeeklyChecked = kpiLevel.WeeklyChecked,
                                   MonthlyChecked = kpiLevel.MonthlyChecked,
                                   QuarterlyChecked = kpiLevel.QuarterlyChecked,
                                   YearlyChecked = kpiLevel.YearlyChecked,
                                   CheckedPeriod = kpiLevel.CheckedPeriod,

                                   TimeCheck = kpiLevel.TimeCheck,

                                   CreateTime = kpiLevel.CreateTime,
                                   Unit = unit.Name,
                                   CategoryID = kpi.CategoryID,
                                   KPIName = kpi.Name,
                                   LevelCode = level.Code,
                               }).ToListAsync();
            if (categoryID != 0)
            {
                model = model.Where(x => x.CategoryID == categoryID).ToList();
            }

            //int totalRow = model.Count();
            var data = PagedList<KPILevelViewModel>.Create(model, page, pageSize);

            //model = model.OrderByDescending(x => x.CreateTime)
            //  .Skip((page - 1) * pageSize)
            //  .Take(pageSize).ToList();

            return new
            {
                data = data,
                CurrentPage = data.CurrentPage,
                PageSize = data.PageSize,
                TotalPages = data.TotalPages,
                TotalCount = data.TotalCount,



            };
        }

        public Task<bool> Update(KPILevel entity)
        {
            throw new NotImplementedException();
        }

        public async Task<object> LoadDataForUser(int levelID, int categoryID, int page, int pageSize = 3)
        {
            //Lấy các tuần tháng quý năm hiện tại
            var weekofyear = DateTime.Now.GetIso8601WeekOfYear();
            var monthofyear = DateTime.Now.Month;
            var quarterofyear = DateTime.Now.GetQuarterOfYear();
            var year = DateTime.Now.Year;
            var currentweekday = DateTime.Now.DayOfWeek.ToSafetyString().ToUpper().ConvertStringDayOfWeekToNumber();
            var currentdate = DateTime.Now.Date;
            var dt = new DateTime(2019, 8, 1);
            var value = DateTime.Compare(currentdate, dt);
            try
            {
                //Lấy ra danh sách data từ trong db
                var datas = _dbContext.Datas;
                var catKPILevel = _dbContext.CategoryKPILevels;
                var model = await (from kpiLevel in _dbContext.KPILevels
                                   where kpiLevel.LevelID == levelID && kpiLevel.Checked == true
                                   join kpi in _dbContext.KPIs on kpiLevel.KPIID equals kpi.ID
                                   join level in _dbContext.Levels on kpiLevel.LevelID equals level.ID
                                   select new KPILevelViewModel
                                   {
                                       ID = kpiLevel.ID,
                                       KPILevelCode = kpiLevel.KPILevelCode,
                                       UserCheck = kpiLevel.KPILevelCode,
                                       KPIID = kpiLevel.KPIID,
                                       KPICode = kpi.Code,
                                       LevelID = kpiLevel.LevelID,
                                       LevelNumber = kpi.LevelID,
                                       Period = kpiLevel.Period,

                                       Weekly = kpiLevel.Weekly,
                                       Monthly = kpiLevel.Monthly,
                                       Quarterly = kpiLevel.Quarterly,
                                       Yearly = kpiLevel.Yearly,

                                       Checked = kpiLevel.Checked,

                                       WeeklyChecked = kpiLevel.WeeklyChecked,
                                       MonthlyChecked = kpiLevel.MonthlyChecked,
                                       QuarterlyChecked = kpiLevel.QuarterlyChecked,
                                       YearlyChecked = kpiLevel.YearlyChecked,
                                       CheckedPeriod = kpiLevel.CheckedPeriod,

                                       //true co du lieu false khong co du lieu
                                       StatusEmptyDataW = datas.FirstOrDefault(x => x.KPILevelCode == kpiLevel.KPILevelCode && x.Period == (kpiLevel.WeeklyChecked == true ? "W" : "")) != null ? true : false,
                                       StatusEmptyDataM = datas.FirstOrDefault(x => x.KPILevelCode == kpiLevel.KPILevelCode && x.Period == (kpiLevel.MonthlyChecked == true ? "M" : "")) != null ? true : false,
                                       StatusEmptyDataQ = datas.FirstOrDefault(x => x.KPILevelCode == kpiLevel.KPILevelCode && x.Period == (kpiLevel.QuarterlyChecked == true ? "Q" : "")) != null ? true : false,
                                       StatusEmptyDataY = datas.FirstOrDefault(x => x.KPILevelCode == kpiLevel.KPILevelCode && x.Period == (kpiLevel.YearlyChecked == true ? "Y" : "")) != null ? true : false,

                                       TimeCheck = kpiLevel.TimeCheck,
                                       CreateTime = kpiLevel.CreateTime,

                                       //CategoryID = kpi.CategoryID,
                                       KPIName = kpi.Name,
                                       LevelCode = level.Code,
                                       //Nếu tuần hiện tại - tuần MAX trong bảng DATA > 1 return false,
                                       //ngược lại nếu == 1 thi kiểm tra thứ trong bảng KPILevel,
                                       //Nếu thứ nhỏ hơn thứ hiện tại thì return true,
                                       //ngược lại reutrn false
                                       StatusUploadDataW = weekofyear - datas.Where(a => a.KPILevelCode == kpiLevel.KPILevelCode && a.Period == "W").Max(x => x.Week) > 1 ? false : ((weekofyear - datas.Where(a => a.KPILevelCode == kpiLevel.KPILevelCode && a.Period == "W").Max(x => x.Week)) == 1 ? (kpiLevel.Weekly < currentweekday ? true : false) : false),

                                       StatusUploadDataM = monthofyear - datas.Where(a => a.KPILevelCode == kpiLevel.KPILevelCode && a.Period == "M").Max(x => x.Month) > 1 ? false : monthofyear - datas.Where(a => a.KPILevelCode == kpiLevel.KPILevelCode && a.Period == "M").Max(x => x.Month) == 1 ? (DateTime.Compare(currentdate, kpiLevel.Monthly.Value) < 0 ? true : false) : false,

                                       StatusUploadDataQ = quarterofyear - datas.Where(a => a.KPILevelCode == kpiLevel.KPILevelCode && a.Period == "Q").Max(x => x.Quarter) > 1 ? false : quarterofyear - datas.Where(a => a.KPILevelCode == kpiLevel.KPILevelCode && a.Period == "Q").Max(x => x.Quarter) == 1 ? (DateTime.Compare(currentdate, kpiLevel.Quarterly.Value) < 0 ? true : false) : false, //true dung han flase tre han

                                       StatusUploadDataY = year - datas.Where(a => a.KPILevelCode == kpiLevel.KPILevelCode && a.Period == "Y").Max(x => x.Year) > 1 ? false : year - datas.Where(a => a.KPILevelCode == kpiLevel.KPILevelCode && a.Period == "Y").Max(x => x.Year) == 1 ? (DateTime.Compare(currentdate, kpiLevel.Yearly.Value) < 0 ? true : false) : false,

                                       CheckCategory = catKPILevel.FirstOrDefault(x => x.KPILevelID == kpiLevel.ID && x.CategoryID == categoryID) == null ? false : catKPILevel.FirstOrDefault(x => x.Status == true && x.KPILevelID == kpiLevel.ID && x.CategoryID == categoryID).Status == true ? true : false

                                   }).ToListAsync();



                //if (categoryID != 0)
                //{
                //    model = model.Where(x => x.CategoryID == categoryID);
                //}

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
            catch (Exception ex)
            {
                var message = ex.Message;
                return "";
            }

        }
        /// <summary>
        /// Lấy ra danh sách để so sánh chart với nhau.
        /// </summary>
        /// <param name="obj">Chuỗi dữ liệu gồm KPIlevelcode, Period của các KPILevel</param>
        /// <returns>Trả về danh sách so sánh dữ liệu cùng cấp. So sánh tối đa 4 KPILevel</returns>
        public async Task<object> LoadDataProvide(string obj, int page, int pageSize)
        {
            var listCompare = new List<CompareViewModel>();
            var value = obj.ToSafetyString().Split(',');
            var kpilevelcode = value[0].ToSafetyString();
            var period = value[1].ToSafetyString();

            var itemkpilevel = await _dbContext.KPILevels.FirstOrDefaultAsync(x => x.KPILevelCode == kpilevelcode);
            var itemlevel = await _dbContext.Levels.FirstOrDefaultAsync(x => x.ID == itemkpilevel.LevelID);
            var levelNumber = itemlevel.LevelNumber;
            var kpiid = itemkpilevel.KPIID;
            //Lay ra tat ca kpiLevel cung levelNumber

            if (period == "W")
            {

                listCompare = await _dbContext.KPILevels.Where(x => x.KPIID == kpiid && x.WeeklyChecked == true )
                    .Join(_dbContext.Levels,
                    x => x.LevelID,
                    a => a.ID,
                    (x, a) => new CompareViewModel
                    {
                        KPILevelCode = x.KPILevelCode + ",W",
                        LevelNumber = _dbContext.Levels.FirstOrDefault(l => l.ID == x.LevelID).LevelNumber,
                        Area = _dbContext.Levels.FirstOrDefault(l => l.ID == x.LevelID).Name,
                        Status = _dbContext.Datas.FirstOrDefault(leo => leo.KPILevelCode == x.KPILevelCode) == null ? false : true,
                        StatusPublic = (bool?)x.WeeklyPublic ?? false
                    }).Where(c => c.LevelNumber == levelNumber).ToListAsync();

                int totalRow = listCompare.Count();
                listCompare = listCompare.OrderByDescending(x => x.LevelNumber).Skip((page - 1) * pageSize).Take(pageSize).ToList();

                return new
                {
                    total = totalRow,
                    listCompare
                };
            }

            if (period == "M")
            {
                listCompare = await _dbContext.KPILevels.Where(x => x.KPIID == kpiid && x.MonthlyChecked == true)
                    .Join(_dbContext.Levels,
                    x => x.LevelID,
                    a => a.ID,
                    (x, a) => new CompareViewModel
                    {
                        KPILevelCode = x.KPILevelCode + ",M",
                        LevelNumber = _dbContext.Levels.FirstOrDefault(l => l.ID == x.LevelID).LevelNumber,
                        Area = _dbContext.Levels.FirstOrDefault(l => l.ID == x.LevelID).Name,
                        Status = _dbContext.Datas.FirstOrDefault(leo => leo.KPILevelCode == x.KPILevelCode) == null ? false : true,
                        StatusPublic = (bool?)x.MonthlyPublic ?? false
                    }).Where(c => c.LevelNumber == levelNumber).ToListAsync();

                int totalRow = listCompare.Count();
                listCompare = listCompare.OrderByDescending(x => x.LevelNumber)
                    .Skip((page - 1) * pageSize).Take(pageSize).ToList();

                return new
                {
                    total = totalRow,
                    listCompare
                };
            }

            if (period == "Q")
            {
                listCompare = await _dbContext.KPILevels.Where(x => x.KPIID == kpiid && x.QuarterlyChecked == true )
                    .Join(_dbContext.Levels,
                    x => x.LevelID,
                    a => a.ID,
                    (x, a) => new CompareViewModel
                    {
                        KPILevelCode = x.KPILevelCode + ",Q",
                        LevelNumber = _dbContext.Levels.FirstOrDefault(l => l.ID == x.LevelID).LevelNumber,
                        Area = _dbContext.Levels.FirstOrDefault(l => l.ID == x.LevelID).Name,
                        Status = _dbContext.Datas.FirstOrDefault(leo => leo.KPILevelCode == x.KPILevelCode) == null ? false : true,
                        StatusPublic = (bool?)x.QuarterlyPublic ?? false
                    }).
                    Where(c => c.LevelNumber == levelNumber)
                    .ToListAsync();

                int totalRow = listCompare.Count();
                listCompare = listCompare.OrderByDescending(x => x.LevelNumber)
                    .Skip((page - 1) * pageSize).Take(pageSize).ToList();

                return new
                {
                    total = totalRow,
                    listCompare
                };
            }

            if (period == "H")
            {
                listCompare = await _dbContext.KPILevels.Where(x => x.KPIID == kpiid && x.HalfYearChecked == true)
                    .Join(_dbContext.Levels,
                    x => x.LevelID,
                    a => a.ID,
                    (x, a) => new CompareViewModel
                    {
                        KPILevelCode = x.KPILevelCode + ",H",
                        LevelNumber = _dbContext.Levels.FirstOrDefault(l => l.ID == x.LevelID).LevelNumber,
                        Area = _dbContext.Levels.FirstOrDefault(l => l.ID == x.LevelID).Name,
                        Status = _dbContext.Datas.FirstOrDefault(leo => leo.KPILevelCode == x.KPILevelCode) == null ? false : true,
                        StatusPublic = (bool?)x.HalfYearPublic ?? false
                    }).
                    Where(c => c.LevelNumber == levelNumber)
                    .ToListAsync();

                int totalRow = listCompare.Count();
                listCompare = listCompare.OrderByDescending(x => x.LevelNumber)
                    .Skip((page - 1) * pageSize).Take(pageSize).ToList();

                return new
                {
                    total = totalRow,
                    listCompare
                };
            }

            if (period == "Y")
            {
                listCompare = await _dbContext.KPILevels.Where(x => x.KPIID == kpiid && x.YearlyChecked == true )
                    .Join(_dbContext.Levels,
                    x => x.LevelID,
                    a => a.ID,
                    (x, a) => new CompareViewModel
                    {
                        KPILevelCode = x.KPILevelCode + ",Y",
                        LevelNumber = _dbContext.Levels.FirstOrDefault(l => l.ID == x.LevelID).LevelNumber,
                        Area = _dbContext.Levels.FirstOrDefault(l => l.ID == x.LevelID).Name,
                        Status = _dbContext.Datas.FirstOrDefault(leo => leo.KPILevelCode == x.KPILevelCode) == null ? false : true,
                        StatusPublic = (bool?)x.YearlyPublic ?? false
                    }).
                    Where(c => c.LevelNumber == levelNumber)
                    .ToListAsync();

                int totalRow = listCompare.Count();
                listCompare = listCompare.OrderByDescending(x => x.LevelNumber)
                    .Skip((page - 1) * pageSize).Take(pageSize).ToList();

                return new
                {
                    total = totalRow,
                    listCompare
                };
            }
            //Lay tat ca kpilevel cung period

            return new
            {
                listCompare
            };
        }
        public async Task<PagedList<KPILevel>> GetAllPagingByLevelIdAndCategoryId(int levelId, int catId, int page, int pageSize)
        {
            var source = _dbContext.KPILevels.AsQueryable();
            if (levelId > 0 || catId > 0)
            {
                source = source.Where(x => x.LevelID.Equals(levelId));
            }
            return await PagedList<KPILevel>.CreateAsync(source, page, pageSize);
        }

        public async Task<object> GetItemInListOfWorkingPlan(string code, string period)
        {
            var kpilevelcode = code + period;
            if (kpilevelcode.IsNullOrEmpty())
            {
                return new
                {
                    status = false,
                    message = "Error!",
                    data = new WorkingPlan { Content = "Not avaiable!" }
                };
            }
            return new
            {
                status = true,
                message = "Successfully!",
                data = await _dbContext.WorkingPlans.FirstOrDefaultAsync(x => x.Code == kpilevelcode)
            };

        }

        public Task<PagedList<KPILevel>> GetAllPaging(string keyword, string lang, int page, int pageSize)
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
