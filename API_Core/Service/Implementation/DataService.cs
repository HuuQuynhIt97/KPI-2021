using Models.Data;
using Models.EF;
using Models.ViewModels.Auth;
using Models.ViewModels.Data;
using Models.ViewModels.Level;
using Models.ViewModels.User;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Service.Helpers;
using Service.Interface;
using Microsoft.Extensions.Configuration;
using Models.ViewModels.ActionPlan;
using System.Collections;

namespace Service.Implementation
{

    public class DataService : IDataService
    {
        private readonly DataContext _dbContext;
        private readonly ILevelService _levelService;
        private readonly IConfiguration _configuration;

        public DataService(DataContext dbContext, ILevelService levelService, IConfiguration configuration)
        {
            _dbContext = dbContext;
            _levelService = levelService;
            _configuration = configuration;
        }

        public async Task<object> SortActionPlanByPeriod(string period, int point, int kpilevelID, int userID)
        {
            try
            {
                var userModel = await _dbContext.Users.FirstOrDefaultAsync(x => x.ID == userID);
                var currentYear = DateTime.Now.Year;
                var resultMonth = CodeUtility.ConvertNumberMothToString(point);
                var resultMonthofWeek = CodeUtility.GetMonth(currentYear, point);
                var a = CodeUtility.ConvertNumberMothToString(resultMonthofWeek);
                var model = new List<ActionPlanForChart>();

                var data = await _dbContext.ActionPlans
                    .Where(x => x.KPILevelID == kpilevelID)
                    .Select(x => new
                    {
                        x.ID,
                        x.Title,
                        x.Description,
                        x.Tag,
                        x.ApprovedStatus,
                        x.Deadline,
                        x.UpdateSheduleDate,
                        x.ActualFinishDate,
                        x.Status,
                        x.UserID,
                        x.CommentID,
                        IsBoss = (int?)_dbContext.Roles.FirstOrDefault(a => a.ID == userModel.Permission).ID < 3 ? true : false,
                        CreatedBy = x.UserID,
                        x.Auditor,
                        x.ApprovedBy,
                        ApprovedByName = _dbContext.Users.FirstOrDefault(a => a.ID == x.ApprovedBy).Alias ?? "#N/A",
                        CreateTime = x.CreateTime.ToString("MMMM"),
                        CreateTime2 = x.CreateTime,
                        Remark = x.Remark ?? "#N/A"

                    })
                    .ToListAsync();
                int index = 1;

                if (period == "M")
                {
                    model = data
                    .Select(x => new ActionPlanForChart
                    {
                        ID = x.ID,
                        Title = x.Title,
                        Description = x.Description,
                        Tag = x.Tag,
                        ApprovedStatus = x.ApprovedStatus,
                        ApprovedStatus2 = x.ApprovedStatus ? "Yes" : "No",
                        Deadline = x.Deadline.ToString("dddd, MMMM d, yyyy"),
                        UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        Status = x.Status,
                        IsBoss = x.IsBoss,
                        CreatedBy = x.UserID,
                        ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Auditor = x.Auditor,
                        ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Remark = x.Remark,
                        CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                        ApprovedByNames = x.ApprovedByName,
                        CreatedTimed = x.CreateTime,
                        CommentID = x.CommentID,
                        Index = index.ToString(),
                        RootCause = _dbContext.Comments.Find(x.CommentID).CommentMsg.Replace("@", "") ?? "#N/A",
                    }).Where(x => x.CreatedTimed == resultMonth).ToList();

                    model.ForEach(item =>
                    {
                        item.Index = index.ToString();
                        index ++;
                    });
                }
                if (period == "W")
                {
                    var startDayOfWeek = CodeUtility.ToGetMondayOfWeek(currentYear, point);
                    var endDayOfWeek = CodeUtility.ToGetSaturdayOfWeek(currentYear, point);
                    model = data
                    .Select(x => new ActionPlanForChart
                    {
                        ID = x.ID,
                        Title = x.Title,
                        Description = x.Description,
                        Tag = x.Tag,
                        ApprovedStatus = x.ApprovedStatus,
                        ApprovedStatus2 = x.ApprovedStatus ? "Yes" : "No",
                        Deadline = x.Deadline.ToString("dddd, MMMM d, yyyy"),
                        UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        Status = x.Status,
                        IsBoss = x.IsBoss,
                        CreatedBy = x.UserID,
                        ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Auditor = x.Auditor,
                        ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Remark = x.Remark,
                        CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                        ApprovedByNames = x.ApprovedByName,
                        CreatedTimed = x.CreateTime,
                        CreatedTimed2 = x.CreateTime2,
                        CommentID = x.CommentID,
                        Index = index.ToString(),
                        RootCause = _dbContext.Comments.Find(x.CommentID).CommentMsg.Replace("@", "") ?? "#N/A",
                    }).Where(x => x.CreatedTimed2 >= startDayOfWeek && x.CreatedTimed2 <= endDayOfWeek).ToList();

                    model.ForEach(item =>
                    {
                        item.Index = index.ToString();
                        index++;
                    });
                }
                if (period == "Q")
                {
                    // lay ngay dau tien cua quater
                    var firstQuarterStartDate = CodeUtility.ToGetStartAndEndDateOfQuarter(currentYear, point).Item1;
                    //lay ngay cuoi cua quater
                    DateTime currentQuarterEndDate = CodeUtility.ToGetStartAndEndDateOfQuarter(currentYear, point).Item2;

                    model = data
                    .Select(x => new ActionPlanForChart
                    {
                        ID = x.ID,
                        Title = x.Title,
                        Description = x.Description,
                        Tag = x.Tag,
                        ApprovedStatus = x.ApprovedStatus,
                        ApprovedStatus2 = x.ApprovedStatus ? "Yes" : "No",
                        Deadline = x.Deadline.ToString("dddd, MMMM d, yyyy"),
                        UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        Status = x.Status,
                        IsBoss = x.IsBoss,
                        CreatedBy = x.UserID,
                        ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Auditor = x.Auditor,
                        ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Remark = x.Remark,
                        CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                        ApprovedByNames = x.ApprovedByName,
                        CreatedTimed = x.CreateTime,
                        CreatedTimed2 = x.CreateTime2,
                        CommentID = x.CommentID,
                        Index = index.ToString(),
                        RootCause = _dbContext.Comments.Find(x.CommentID).CommentMsg.Replace("@", "") ?? "#N/A",
                    }).Where(x => x.CreatedTimed2 >= firstQuarterStartDate && x.CreatedTimed2 <= currentQuarterEndDate).OrderBy(x => x.CreatedTimed2).ToList();

                    model.ForEach(item =>
                    {
                        item.Index = index.ToString();
                        index++;
                    });
                }
                if (period == "H")
                {
                    // lay ngay dau tien cua halfyear
                    var firstQuarterStartDate = CodeUtility.ToGetStartAndEndDateOfHalfYear(currentYear, point).Item1;
                    //lay ngay cuoi cua halfyear
                    DateTime currentQuarterEndDate = CodeUtility.ToGetStartAndEndDateOfHalfYear(currentYear, point).Item2;

                    model = data
                    .Select(x => new ActionPlanForChart
                    {
                        ID = x.ID,
                        Title = x.Title,
                        Description = x.Description,
                        Tag = x.Tag,
                        ApprovedStatus = x.ApprovedStatus,
                        ApprovedStatus2 = x.ApprovedStatus ? "Yes" : "No",
                        Deadline = x.Deadline.ToString("dddd, MMMM d, yyyy"),
                        UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        Status = x.Status,
                        IsBoss = x.IsBoss,
                        CreatedBy = x.UserID,
                        ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Auditor = x.Auditor,
                        ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Remark = x.Remark,
                        CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                        ApprovedByNames = x.ApprovedByName,
                        CreatedTimed = x.CreateTime,
                        CreatedTimed2 = x.CreateTime2,
                        CommentID = x.CommentID,
                        Index = index.ToString(),
                        RootCause = _dbContext.Comments.Find(x.CommentID).CommentMsg.Replace("@", "") ?? "#N/A",
                    }).Where(x => x.CreatedTimed2 >= firstQuarterStartDate && x.CreatedTimed2 <= currentQuarterEndDate).ToList();

                    model.ForEach(item =>
                    {
                        item.Index = index.ToString();
                        index++;
                    });
                }
                if (period == "Y")
                {
                    int year = point;
                    DateTime firstDay = new DateTime(year, 1, 1);
                    DateTime lastDay = new DateTime(year, 12, 31);

                    model = data
                    .Select(x => new ActionPlanForChart
                    {
                        ID = x.ID,
                        Title = x.Title,
                        Description = x.Description,
                        Tag = x.Tag,
                        ApprovedStatus = x.ApprovedStatus,
                        ApprovedStatus2 = x.ApprovedStatus ? "Yes" : "No",
                        Deadline = x.Deadline.ToString("dddd, MMMM d, yyyy"),
                        UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        Status = x.Status,
                        IsBoss = x.IsBoss,
                        CreatedBy = x.UserID,
                        ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Auditor = x.Auditor,
                        ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Remark = x.Remark,
                        CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                        ApprovedByNames = x.ApprovedByName,
                        CreatedTimed = x.CreateTime,
                        CreatedTimed2 = x.CreateTime2,
                        CommentID = x.CommentID,
                        Index = index.ToString(),
                        RootCause = _dbContext.Comments.Find(x.CommentID).CommentMsg.Replace("@", "") ?? "#N/A",
                    }).Where(x => x.CreatedTimed2 >= firstDay && x.CreatedTimed2 <= lastDay).ToList();

                    model.ForEach(item =>
                    {
                        item.Index = index.ToString();
                        index++;
                    });
                }

                return new
                {
                    status = true,
                    data = model
                };
            }
            catch (Exception ex)
            {

                return new
                {
                    status = false,
                    message = "No Data"
                };
            }
        }

        public async Task<object> SortActionPlanByPeriodTest(string period, int point, int kpilevelID,string kpilevelCode, int userID)
        {
            try
            {
                var userModel = await _dbContext.Users.FirstOrDefaultAsync(x => x.ID == userID);
                var currentYear = DateTime.Now.Year;
                var resultMonth = CodeUtility.ConvertNumberMothToString(point);
                var resultMonthofWeek = CodeUtility.GetMonth(currentYear, point);
                var a = CodeUtility.ConvertNumberMothToString(resultMonthofWeek);
                var model = new List<ActionPlanForChart>();
                var data = await _dbContext.ActionPlans
                    .Where(x => x.KPILevelID == kpilevelID)
                    .Select(x => new
                    {
                        x.ID,
                        x.Title,
                        x.Description,
                        x.Tag,
                        x.ApprovedStatus,
                        x.Deadline,
                        x.UpdateSheduleDate,
                        x.ActualFinishDate,
                        x.Status,
                        x.UserID,
                        x.CommentID,
                        x.DataID,
                        IsBoss = (int?)_dbContext.Roles.FirstOrDefault(a => a.ID == userModel.Permission).ID < 3 ? true : false,
                        CreatedBy = x.UserID,
                        x.Auditor,
                        x.ApprovedBy,
                        ApprovedByName = _dbContext.Users.FirstOrDefault(a => a.ID == x.ApprovedBy).Alias ?? "#N/A",
                        CreateTime = x.CreateTime.ToString("MMMM"),
                        CreateTime2 = x.CreateTime,
                        Remark = x.Remark ?? "#N/A"

                    })
                    .ToListAsync();

                int index = 1;

                if (period == "M")
                {
                    var dataID = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevelCode && x.Month == point).ID;
                    model = data
                    .Select(x => new ActionPlanForChart
                    {
                        ID = x.ID,
                        Title = x.Title,
                        Description = x.Description,
                        Tag = x.Tag,
                        ApprovedStatus = x.ApprovedStatus,
                        ApprovedStatus2 = x.ApprovedStatus ? "Yes" : "No",
                        Deadline = x.Deadline.ToString("dddd, MMMM d, yyyy"),
                        UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        Status = x.Status,
                        IsBoss = x.IsBoss,
                        CreatedBy = x.UserID,
                        DataID = x.DataID,
                        ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Auditor = x.Auditor,
                        ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Remark = x.Remark,
                        CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                        ApprovedByNames = x.ApprovedByName,
                        CreatedTimed = x.CreateTime,
                        CommentID = x.CommentID,
                        Index = index.ToString(),
                        RootCause = _dbContext.Comments.Find(x.CommentID).CommentMsg.Replace("@", "") ?? "#N/A",
                    }).Where(x => x.DataID == dataID).ToList();

                    model.ForEach(item =>
                    {
                        item.Index = index.ToString();
                        index++;
                    });
                }
                if (period == "W")
                {
                    var startDayOfWeek = CodeUtility.ToGetMondayOfWeek(currentYear, point);
                    var endDayOfWeek = CodeUtility.ToGetSaturdayOfWeek(currentYear, point);
                    var dataID = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevelCode && x.Week == point).ID;
                    model = data
                    .Select(x => new ActionPlanForChart
                    {
                        ID = x.ID,
                        Title = x.Title,
                        Description = x.Description,
                        Tag = x.Tag,
                        ApprovedStatus = x.ApprovedStatus,
                        ApprovedStatus2 = x.ApprovedStatus ? "Yes" : "No",
                        Deadline = x.Deadline.ToString("dddd, MMMM d, yyyy"),
                        UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        Status = x.Status,
                        IsBoss = x.IsBoss,
                        DataID = x.DataID,
                        CreatedBy = x.UserID,
                        ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Auditor = x.Auditor,
                        ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Remark = x.Remark,
                        CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                        ApprovedByNames = x.ApprovedByName,
                        CreatedTimed = x.CreateTime,
                        CreatedTimed2 = x.CreateTime2,
                        CommentID = x.CommentID,
                        Index = index.ToString(),
                        RootCause = _dbContext.Comments.Find(x.CommentID).CommentMsg.Replace("@", "") ?? "#N/A",
                    }).Where(x => x.DataID == dataID).ToList();

                    model.ForEach(item =>
                    {
                        item.Index = index.ToString();
                        index++;
                    });
                }
                if (period == "Q")
                {
                    var dataID = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevelCode && x.Quarter == point).ID;

                    // lay ngay dau tien cua quater
                    var firstQuarterStartDate = CodeUtility.ToGetStartAndEndDateOfQuarter(currentYear, point).Item1;
                    //lay ngay cuoi cua quater
                    DateTime currentQuarterEndDate = CodeUtility.ToGetStartAndEndDateOfQuarter(currentYear, point).Item2;

                    model = data
                    .Select(x => new ActionPlanForChart
                    {
                        ID = x.ID,
                        Title = x.Title,
                        Description = x.Description,
                        Tag = x.Tag,
                        DataID = x.DataID,
                        ApprovedStatus = x.ApprovedStatus,
                        ApprovedStatus2 = x.ApprovedStatus ? "Yes" : "No",
                        Deadline = x.Deadline.ToString("dddd, MMMM d, yyyy"),
                        UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        Status = x.Status,
                        IsBoss = x.IsBoss,
                        CreatedBy = x.UserID,
                        ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Auditor = x.Auditor,
                        ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Remark = x.Remark,
                        CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                        ApprovedByNames = x.ApprovedByName,
                        CreatedTimed = x.CreateTime,
                        CreatedTimed2 = x.CreateTime2,
                        CommentID = x.CommentID,
                        Index = index.ToString(),
                        RootCause = _dbContext.Comments.Find(x.CommentID).CommentMsg.Replace("@", "") ?? "#N/A",
                    }).Where(x => x.DataID == dataID).ToList();

                    model.ForEach(item =>
                    {
                        item.Index = index.ToString();
                        index++;
                    });
                }
                if (period == "H")
                {
                    var dataID = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevelCode && x.Half == point).ID;

                    // lay ngay dau tien cua halfyear
                    var firstQuarterStartDate = CodeUtility.ToGetStartAndEndDateOfHalfYear(currentYear, point).Item1;
                    //lay ngay cuoi cua halfyear
                    DateTime currentQuarterEndDate = CodeUtility.ToGetStartAndEndDateOfHalfYear(currentYear, point).Item2;

                    model = data
                    .Select(x => new ActionPlanForChart
                    {
                        ID = x.ID,
                        Title = x.Title,
                        Description = x.Description,
                        Tag = x.Tag,
                        DataID = x.DataID,
                        ApprovedStatus = x.ApprovedStatus,
                        ApprovedStatus2 = x.ApprovedStatus ? "Yes" : "No",
                        Deadline = x.Deadline.ToString("dddd, MMMM d, yyyy"),
                        UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        Status = x.Status,
                        IsBoss = x.IsBoss,
                        CreatedBy = x.UserID,
                        ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Auditor = x.Auditor,
                        ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Remark = x.Remark,
                        CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                        ApprovedByNames = x.ApprovedByName,
                        CreatedTimed = x.CreateTime,
                        CreatedTimed2 = x.CreateTime2,
                        CommentID = x.CommentID,
                        Index = index.ToString(),
                        RootCause = _dbContext.Comments.Find(x.CommentID).CommentMsg.Replace("@", "") ?? "#N/A",
                    }).Where(x => x.DataID == dataID).ToList();

                    model.ForEach(item =>
                    {
                        item.Index = index.ToString();
                        index++;
                    });
                }
                if (period == "Y")
                {

                    var dataID = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevelCode && x.Year == point).ID;

                    int year = point;
                    DateTime firstDay = new DateTime(year, 1, 1);
                    DateTime lastDay = new DateTime(year, 12, 31);

                    model = data
                    .Select(x => new ActionPlanForChart
                    {
                        ID = x.ID,
                        Title = x.Title,
                        Description = x.Description,
                        Tag = x.Tag,
                        DataID = x.DataID,
                        ApprovedStatus = x.ApprovedStatus,
                        ApprovedStatus2 = x.ApprovedStatus ? "Yes" : "No",
                        Deadline = x.Deadline.ToString("dddd, MMMM d, yyyy"),
                        UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                        Status = x.Status,
                        IsBoss = x.IsBoss,
                        CreatedBy = x.UserID,
                        ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Auditor = x.Auditor,
                        ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                        Remark = x.Remark,
                        CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                        ApprovedByNames = x.ApprovedByName,
                        CreatedTimed = x.CreateTime,
                        CreatedTimed2 = x.CreateTime2,
                        CommentID = x.CommentID,
                        Index = index.ToString(),
                        RootCause = _dbContext.Comments.Find(x.CommentID).CommentMsg.Replace("@", "") ?? "#N/A",
                    }).Where(x => x.DataID == dataID).ToList();

                    model.ForEach(item =>
                    {
                        item.Index = index.ToString();
                        index++;
                    });
                }

                return new
                {
                    status = true,
                    data = model
                };
            }
            catch (Exception ex)
            {

                return new
                {
                    status = false,
                    message = "No Data"
                };
            }
        }

        public async Task<List<ManagerOwnerUpdaterSponsorParticipantViewModel>> GetAllManagerOwnerUpdaterSponsorParticipant(int categoryID)
        {
            var managers = _dbContext.Managers;
            var owners = _dbContext.Owners;
            var updaters = _dbContext.Uploaders;
            var sponsors = _dbContext.Sponsors;
            var participant = _dbContext.Participants;
            var KPIs = _dbContext.KPIs;
            var users = _dbContext.Users;

            var data = await _dbContext.CategoryKPILevels.Where(x => x.CategoryID == categoryID)
                .Join(_dbContext.KPILevels, categoryKPILevel => categoryKPILevel.KPILevelID,kpilevel => kpilevel.ID,
                (categoryKPILevel, kpilevel) => new
                {
                    categoryKPILevel.KPILevelID,
                    categoryKPILevel.CategoryID,
                    kpilevel.KPIID,
                    kpilevel.Checked,
                    kpilevel.KPILevelCode,
                    categoryKPILevel.Status
                })
                 .Join(KPIs,
                categoryKPILevelKPI => categoryKPILevelKPI.KPIID,
                kpi => kpi.ID,
                (categoryKPILevelKPI, kpi) => new
                {
                    categoryKPILevelKPI.KPILevelID,
                    categoryKPILevelKPI.KPILevelCode,
                    categoryKPILevelKPI.CategoryID,
                    KPIName = kpi.Name,
                    Status = categoryKPILevelKPI.Status,
                    Unit = kpi.Unit,
                    categoryKPILevelKPI.Checked
                })
                .Select(x => new
                {
                    x.CategoryID,
                    x.KPILevelID,
                    x.KPIName,
                    x.Checked,
                    x.Status,
                    x.Unit,
                    x.KPILevelCode
                }).Where(x => x.Status == true).ToListAsync();
       
            var model = data
                .Select(x => new ManagerOwnerUpdaterSponsorParticipantViewModel
                {
                    CategoryID = x.CategoryID,
                    KPILevelID = x.KPILevelID,
                    KPIName = x.KPIName,
                    Checked = x.Checked,
                    Status = x.Status,
                    Unit = _dbContext.Units.FirstOrDefault(a => a.ID == x.Unit).Name.ToSafetyString(),
                    KPILevelCode = x.KPILevelCode
                }).ToList();

            return model;
        }
        public async Task<List<ManagerOwnerUpdaterSponsorParticipantViewModel>> GetAllManagerOwnerUpdaterSponsorParticipantWithLang(int categoryID,string lang)
        {
            var managers = _dbContext.Managers;
            var owners = _dbContext.Owners;
            var updaters = _dbContext.Uploaders;
            var sponsors = _dbContext.Sponsors;
            var participant = _dbContext.Participants;
            var KPIs = _dbContext.KPIs;
            var users = _dbContext.Users;

            var data = await _dbContext.CategoryKPILevels.Where(x => x.CategoryID == categoryID)
                .Join(_dbContext.KPILevels, categoryKPILevel => categoryKPILevel.KPILevelID, kpilevel => kpilevel.ID,
                (categoryKPILevel, kpilevel) => new
                {
                    categoryKPILevel.KPILevelID,
                    categoryKPILevel.CategoryID,
                    kpilevel.KPIID,
                    kpilevel.Checked,
                    kpilevel.KPILevelCode,
                    categoryKPILevel.Status
                }).Join(KPIs,
                categoryKPILevelKPI => categoryKPILevelKPI.KPIID,
                kpi => kpi.ID,
                (categoryKPILevelKPI, kpi) => new
                {
                    categoryKPILevelKPI.KPILevelID,
                    categoryKPILevelKPI.KPILevelCode,
                    categoryKPILevelKPI.CategoryID,
                    KPIName = kpi.KPILangs.FirstOrDefault(x => x.LanguageID == lang).Name,
                    Status = categoryKPILevelKPI.Status,
                    Unit = kpi.Unit,
                    Code = kpi.Code,
                    categoryKPILevelKPI.Checked
                }).Select(x => new
                {
                    x.CategoryID,
                    x.KPILevelID,
                    x.KPIName,
                    x.Code,
                    x.Checked,
                    x.Status,
                    x.Unit,
                    x.KPILevelCode
                }).Where(x => x.Status == true).ToListAsync();

            var model = data
                .Select(x => new ManagerOwnerUpdaterSponsorParticipantViewModel
                {
                    CategoryID = x.CategoryID,
                    KPILevelID = x.KPILevelID,
                    KPIName = x.KPIName,
                    Code = x.Code,
                    Checked = x.Checked,
                    Status = x.Status,
                    Unit = _dbContext.Units.FirstOrDefault(a => a.ID == x.Unit).Name.ToSafetyString(),
                    KPILevelCode = x.KPILevelCode
                }).ToList();

            return model;
        }
        public async Task<object> GetAllDataByCategory(int categoryid, string period, int? start, int? end, int? year)
        {
            var currentYear = DateTime.Now.Year;
            var currentWeek = DateTime.Now.GetIso8601WeekOfYear();
            var currentMonth = DateTime.Now.Month;
            var currentQuarter = DateTime.Now.GetQuarter();
            var currentHalf = DateTime.Now.GetQuarter();
            //labels của chartjs mặc định có 53 phần tử
            List <DatasetViewModel> listDatasetViewModel = new List<DatasetViewModel>();
            if (!period.IsNullOrEmpty())
            {
                var datasets = new List<object>();
                //labels của chartjs mặc định có 53 phần tử
                List<string> listLabels = new List<string>();

                var dataremarks = new List<Dataremark>();

                //var tbldata = _dbContext.Datas;

                var listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipant(categoryid);

                if (year == 0)
                    year = currentYear;

                if (period.ToLower() == "w")
                {
                    foreach (var item in listKPILevelID)
                    {
                        //var kpi = tblKPI.Find(item.KPIID).Name;
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(categoryid, item.KPILevelID);

                        var tbldata = await _dbContext.Datas
                        .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year && x.Value != "0")
                        .OrderBy(x => x.Week)
                        .Select(x => new
                        {
                            ID = x.ID,
                            Value = x.Value,
                            Remark = x.Remark,
                            x.Target,
                            Week = x.Week
                        }).ToListAsync();

                        dataremarks = tbldata.Where(a => a.Value != "")
                         .Select(a => new Dataremark
                         {
                             ID = a.ID,
                             Value = a.Value,
                             Remark = a.Remark,
                             Week = a.Week,
                             ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                         }).ToList();

                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }

                        listDatasetViewModel.Add(new DatasetViewModel
                        {
                            KPIName = item.KPIName,
                            Manager = obj.Manager,
                            Owner = obj.Owner,
                            Updater = obj.Updater,
                            Sponsor = obj.Sponsor,
                            Participant = obj.Participant,
                            CategoryName = tblCategory.Name,
                            CategoryCode = categorycode,
                            KPILevelCode = item.KPILevelCode,

                            Datasets = dataremarks,
                            Period = "Weekly"
                        });

                    }
                }
                else if (period.ToLower() == "m")
                {
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(categoryid, item.KPILevelID);
                        var tbldata = await _dbContext.Datas
                            .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "M" && x.Yearly == year && x.Value != "0")
                          .OrderBy(x => x.Month)
                          .Select(x => new
                          {
                              ID = x.ID,
                              Value = x.Value,
                              Remark = x.Remark,
                              x.Target,
                              Month = x.Month

                          }).ToListAsync();
                        dataremarks = tbldata
                          .Where(a => a.Value != "")
                         .Select(a => new Dataremark
                         {
                             ID = a.ID,
                             Value = a.Value,
                             Remark = a.Remark,
                             Week = a.Month,
                             ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                         }).ToList();

                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }

                        listDatasetViewModel.Add(new DatasetViewModel
                        {
                            KPIName = item.KPIName,
                            Manager = obj.Manager,
                            Owner = obj.Owner,
                            Updater = obj.Updater,
                            Sponsor = obj.Sponsor,
                            Participant = obj.Participant,
                            CategoryName = tblCategory.Name,
                            CategoryCode = categorycode,
                            KPILevelCode = item.KPILevelCode,

                            Datasets = dataremarks,
                            Period = "Monthly",
                        });

                    }
                }
                else if (period.ToLower() == "h")
                {
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(categoryid, item.KPILevelID);
                        var tbldata = await _dbContext.Datas
                            .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year && x.Value != "0")
                          .OrderBy(x => x.Half)
                         .Select(x => new
                         {
                             ID = x.ID,
                             Value = x.Value,
                             Remark = x.Remark,
                             x.Target,
                             x.Yearly,
                             Quarter = x.Half,

                         }).ToListAsync();

                        dataremarks = tbldata
                        .Where(a => a.Value != "")
                       .Select(a => new Dataremark
                       {
                           ID = a.ID,
                           Value = a.Value,
                           Remark = a.Remark,
                           Week = a.Quarter,
                           ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                       }).ToList();
                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }

                        listDatasetViewModel.Add(new DatasetViewModel()
                        {
                            KPIName = item.KPIName,
                            Manager = obj.Manager,
                            Owner = obj.Owner,
                            Updater = obj.Updater,
                            Sponsor = obj.Sponsor,
                            Participant = obj.Participant,
                            CategoryName = tblCategory.Name,
                            CategoryCode = categorycode,
                            KPILevelCode = item.KPILevelCode,
                            Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year).Target,
                            Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year).Yearly,
                            Datasets = dataremarks,
                            Period = "Half Year",
                        });

                    }
                }
                else if (period.ToLower() == "q")
                {
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(categoryid, item.KPILevelID);
                        var tbldata = await _dbContext.Datas
                            .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year && x.Value != "0")
                          .OrderBy(x => x.Quarter)
                         .Select(x => new
                         {
                             ID = x.ID,
                             Value = x.Value,
                             Remark = x.Remark,
                             x.Target,
                             Quarter = x.Quarter,

                         }).ToListAsync();
                        dataremarks = tbldata
                        .Where(a => a.Value != "")
                       .Select(a => new Dataremark
                       {
                           ID = a.ID,
                           Value = a.Value,
                           Remark = a.Remark,
                           Week = a.Quarter,
                           ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                       }).ToList();
                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }

                        listDatasetViewModel.Add(new DatasetViewModel()
                        {
                            KPIName = item.KPIName,
                            Manager = obj.Manager,
                            Owner = obj.Owner,
                            Updater = obj.Updater,
                            Sponsor = obj.Sponsor,
                            Participant = obj.Participant,
                            CategoryName = tblCategory.Name,
                            CategoryCode = categorycode,
                            KPILevelCode = item.KPILevelCode,

                            Datasets = dataremarks,
                            Period = "Quarterly",
                        });

                    }
                }
                else if (period.ToLower() == "y")
                {
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(categoryid, item.KPILevelID);
                        var tbldata = await _dbContext.Datas
                          .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Yearly == year && x.Value != "0")
                          .OrderBy(x => x.Year)
                          .Select(x => new
                          {
                              ID = x.ID,
                              Value = x.Value,
                              Remark = x.Remark,
                              x.Target,
                              Year = x.Year,

                          }).ToListAsync();
                        dataremarks = tbldata
                          .Where(a => a.Value != "")
                         .Select(a => new Dataremark
                         {
                             ID = a.ID,
                             Value = a.Value,
                             Remark = a.Remark,
                             Week = a.Year,
                             ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                         }).ToList();
                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var datasetsvm = new DatasetViewModel();
                        datasetsvm.KPIName = item.KPIName;
                        datasetsvm.Manager = obj.Manager;
                        datasetsvm.Owner = obj.Owner;
                        datasetsvm.Updater = obj.Updater;
                        datasetsvm.Sponsor = obj.Sponsor;
                        datasetsvm.Participant = obj.Participant;
                        datasetsvm.CategoryName = tblCategory.Name;
                        datasetsvm.CategoryCode = categorycode;
                        datasetsvm.KPILevelCode = item.KPILevelCode;

                        datasetsvm.Datasets = dataremarks;
                        datasetsvm.Period = "Yearly";

                        listDatasetViewModel.Add(new DatasetViewModel
                        {
                            KPIName = item.KPIName,
                            Manager = obj.Manager,
                            Owner = obj.Owner,
                            Updater = obj.Updater,
                            Sponsor = obj.Sponsor,
                            Participant = obj.Participant,
                            CategoryName = tblCategory.Name,
                            CategoryCode = categorycode,
                            KPILevelCode = item.KPILevelCode,

                            Datasets = dataremarks,
                            Period = "Yearly"
                        });
                    }
                }
            }
            return listDatasetViewModel;
        }
        public async Task<object> GetAllKpiOverview(int categoryid, string period, int? start, int? end,int? year,int userID)
        {

            var currentYear = DateTime.Now.Year;
            var currentWeek = DateTime.Now.GetIso8601WeekOfYear();
            var currentMonth = DateTime.Now.Month;
            var currentQuarter = DateTime.Now.GetQuarter();
            var currentHalf = DateTime.Now.GetQuarter();
            List<DatasetViewModel> listDatasetViewModel = new List<DatasetViewModel>();
            var listCategoryViewModel = new List<CategoryViewModel>();
            var listTitle = new List<TitleViewModal>();
            var AdminModel = _dbContext.Users.Find(userID);
            //var SpcLevelID = ;
            int SpcLevel = await _levelService.GetlevelOC(_dbContext.Users.Find(userID).LevelID);

            var ListOCs = await _levelService.GetListID(_dbContext.Users.Find(userID).LevelID);

            var categoryModel = _dbContext.Categories.Select(x => new CategoryViewModel {
                ID = x.ID,
                Name = x.Name + '-' + x.Code,
                CategoryCode = x.Code
            });
            if (!period.IsNullOrEmpty())
            {
                var datasets = new List<object>();
                //labels của chartjs mặc định có 53 phần tử
                List<string> listLabels = new List<string>();

                var dataremarks = new List<Dataremark>();

                var listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipant(0);
                //var OwnerModel = _dbContext.Managers.FirstOrDefault(x => x.UserID == userID).CategoryID;
                var OwnerModelList = _dbContext.Managers.Where(x => x.UserID == userID).ToList();
                var OwnerModelSelectCategory = _dbContext.Managers.Where(x => x.UserID == userID).Select(x=>x.CategoryID).Distinct().ToList();

                if(AdminModel.Role == 1)
                {
                    OwnerModelList = _dbContext.Managers.ToList();
                    OwnerModelSelectCategory = _dbContext.Managers.Select(x => x.CategoryID).Distinct().ToList();
                }
                else if( SpcLevel == 3 )
                {
                    OwnerModelList = _dbContext.Managers.ToList();
                    OwnerModelSelectCategory = _dbContext.Managers.Select(x => x.CategoryID).Distinct().ToList();
                }
                else
                {
                    OwnerModelList = _dbContext.Managers.Where(x => x.UserID == userID).ToList();
                    OwnerModelSelectCategory = _dbContext.Managers.Where(x => x.UserID == userID).Select(x => x.CategoryID).Distinct().ToList();
                }

                // lấy danh sách category của manager
                foreach (var item in OwnerModelSelectCategory)
                {
                    var category = _dbContext.Categories.Find(item);
                    if(category != null)
                    {
                        listCategoryViewModel.Add(new CategoryViewModel()
                        {
                            ID = category.ID,
                            Name = category.Name + '-' + category.Code,
                            CategoryCode = category.Code
                        });
                    }
                }

                // listKPILevelID
                foreach (var item in OwnerModelList)
                {
                    
                    if(item.UserID == userID)
                    {
                        if (categoryid == 0)
                        {
                            var listKPILevelID2 = await GetAllManagerOwnerUpdaterSponsorParticipant(item.CategoryID);
                            var kpiID = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPIID;
                            var check = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).Checked;
                            var kpiname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Name;
                            var stt = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Status;
                            var unitname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Unit;
                            var kpilevelcode = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPILevelCode;
                            listKPILevelID.Add(new ManagerOwnerUpdaterSponsorParticipantViewModel
                            {
                                CategoryID = item.CategoryID,
                                KPILevelID = item.KPILevelID,
                                Checked = check,
                                KPIName = kpiname,
                                Status = stt,
                                Unit = _dbContext.Units.FirstOrDefault(x => x.ID == unitname).Name.ToSafetyString(),
                                KPILevelCode = kpilevelcode
                            });
                        }
                        else
                        {
                            listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipant(categoryid);
                        }
                    }
                    else if (AdminModel.Role == 1)
                    {
                        if (categoryid == 0)
                        {
                            var listKPILevelID2 = await GetAllManagerOwnerUpdaterSponsorParticipant(item.CategoryID);
                            //if(item.KPILevelID != null)
                            var FindKPIID = _dbContext.KPILevels.Find(item.KPILevelID);
                            //var kpiID = 0;
                            if (FindKPIID != null) {
                                var kpiID = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPIID;
                                var kpiname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Name;
                                var stt = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Status;
                                var check = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).Checked;
                                var unitname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Unit;
                                var kpilevelcode = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPILevelCode;
                                listKPILevelID.Add(new ManagerOwnerUpdaterSponsorParticipantViewModel
                                {
                                    CategoryID = item.CategoryID,
                                    KPILevelID = item.KPILevelID,
                                    KPIName = kpiname,
                                    Checked = check,
                                    Status = stt,
                                    Unit = _dbContext.Units.FirstOrDefault(x => x.ID == unitname).Name.ToSafetyString(),
                                    KPILevelCode = kpilevelcode
                                });
                            }
                        }
                        else
                        {
                            listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipant(categoryid);
                        }
                    }
                    else if(SpcLevel == 3 )
                    {
                        if (categoryid == 0)
                        {
                            var listKPILevelID2 = await GetAllManagerOwnerUpdaterSponsorParticipant(item.CategoryID);
                            var FindKPIID = _dbContext.KPILevels.Find(item.KPILevelID);
                            var myList = ListOCs as IEnumerable;
                            foreach (int items in myList)
                            {
                                int LevelID = 0;
                                if (FindKPIID != null)
                                {
                                    LevelID = _dbContext.KPILevels.Find(item.KPILevelID).LevelID;
                                }
                                if (items == LevelID)
                                {
                                    if (FindKPIID != null)
                                    {
                                        var kpiID = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPIID;
                                        var kpiname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Name;
                                        var stt = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Status;
                                        var check = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).Checked;
                                        var unitname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Unit;
                                        var kpilevelcode = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPILevelCode;
                                        listKPILevelID.Add(new ManagerOwnerUpdaterSponsorParticipantViewModel
                                        {
                                            CategoryID = item.CategoryID,
                                            KPILevelID = item.KPILevelID,
                                            KPIName = kpiname,
                                            Checked = check,
                                            Status = stt,
                                            Unit = _dbContext.Units.FirstOrDefault(x => x.ID == unitname).Name.ToSafetyString(),
                                            KPILevelCode = kpilevelcode
                                        });
                                    }
                                }
                            }

                        }
                        else
                        {
                            listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipant(categoryid);
                        }
                    }
                    else
                    {
                        return listDatasetViewModel;
                    }

                }


                if (year == 0)
                    year = currentYear;

                if (period.ToLower() == "w")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "W" && x.Yearly == year && x.Value != "0")
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Week
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        //var kpi = tblKPI.Find(item.KPIID).Name;
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(item.CategoryID, item.KPILevelID);
                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }
                        var tbldata = await _dbContext.Datas
                       .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year)
                        .OrderBy(x => x.Week)
                        .Select(x => new
                        {
                            ID = x.ID,
                            Value = x.Value,
                            Remark = x.Remark,
                            x.Target,
                            Week = x.Week
                        })
                        .ToListAsync();
                        dataremarks = tbldata
                                     .Where(a => a.Value != null)
                     .Select(a => new Dataremark
                     {
                         ID = a.ID,
                         Value = a.Value,
                         Remark = a.Remark,
                         Week = a.Week,
                         ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                     }).ToList();

                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year).Select(x => x.Target).ToList();
                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listDatasetViewModel.Add(new DatasetViewModel
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                CategoryName = tblCategory.Name,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                Checked = item.Checked,
                                KPILevelCode = item.KPILevelCode,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Weekly",
                                Unit = item.Unit,
                                Status = item.Status
                            });
                        }

                    }
                }
                else if (period.ToLower() == "m")
                {

                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "M" && x.Yearly == year && x.Value != "0")
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Month
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(item.CategoryID, item.KPILevelID);

                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }
                        var tbldata = await _dbContext.Datas
                            .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "M" && x.Yearly == year)
                              .OrderBy(x => x.Month)
                              .Select(x => new
                              {
                                  ID = x.ID,
                                  Value = x.Value,
                                  Remark = x.Remark,
                                  x.Target,
                                  Month = x.Month,

                              }).ToListAsync();
                        dataremarks = tbldata
                          .Where(a => a.Value != null)
                         .Select(a => new Dataremark
                         {
                             ID = a.ID,
                             Value = a.Value,
                             Remark = a.Remark,
                             Week = a.Month,
                             ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                         }).ToList();

                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "M" && x.Yearly == year).Select(x => x.Target).ToList();

                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listDatasetViewModel.Add(new DatasetViewModel
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                CategoryName = tblCategory.Name,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                KPILevelCode = item.KPILevelCode,
                                Checked = item.Checked,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "M" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "M" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Monthly",
                                Unit = item.Unit,
                                Status = item.Status
                            });
                        }

                    }
                }
                else if (period.ToLower() == "h")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "H" && x.Yearly == year && x.Value != "0")
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Half
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;
                        var obj = await GetAllOwner(item.CategoryID, item.KPILevelID);
                        // nếu category = 0
                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }
                        
                        var tbldata = await _dbContext.Datas
                            .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year)
                          .OrderBy(x => x.Half)
                         .Select(x => new
                         {
                             ID = x.ID,
                             Value = x.Value,
                             Remark = x.Remark,
                             x.Target,
                             x.Yearly,
                             Quarter = x.Half,

                         }).ToListAsync();

                        dataremarks = tbldata.Where(a => a.Value != null)
                       .Select(a => new Dataremark
                           {
                               ID = a.ID,
                               Value = a.Value,
                               Remark = a.Remark,
                               Week = a.Quarter,
                               ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                           }).ToList();
                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year).Select(x => x.Target).ToList();
                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listDatasetViewModel.Add(new DatasetViewModel()
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                CategoryName = tblCategory.Name,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                Checked = item.Checked,
                                KPILevelCode = item.KPILevelCode,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Half Year",
                                Unit = item.Unit,
                                Status = item.Status
                            });
                        }
                        

                    }
                }
                else if (period.ToLower() == "q")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "Q" && x.Yearly == year && x.Value != "0")
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Quarter
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(item.CategoryID, item.KPILevelID);
                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }
                        var tbldata = await _dbContext.Datas
                            .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year)
                          .OrderBy(x => x.Quarter)
                         .Select(x => new
                         {
                             ID = x.ID,
                             Value = x.Value,
                             Remark = x.Remark,
                             x.Target,
                             Quarter = x.Quarter,

                         }).ToListAsync();
                        dataremarks = tbldata
                        .Where(a => a.Value != null)
                       .Select(a => new Dataremark
                       {
                           ID = a.ID,
                           Value = a.Value,
                           Remark = a.Remark,
                           Week = a.Quarter,
                           ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                       }).ToList();
                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year).Select(x => x.Target).ToList();
                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listDatasetViewModel.Add(new DatasetViewModel()
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                CategoryName = tblCategory.Name,
                                Checked = item.Checked,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                KPILevelCode = item.KPILevelCode,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Quarterly",
                                Status = item.Status,
                                Unit = item.Unit
                            });
                        }


                    }
                }
                else if (period.ToLower() == "y")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "Y" && x.Yearly == year && x.Value != "0")
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Year
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(item.CategoryID, item.KPILevelID);
                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }
                        var tbldata = await _dbContext.Datas
                          .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Yearly == year)
                          .OrderBy(x => x.Year)
                          .Select(x => new
                          {
                              ID = x.ID,
                              Value = x.Value,
                              Remark = x.Remark,
                              x.Target,
                              Year = x.Year,

                          }).ToListAsync();
                        dataremarks = tbldata
                          .Where(a => a.Value != null)
                         .Select(a => new Dataremark
                         {
                             ID = a.ID,
                             Value = a.Value,
                             Remark = a.Remark,
                             Week = a.Year,
                             ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                         }).ToList();
                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Yearly == year).Select(x => x.Target).ToList();
                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listDatasetViewModel.Add(new DatasetViewModel
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                Checked = item.Checked,
                                CategoryName = tblCategory.Name,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                KPILevelCode = item.KPILevelCode,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Yearly",
                                Unit = item.Unit,
                                Status = item.Status
                            });
                        }

                    }
                }
            }
            //if (!name.IsNullOrEmpty())
            //{
            //    listDatasetViewModel = listDatasetViewModel.Where(x => x.KPIName.ToString().ToLower().Contains(name.ToString().ToLower())).ToList();
            //}
            //int totalRow = listDatasetViewModel.Count();
            //int totalPage = (int)Math.Ceiling((double)totalRow / pageSize);
            //var currenPage = page;
            //if (totalPage > 0)
            //{
            //    if (currenPage < 1)
            //        currenPage = 1;

            //    if (currenPage > totalPage)
            //        currenPage = totalPage.ToInt();
            //}
            //var pagedList = PagedList<DatasetViewModel>.Create(listDatasetViewModel, page, pageSize);
            if (AdminModel.Role == 1)
            {

                return new
                {
                    listTitle,
                    model = listDatasetViewModel.Where(x => x.Checked == true ).DistinctBy(x => x.KPIName),
                    categorymodel = categoryModel,
                };
            }
            else if(SpcLevel == 3)
            {
                return new
                {
                    listTitle,
                    model = listDatasetViewModel.Where(x => x.Checked == true ).DistinctBy(x => x.KPIName),
                    categorymodel = categoryModel,
                };
            }
            else
            {
                return new
                {
                   listTitle,
                   model = listDatasetViewModel.Where(x => x.Checked == true).DistinctBy(x => x.KPIName),
                   categorymodel = listCategoryViewModel,
                };
            }
            
            //throw new NotImplementedException();
        }


        public async Task<object> GetAllKpiOverview2(int categoryid, string period, string lang, int? start, int? end, int? year, int userID)
        {

            var currentYear = DateTime.Now.Year;
            var currentWeek = DateTime.Now.GetIso8601WeekOfYear();
            var currentMonth = DateTime.Now.Month;
            var currentQuarter = DateTime.Now.GetQuarter();
            var currentHalf = DateTime.Now.GetQuarter();
            List<DatasetViewModel> listDatasetViewModel = new List<DatasetViewModel>();
            var listCategoryViewModel = new List<CategoryViewModel>();
            var listTitle = new List<TitleViewModal>();
            var listTitle2 = new List<Dataremark>();
            var list_level = new List<ListLevel>();

            var AdminModel = _dbContext.Users.Find(userID);

            int SpcLevel = await _levelService.GetlevelOC(_dbContext.Users.Find(userID).LevelID);

            var ListOCs = await _levelService.GetListID(_dbContext.Users.Find(userID).LevelID);

            var categoryModel = _dbContext.Categories.Select(x => new CategoryViewModel
            {
                ID = x.ID,
                Name = x.CategoryLangs.FirstOrDefault(x => x.LanguageID == lang).Name ?? x.Name + '-' + x.Code,
                CategoryCode = x.Code
            });

            if (!period.IsNullOrEmpty())
            {
                var datasets = new List<object>();
                //labels của chartjs mặc định có 53 phần tử
                List<string> listLabels = new List<string>();
                var dataremarks = new List<Dataremark>();
                var listtarget = new List<Dataremark>();
                var listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipant(0);
                var OwnerModelList = _dbContext.Managers.ToList();
                var OwnerModelSelectCategory = new List<int>();

                if (AdminModel.Role == 1 || SpcLevel == 2)
                {
                    //OwnerModelList = _dbContext.Managers.ToList();
                    OwnerModelSelectCategory = _dbContext.Managers.Select(x => x.CategoryID).Distinct().ToList();
                }

                else if (SpcLevel == 3 )
                {
                    //OwnerModelList = _dbContext.Managers.ToList();
                    OwnerModelSelectCategory = _dbContext.Managers.Select(x => x.CategoryID).Distinct().ToList();
                }

                else
                {
                    //OwnerModelList = _dbContext.Managers.ToList();
                    OwnerModelSelectCategory = _dbContext.Managers.Select(x => x.CategoryID).Distinct().ToList();
                }

                // lấy danh sách category của manager
                foreach (var item in OwnerModelSelectCategory)
                {
                    var category = _dbContext.Categories.Find(item);
                    var categoryName = _dbContext.CategoryLangs.FirstOrDefault(x => x.CategoryID == category.ID && x.LanguageID == lang).Name;
                    if (category != null)
                    {
                        listCategoryViewModel.Add(new CategoryViewModel()
                        {
                            ID = category.ID,
                            Name = categoryName + '-' + category.Code,
                            CategoryCode = category.Code
                        });
                    }
                }

                // listKPILevelID
                foreach (var item in OwnerModelList)
                {
                    if (item.UserID == userID)
                    {
                        if (categoryid == 0)
                        {
                            var listKPILevelID2 = await GetAllManagerOwnerUpdaterSponsorParticipant(item.CategoryID);
                            var kpiID = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPIID;
                            var check = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).Checked;
                            var kpiname = _dbContext.KPILangs.FirstOrDefault(x => x.KPIID == kpiID && x.LanguageID == lang).Name;
                            var stt = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Status;
                            var kpicode = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Code;
                            var unitname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Unit;
                            var kpilevelcode = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPILevelCode;

                            listKPILevelID.Add(new ManagerOwnerUpdaterSponsorParticipantViewModel
                            {
                                CategoryID = item.CategoryID,
                                KPILevelID = item.KPILevelID,
                                Checked = check,
                                Code = kpicode,
                                KPIName = kpiname,
                                Status = stt,
                                Unit = _dbContext.Units.FirstOrDefault(x => x.ID == unitname).Name.ToSafetyString(),
                                KPILevelCode = kpilevelcode
                            });
                        }
                        else
                        {
                            listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipantWithLang(categoryid, lang);
                        }
                    }
                    else if (AdminModel.Role == 1 || SpcLevel == 2)
                    {
                        if (categoryid == 0)
                        {
                            var listKPILevelID2 = await GetAllManagerOwnerUpdaterSponsorParticipant(item.CategoryID);
                            var FindKPIID = _dbContext.KPILevels.Find(item.KPILevelID);
                            if (FindKPIID != null)
                            {
                                var kpiID = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPIID;
                                var kpiname = _dbContext.KPILangs.FirstOrDefault(x => x.KPIID == kpiID && x.LanguageID == lang).Name;
                                var kpicode = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Code;
                                var stt = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Status;
                                var check = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).Checked;
                                var unitname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Unit;
                                var kpilevelcode = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPILevelCode;
                                var LevelID = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).LevelID;
                                var Area = _dbContext.Levels.FirstOrDefault(x => x.ID == LevelID).Name;
                                listKPILevelID.Add(new ManagerOwnerUpdaterSponsorParticipantViewModel
                                {
                                    CategoryID = item.CategoryID,
                                    KPILevelID = item.KPILevelID,
                                    Area = Area,
                                    KPIName = kpiname,
                                    Code = kpicode,
                                    Checked = check,
                                    Status = stt,
                                    Unit = _dbContext.Units.FirstOrDefault(x => x.ID == unitname).Name.ToSafetyString(),
                                    KPILevelCode = kpilevelcode
                                });
                            }
                        }
                        else
                        {
                            listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipantWithLang(categoryid, lang);
                        }
                    }
                    else if (SpcLevel >= 3 )
                    {
                        if (categoryid == 0)
                        {
                            var listKPILevelID2 = await GetAllManagerOwnerUpdaterSponsorParticipant(item.CategoryID);
                            var FindKPIID = _dbContext.KPILevels.Find(item.KPILevelID);
                            var myList = ListOCs as IEnumerable;
                            foreach (int items in myList)
                            {
                                int LevelID = 0;
                                if (FindKPIID != null)
                                {
                                    LevelID = _dbContext.KPILevels.Find(item.KPILevelID).LevelID;
                                }
                                if (items == LevelID)
                                {
                                    if (FindKPIID != null)
                                    {
                                        var kpiID = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPIID;
                                        var kpiname = _dbContext.KPILangs.FirstOrDefault(x => x.KPIID == kpiID && x.LanguageID == lang).Name;
                                        var kpicode = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Code;
                                        var stt = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Status;
                                        var check = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).Checked;
                                        var unitname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Unit;
                                        var kpilevelcode = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPILevelCode;
                                        listKPILevelID.Add(new ManagerOwnerUpdaterSponsorParticipantViewModel
                                        {
                                            CategoryID = item.CategoryID,
                                            KPILevelID = item.KPILevelID,
                                            KPIName = kpiname,
                                            Checked = check,
                                            Code = kpicode,
                                            Status = stt,
                                            Unit = _dbContext.Units.FirstOrDefault(x => x.ID == unitname).Name.ToSafetyString(),
                                            KPILevelCode = kpilevelcode
                                        });
                                    }
                                }
                            }

                        }
                        else
                        {
                            listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipantWithLang(categoryid,lang);
                        }
                    }
                    else
                    {
                        return listDatasetViewModel;
                    }

                }


                if (year == 0)
                    year = currentYear;

                if (period.ToLower() == "w")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "W" && x.Yearly == year && x.Value != "0")
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Week
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = new DataUserViewModel();
                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }
                        var tbldata = await _dbContext.Datas
                        .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year)
                        .OrderBy(x => x.Week)
                        .Select(x => new
                        {
                            ID = x.ID,
                            Value = Math.Round(Convert.ToDecimal(x.Value), 2).ToString(),
                            Remark = x.Remark,
                            x.Target,
                            Week = x.Week
                        })
                        .ToListAsync();
                        dataremarks = tbldata
                                     .Where(a => a.Value != null)
                     .Select(a => new Dataremark
                     {
                         ID = a.ID,
                         Value = a.Value,
                         Remark = a.Remark,
                         Week = a.Week,
                         Target = a.Target,
                         ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                     }).ToList();

                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year).Select(x => x.Target).ToList();
                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listTitle2 = dataremarks;
                            listDatasetViewModel.Add(new DatasetViewModel
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Code = item.Code,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                CategoryName = tblCategory.Name,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                Checked = item.Checked,
                                KPILevelCode = item.KPILevelCode,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Level = _levelService.GetNodelevel(item.KPILevelCode),
                                Level_ID = _levelService.GetNodelevel_ID(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Weekly",
                                Unit = item.Unit,
                                Status = item.Status
                            });
                        }
                    }
                }
                else if (period.ToLower() == "m")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "M" && x.Yearly == year)
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Month
                        }).Distinct().ToList();
                    foreach (var itemms in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(itemms.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = new DataUserViewModel();

                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(itemms.CategoryID, itemms.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, itemms.KPILevelID);
                            obj = objtamp;
                        }
                        var tbldata = await _dbContext.Datas
                            .Where(x => x.KPILevelCode == itemms.KPILevelCode && x.Period == "M" && x.Yearly == year)
                            .OrderBy(x => x.Month)
                            .Select(x => new
                            {
                                ID = x.ID,
                                Value = x.Value,
                                Remark = x.Remark,
                                x.Target,
                                Month = x.Month

                            }).ToListAsync();
                        dataremarks = tbldata.Where(a => a.Value != null).Select(a => new Dataremark
                         {
                             ID = a.ID,
                             Value = a.Value,
                             Remark = a.Remark,
                             Week = a.Month,
                             Target = a.Target,
                             ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target }
                         }).ToList();

                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == itemms.KPILevelCode && x.Period == "M" && x.Yearly == year).Select(x => x.Target).ToList();

                        if (dataTarget.Count > 0)
                        {
                            listTitle2 = dataremarks;
                            listDatasetViewModel.Add(new DatasetViewModel
                            {
                                KPIName = itemms.KPIName,
                                Code = itemms.Code,
                                Manager = obj.Manager,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                CategoryName = tblCategory.Name,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                KPILevelCode = itemms.KPILevelCode,
                                Checked = itemms.Checked,
                                Area = _levelService.GetNode(itemms.KPILevelCode),
                                Level = _levelService.GetNodelevel(itemms.KPILevelCode),
                                Level_ID = _levelService.GetNodelevel_ID(itemms.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == itemms.KPILevelCode && x.Period == "M" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == itemms.KPILevelCode && x.Period == "M" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Monthly",
                                Unit = itemms.Unit,
                                Status = itemms.Status
                            });
                        }
                    }
                }
                else if (period.ToLower() == "h")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "H" && x.Yearly == year )
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Half
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;
                        var obj = new DataUserViewModel();
                        // nếu category = 0
                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }

                        var tbldata = await _dbContext.Datas
                        .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year)
                        .OrderBy(x => x.Half)
                        .Select(x => new
                         {
                             ID = x.ID,
                             Value = x.Value,
                             Remark = x.Remark,
                             x.Target,
                             x.Yearly,
                             Quarter = x.Half,
                         }).ToListAsync();

                        dataremarks = tbldata.Where(a => a.Value != null)
                       .Select(a => new Dataremark
                       {
                           ID = a.ID,
                           Value = a.Value,
                           Remark = a.Remark,
                           Week = a.Quarter,
                           Target = a.Target,
                           ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                       }).ToList();
                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year).Select(x => x.Target).ToList();
                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listTitle2 = dataremarks;
                            listDatasetViewModel.Add(new DatasetViewModel()
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Code = item.Code,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                CategoryName = tblCategory.Name,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                Checked = item.Checked,
                                KPILevelCode = item.KPILevelCode,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Level = _levelService.GetNodelevel(item.KPILevelCode),
                                Level_ID = _levelService.GetNodelevel_ID(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year && x.Half == start).Target,
                                Target2 = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year && x.Half == end).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Half Year",
                                Unit = item.Unit,
                                Status = item.Status
                            });
                        }
                    }
                }
                else if (period.ToLower() == "q")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "Q" && x.Yearly == year )
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Quarter
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = new DataUserViewModel();
                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }
                        var tbldata = await _dbContext.Datas
                            .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year)
                          .OrderBy(x => x.Quarter)
                         .Select(x => new
                         {
                             ID = x.ID,
                             Value = x.Value,
                             Remark = x.Remark,
                             x.Target,
                             Quarter = x.Quarter,

                         }).ToListAsync();
                        dataremarks = tbldata.Where(a => a.Value != null)
                       .Select(a => new Dataremark
                       {
                           ID = a.ID,
                           Value = a.Value,
                           Remark = a.Remark,
                           Week = a.Quarter,
                           Target = a.Target,
                           ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                       }).ToList();
                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year).Select(x => x.Target).ToList();
                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listTitle2 = dataremarks;
                            listDatasetViewModel.Add(new DatasetViewModel()
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Code = item.Code,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                CategoryName = tblCategory.Name,
                                Checked = item.Checked,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                KPILevelCode = item.KPILevelCode,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Level = _levelService.GetNodelevel(item.KPILevelCode),
                                Level_ID = _levelService.GetNodelevel_ID(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Quarterly",
                                Status = item.Status,
                                Unit = item.Unit
                            });
                        }
                    }
                }
                else if (period.ToLower() == "y")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "Y" && x.Yearly == year)
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Year
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = new DataUserViewModel();
                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }
                        var tbldata = await _dbContext.Datas
                          .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Yearly == year)
                          .OrderBy(x => x.Year)
                          .Select(x => new
                          {
                              ID = x.ID,
                              Value = x.Value,
                              Remark = x.Remark,
                              x.Target,
                              Year = x.Year,

                          }).ToListAsync();
                        dataremarks = tbldata
                          .Where(a => a.Value != null)
                         .Select(a => new Dataremark
                         {
                             ID = a.ID,
                             Value = a.Value,
                             Remark = a.Remark,
                             Target = a.Target,
                             Week = a.Year,
                             Status = a.Target.ToDouble() >= a.Value.ToDouble() ? false : true,
                             ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                         }).ToList();
                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start - 1 && x.Week <= end).ToList();
                        }
                        //if (start > 0 && end > 0)
                        //{
                        //    dataremarks = dataremarks.ToList();
                        //}
                        foreach (var item_target in dataremarks)
                        {
                            if (item_target.Week == start - 1)
                            {
                                listtarget.Add(item_target);

                            }else
                            {
                                listtarget.Add(new Dataremark
                                {
                                    Value = item_target.Target,
                                    Remark = item_target.Remark,
                                    Status = item_target.Status,
                                    Target = item_target.Target,
                                    Week = item_target.Week,
                                });
                                listtarget.Add(item_target);
                            }
                        }

                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Yearly == year).Select(x => x.Target).ToList();
                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listTitle2 = listtarget;
                            
                            listDatasetViewModel.Add(new DatasetViewModel
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Code = item.Code,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                Checked = item.Checked,
                                CategoryName = tblCategory.Name,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                KPILevelCode = item.KPILevelCode,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Level = _levelService.GetNodelevel(item.KPILevelCode),
                                Level_ID = _levelService.GetNodelevel_ID(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Year == year).Target,
                                Target2 = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Year == year - 1).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Yearly == year).Yearly,
                                Datasets = listtarget,
                                Period = "Yearly",
                                Unit = item.Unit,
                                Status = item.Status
                            });
                            listtarget = new List<Dataremark>();
                        }

                    }
                }

            }

            //if (!name.IsNullOrEmpty())
            //{
            //    listDatasetViewModel = listDatasetViewModel.Where(x => x.KPIName.ToString().ToLower().Contains(name.ToString().ToLower())).ToList();
            //}
            //int totalRow = listDatasetViewModel.Count();
            //int totalPage = (int)Math.Ceiling((double)totalRow / pageSize);
            //var currenPage = page;
            //if (totalPage > 0)
            //{
            //    if (currenPage < 1)
            //        currenPage = 1;

            //    if (currenPage > totalPage)
            //        currenPage = totalPage.ToInt();
            //}
            //var pagedList = PagedList<DatasetViewModel>.Create(listDatasetViewModel, page, pageSize);

            var itemss = listDatasetViewModel.Where(y => y.Checked == true ).GroupBy(x => x.Area).Select(x => new
            {
                Area = x.FirstOrDefault().Area,
                Level = x.FirstOrDefault().Level,
                Level_ID = x.FirstOrDefault().Level_ID,
                Data = listDatasetViewModel.Where(t => t.Area == x.FirstOrDefault().Area).DistinctBy(x => x.KPIName).OrderBy(x => x.CategoryCode).ToList(),
            }).OrderBy(x => x.Level_ID);

            if (AdminModel.Role == 1)
            {

                return new
                {
                    listTitle2,
                    list_level = itemss.Select(x => new ListLevel {
                        ID = x.Level,
                        Name = x.Level.ToString()
                    }).DistinctBy(y => y.ID),
                    model = itemss,
                    categorymodel = categoryModel,
                };
            }
            else if (SpcLevel == 3)
            {
                return new
                {
                    listTitle2,
                    list_level = itemss.Select(x => new ListLevel
                    {
                        ID = x.Level,
                        Name = x.Level.ToString()
                    }).DistinctBy(y => y.ID),
                    model = itemss,
                    categorymodel = listCategoryViewModel,
                };
            }
            else
            {
                return new
                {
                    listTitle2,
                    list_level = itemss.Select(x => new ListLevel
                    {
                        ID = x.Level,
                        Name = x.Level.ToString()
                    }).DistinctBy(y => y.ID),
                    model = itemss,
                    categorymodel = listCategoryViewModel,
                };
            }

            //throw new NotImplementedException();
        }

        public async Task<object> SortKpiOverview(int categoryid, string period, int? start, int? end, int? year, int userID)
        {
            var currentYear = DateTime.Now.Year;
            var currentWeek = DateTime.Now.GetIso8601WeekOfYear();
            var currentMonth = DateTime.Now.Month;
            var currentQuarter = DateTime.Now.GetQuarter();
            var currentHalf = DateTime.Now.GetQuarter();
            List<DatasetViewModel> listDatasetViewModel = new List<DatasetViewModel>();
            var listCategoryViewModel = new List<CategoryViewModel>();
            var listTitle = new List<TitleViewModal>();
            var AdminModel = _dbContext.Users.Find(userID);
            //var SpcLevelID = ;
            int SpcLevel = await _levelService.GetlevelOC(_dbContext.Users.Find(userID).LevelID);

            var ListOCs = await _levelService.GetListID(_dbContext.Users.Find(userID).LevelID);

            var categoryModel = _dbContext.Categories.Select(x => new CategoryViewModel
            {
                ID = x.ID,
                Name = x.Name + '-' + x.Code,
                CategoryCode = x.Code
            });
            if (!period.IsNullOrEmpty())
            {
                var datasets = new List<object>();
                //labels của chartjs mặc định có 53 phần tử
                List<string> listLabels = new List<string>();

                var dataremarks = new List<Dataremark>();

                var listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipant(0);
                //var OwnerModel = _dbContext.Managers.FirstOrDefault(x => x.UserID == userID).CategoryID;
                var OwnerModelList = _dbContext.Managers.Where(x => x.UserID == userID).ToList();
                var OwnerModelSelectCategory = _dbContext.Managers.Where(x => x.UserID == userID).Select(x => x.CategoryID).Distinct().ToList();

                if (AdminModel.Role == 1)
                {
                    OwnerModelList = _dbContext.Managers.ToList();
                    OwnerModelSelectCategory = _dbContext.Managers.Select(x => x.CategoryID).Distinct().ToList();
                }
                else if (SpcLevel == 3)
                {
                    OwnerModelList = _dbContext.Managers.ToList();
                    OwnerModelSelectCategory = _dbContext.Managers.Select(x => x.CategoryID).Distinct().ToList();
                }
                else
                {
                    OwnerModelList = _dbContext.Managers.Where(x => x.UserID == userID).ToList();
                    OwnerModelSelectCategory = _dbContext.Managers.Where(x => x.UserID == userID).Select(x => x.CategoryID).Distinct().ToList();
                }

                // lấy danh sách category của manager
                foreach (var item in OwnerModelSelectCategory)
                {
                    var category = _dbContext.Categories.Find(item);
                    if (category != null)
                    {
                        listCategoryViewModel.Add(new CategoryViewModel()
                        {
                            ID = category.ID,
                            Name = category.Name + '-' + category.Code,
                            CategoryCode = category.Code
                        });
                    }
                }

                // listKPILevelID
                foreach (var item in OwnerModelList)
                {

                    if (item.UserID == userID)
                    {
                        if (categoryid == 0)
                        {
                            var listKPILevelID2 = await GetAllManagerOwnerUpdaterSponsorParticipant(item.CategoryID);
                            var kpiID = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPIID;
                            var check = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).Checked;
                            var kpiname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Name;
                            var stt = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Status;
                            var unitname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Unit;
                            var kpilevelcode = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPILevelCode;
                            listKPILevelID.Add(new ManagerOwnerUpdaterSponsorParticipantViewModel
                            {
                                CategoryID = item.CategoryID,
                                KPILevelID = item.KPILevelID,
                                Checked = check,
                                KPIName = kpiname,
                                Status = stt,
                                Unit = _dbContext.Units.FirstOrDefault(x => x.ID == unitname).Name.ToSafetyString(),
                                KPILevelCode = kpilevelcode
                            });
                        }
                        else
                        {
                            listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipant(categoryid);
                        }
                    }
                    else if (AdminModel.Role == 1)
                    {
                        if (categoryid == 0)
                        {
                            var listKPILevelID2 = await GetAllManagerOwnerUpdaterSponsorParticipant(item.CategoryID);
                            //if(item.KPILevelID != null)
                            var FindKPIID = _dbContext.KPILevels.Find(item.KPILevelID);
                            //var kpiID = 0;
                            if (FindKPIID != null)
                            {
                                var kpiID = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPIID;
                                var kpiname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Name;
                                var stt = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Status;
                                var check = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).Checked;
                                var unitname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Unit;
                                var kpilevelcode = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPILevelCode;
                                listKPILevelID.Add(new ManagerOwnerUpdaterSponsorParticipantViewModel
                                {
                                    CategoryID = item.CategoryID,
                                    KPILevelID = item.KPILevelID,
                                    KPIName = kpiname,
                                    Checked = check,
                                    Status = stt,
                                    Unit = _dbContext.Units.FirstOrDefault(x => x.ID == unitname).Name.ToSafetyString(),
                                    KPILevelCode = kpilevelcode
                                });
                            }
                        }
                        else
                        {
                            listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipant(categoryid);
                        }
                    }
                    else if (SpcLevel == 3)
                    {
                        if (categoryid == 0)
                        {
                            var listKPILevelID2 = await GetAllManagerOwnerUpdaterSponsorParticipant(item.CategoryID);
                            var FindKPIID = _dbContext.KPILevels.Find(item.KPILevelID);
                            var myList = ListOCs as IEnumerable;
                            foreach (int items in myList)
                            {
                                int LevelID = 0;
                                if (FindKPIID != null)
                                {
                                    LevelID = _dbContext.KPILevels.Find(item.KPILevelID).LevelID;
                                }
                                if (items == LevelID)
                                {
                                    if (FindKPIID != null)
                                    {
                                        var kpiID = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPIID;
                                        var kpiname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Name;
                                        var stt = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Status;
                                        var check = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).Checked;
                                        var unitname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpiID).Unit;
                                        var kpilevelcode = _dbContext.KPILevels.FirstOrDefault(x => x.ID == item.KPILevelID).KPILevelCode;
                                        listKPILevelID.Add(new ManagerOwnerUpdaterSponsorParticipantViewModel
                                        {
                                            CategoryID = item.CategoryID,
                                            KPILevelID = item.KPILevelID,
                                            KPIName = kpiname,
                                            Checked = check,
                                            Status = stt,
                                            Unit = _dbContext.Units.FirstOrDefault(x => x.ID == unitname).Name.ToSafetyString(),
                                            KPILevelCode = kpilevelcode
                                        });
                                    }
                                }
                            }

                        }
                        else
                        {
                            listKPILevelID = await GetAllManagerOwnerUpdaterSponsorParticipant(categoryid);
                        }
                    }
                    else
                    {
                        return listDatasetViewModel;
                    }

                }


                if (year == 0)
                    year = currentYear;

                if (period.ToLower() == "w")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "W" && x.Yearly == year && x.Value != "0")
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Week
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        //var kpi = tblKPI.Find(item.KPIID).Name;
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(item.CategoryID, item.KPILevelID);
                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }
                        var tbldata = await _dbContext.Datas
                       .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year)
                        .OrderBy(x => x.Week)
                        .Select(x => new
                        {
                            ID = x.ID,
                            Value = x.Value,
                            Remark = x.Remark,
                            x.Target,
                            Week = x.Week
                        })
                        .ToListAsync();
                        dataremarks = tbldata
                                     .Where(a => a.Value.ToDouble() >= 0)
                     .Select(a => new Dataremark
                     {
                         ID = a.ID,
                         Value = a.Value,
                         Remark = a.Remark,
                         Week = a.Week,
                         ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                     }).ToList();

                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year).Select(x => x.Target).ToList();
                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listDatasetViewModel.Add(new DatasetViewModel
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                CategoryName = tblCategory.Name,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                Checked = item.Checked,
                                KPILevelCode = item.KPILevelCode,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "W" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Weekly",
                                Unit = item.Unit,
                                Status = item.Status
                            });
                        }

                    }
                }
                else if (period.ToLower() == "m")
                {

                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "M" && x.Yearly == year && x.Value != "0")
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Month
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(item.CategoryID, item.KPILevelID);

                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }
                        var tbldata = await _dbContext.Datas
                            .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "M" && x.Yearly == year)
                              .OrderBy(x => x.Month)
                              .Select(x => new
                              {
                                  ID = x.ID,
                                  Value = x.Value,
                                  Remark = x.Remark,
                                  x.Target,
                                  Month = x.Month,

                              }).ToListAsync();
                        dataremarks = tbldata
                          .Where(a => a.Value.ToDouble() >= 0)
                         .Select(a => new Dataremark
                         {
                             ID = a.ID,
                             Value = a.Value,
                             Remark = a.Remark,
                             Week = a.Month,
                             ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                         }).ToList();

                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "M" && x.Yearly == year).Select(x => x.Target).ToList();

                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listDatasetViewModel.Add(new DatasetViewModel
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                CategoryName = tblCategory.Name,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                KPILevelCode = item.KPILevelCode,
                                Checked = item.Checked,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "M" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "M" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Monthly",
                                Unit = item.Unit,
                                Status = item.Status
                            });
                        }

                    }
                }
                else if (period.ToLower() == "h")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "H" && x.Yearly == year && x.Value != "0")
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Half
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;
                        var obj = await GetAllOwner(item.CategoryID, item.KPILevelID);
                        // nếu category = 0
                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }

                        var tbldata = await _dbContext.Datas
                            .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year)
                          .OrderBy(x => x.Half)
                         .Select(x => new
                         {
                             ID = x.ID,
                             Value = x.Value,
                             Remark = x.Remark,
                             x.Target,
                             x.Yearly,
                             Quarter = x.Half,

                         }).ToListAsync();

                        dataremarks = tbldata.Where(a => a.Value.ToDouble() >= 0)
                       .Select(a => new Dataremark
                       {
                           ID = a.ID,
                           Value = a.Value,
                           Remark = a.Remark,
                           Week = a.Quarter,
                           ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                       }).ToList();
                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year).Select(x => x.Target).ToList();
                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listDatasetViewModel.Add(new DatasetViewModel()
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                CategoryName = tblCategory.Name,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                Checked = item.Checked,
                                KPILevelCode = item.KPILevelCode,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "H" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Half Year",
                                Unit = item.Unit,
                                Status = item.Status
                            });
                        }


                    }
                }
                else if (period.ToLower() == "q")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "Q" && x.Yearly == year && x.Value != "0")
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Quarter
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(item.CategoryID, item.KPILevelID);
                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }
                        var tbldata = await _dbContext.Datas
                            .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year)
                          .OrderBy(x => x.Quarter)
                         .Select(x => new
                         {
                             ID = x.ID,
                             Value = x.Value,
                             Remark = x.Remark,
                             x.Target,
                             Quarter = x.Quarter,

                         }).ToListAsync();
                        dataremarks = tbldata
                        .Where(a => a.Value.ToDouble() >= 0)
                       .Select(a => new Dataremark
                       {
                           ID = a.ID,
                           Value = a.Value,
                           Remark = a.Remark,
                           Week = a.Quarter,
                           ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                       }).ToList();
                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.Where(x => x.Week >= start && x.Week <= end).ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year).Select(x => x.Target).ToList();
                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listDatasetViewModel.Add(new DatasetViewModel()
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                CategoryName = tblCategory.Name,
                                Checked = item.Checked,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                KPILevelCode = item.KPILevelCode,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Q" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Quarterly",
                                Status = item.Status,
                                Unit = item.Unit
                            });
                        }


                    }
                }
                else if (period.ToLower() == "y")
                {
                    var listTitleData = _dbContext.Datas.Where(x => x.Period == "Y" && x.Yearly == year && x.Value != "0")
                        .Select(x => new TitleViewModal
                        {
                            Week = x.Year
                        }).Distinct().ToList();
                    foreach (var item in listKPILevelID)
                    {
                        var tblCategory = await _dbContext.Categories.FindAsync(item.CategoryID);
                        var categorycode = tblCategory.Code;

                        var obj = await GetAllOwner(item.CategoryID, item.KPILevelID);
                        if (categoryid == 0)
                        {
                            var objtamp = await GetAllOwner(item.CategoryID, item.KPILevelID);
                            obj = objtamp;
                        }
                        else
                        {
                            var objtamp = await GetAllOwner(categoryid, item.KPILevelID);
                            obj = objtamp;
                        }
                        var tbldata = await _dbContext.Datas
                          .Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Yearly == year)
                          .OrderBy(x => x.Year)
                          .Select(x => new
                          {
                              ID = x.ID,
                              Value = x.Value,
                              Remark = x.Remark,
                              x.Target,
                              Year = x.Year,

                          }).ToListAsync();
                        dataremarks = tbldata
                          .Where(a => a.Value.ToDouble() >= 0)
                         .Select(a => new Dataremark
                         {
                             ID = a.ID,
                             Value = a.Value,
                             Remark = a.Remark,
                             Week = a.Year,
                             ValueArray = new string[3] { a.Value, (a.Target.ToDouble() >= a.Value.ToDouble() ? false : true).ToString(), a.Target },
                         }).ToList();
                        if (start > 0 && end > 0)
                        {
                            dataremarks = dataremarks.ToList();
                        }
                        var dataTarget = _dbContext.Datas.Where(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Yearly == year).Select(x => x.Target).ToList();
                        if (dataTarget.Count > 0)
                        {
                            listTitle = listTitleData;
                            listDatasetViewModel.Add(new DatasetViewModel
                            {
                                KPIName = item.KPIName,
                                Manager = obj.Manager,
                                Owner = obj.Owner,
                                Updater = obj.Updater,
                                Sponsor = obj.Sponsor,
                                Participant = obj.Participant,
                                Checked = item.Checked,
                                CategoryName = tblCategory.Name,
                                CategoryID = tblCategory.ID,
                                CategoryCode = categorycode,
                                KPILevelCode = item.KPILevelCode,
                                Area = _levelService.GetNode(item.KPILevelCode),
                                Target = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Yearly == year).Target,
                                Yearly = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Period == "Y" && x.Yearly == year).Yearly,
                                Datasets = dataremarks,
                                Period = "Yearly",
                                Unit = item.Unit,
                                Status = item.Status
                            });
                        }

                    }
                }
            }

            if (AdminModel.Role == 1)
            {

                return new
                {
                    listTitle,
                    model = listDatasetViewModel.Where(x => x.Checked == true && x.Status == true),
                    categorymodel = categoryModel
                };
            }
            else if (SpcLevel == 3)
            {
                return new
                {
                    listTitle,
                    model = listDatasetViewModel.Where(x => x.Checked == true && x.Status == true),
                    categorymodel = categoryModel
                };
            }
            else
            {
                return new
                {
                    listTitle,
                    model = listDatasetViewModel.Where(x => x.Checked == true && x.Status == true),
                    categorymodel = listCategoryViewModel
                };
            }
        }
        public async Task<DataUserViewModel> GetAllOwner(int categoryID, int kpilevelID)
        {

            var manager = await _dbContext.Managers
                        .Where(x => x.KPILevelID == kpilevelID && x.CategoryID == categoryID)
                        .Join(_dbContext.Users,
                        cat => cat.UserID,
                        user => user.ID,
                        (cat, user) => new
                        {
                            user.FullName
                        }).Select(x => x.FullName).ToArrayAsync();


            var owner = await _dbContext.Owners
                        .Where(x => x.KPILevelID == kpilevelID && x.CategoryID == categoryID)
                        .Join(_dbContext.Users,
                        cat => cat.UserID,
                        user => user.ID,
                        (cat, user) => new
                        {
                            user.FullName
                        }).Select(x => x.FullName).ToArrayAsync();
            var updater = await _dbContext.Uploaders
                         .Where(x => x.KPILevelID == kpilevelID && x.CategoryID == categoryID)
                        .Join(_dbContext.Users,
                        cat => cat.UserID,
                        user => user.ID,
                        (cat, user) => new
                        {
                            user.FullName
                        }).Select(x => x.FullName).ToArrayAsync();
            var sponsor = await _dbContext.Sponsors
                        .Where(x => x.KPILevelID == kpilevelID && x.CategoryID == categoryID)
                       .Join(_dbContext.Users,
                        cat => cat.UserID,
                        user => user.ID,
                        (cat, user) => new
                        {
                            user.FullName
                        }).Select(x => x.FullName).ToArrayAsync();
            var participant = await _dbContext.Participants
                        .Where(x => x.KPILevelID == kpilevelID && x.CategoryID == categoryID)
                       .Join(_dbContext.Users,
                        cat => cat.UserID,
                        user => user.ID,
                        (cat, user) => new
                        {
                            user.FullName
                        }).Select(x => x.FullName).ToArrayAsync();

            return new DataUserViewModel
            {
                Owner = owner.Count() != 0 ? string.Join(",", owner) : "N/A",
                Manager = manager.Count() != 0 ? string.Join(",", manager) : "N/A",
                Updater = updater.Count() != 0 ? string.Join(",", updater) : "N/A",
                Sponsor = sponsor.Count() != 0 ? string.Join(",", sponsor) : "N/A",
                Participant = participant.Count() != 0 ? string.Join(",", participant) : "N/A",
            };
        }
        public object Updaters(int kpilevelid, int categoryid)
        {
            //var user = _dbContext.Users;
            var list = _dbContext.Uploaders
                .Where(x => x.CategoryID == categoryid && x.KPILevelID == kpilevelid)
                .Join(_dbContext.Users,
                cat => cat.UserID,
                user => user.ID,
                (cat, user) => new
                {
                    user.FullName
                }).Select(x => x.FullName).ToArray();
            var count = list.Length;
            if (count == 0)
                return "N/A";
            else if (list == null)
                return "N/A";
            else
                return string.Join(",", list);

        }
        public object Owners(int kpilevelid, int categoryid)
        {
            //var user = _dbContext.Users;
            var list = _dbContext.Owners
                .Where(x => x.CategoryID == categoryid && x.KPILevelID == kpilevelid)
                .Join(_dbContext.Users,
                cat => cat.UserID,
                user => user.ID,
                (cat, user) => new
                {
                    user.FullName
                }).Select(x => x.FullName).ToArray();
            var count = list.Length;
            if (count == 0)
                return "N/A";
            else if (list == null)
                return "N/A";
            else
                return string.Join(",", list);
        }
        public object Managers(int kpilevelid, int categoryid)
        {
            //var user = _dbContext.Users;
            var list = _dbContext.Managers
                .Where(x => x.CategoryID == categoryid && x.KPILevelID == kpilevelid)
                .Join(_dbContext.Users,
                cat => cat.UserID,
                user => user.ID,
                (cat, user) => new
                {
                    user.FullName
                }).Select(x => x.FullName).ToArray();
            var count = list.Length;
            if (count == 0)
                return "N/A";
            else if (list == null)
                return "N/A";
            else
                return string.Join(",", list);
        }
        public object Sponsors(int kpilevelid, int categoryid)
        {
            //var user = _dbContext.Users;
            var list = _dbContext.Sponsors
                .Where(x => x.CategoryID == categoryid && x.KPILevelID == kpilevelid)
                .Join(_dbContext.Users,
                cat => cat.UserID,
                user => user.ID,
                (cat, user) => new
                {
                    user.FullName
                }).Select(x => x.FullName).ToArray();
            var count = list.Length;
            if (count == 0)
                return "N/A";
            else if (list == null)
                return "N/A";
            else
                return string.Join(",", list);
        }
        public object Participants(int kpilevelid, int categoryid)
        {
            //var user = _dbContext.Users;
            var list = _dbContext.Participants
                .Where(x => x.CategoryID == categoryid && x.KPILevelID == kpilevelid)
                .Join(_dbContext.Users,
                cat => cat.UserID,
                user => user.ID,
                (cat, user) => new
                {
                    user.FullName
                }).Select(x => x.FullName).ToArray();
            var count = list.Length;
            if (count == 0)
                return "N/A";
            else if (list == null)
                return "N/A";
            else
                return string.Join(",", list);
        }
        public async Task<ChartViewModel> ListDatas(string kpilevelcode, string period, int? year, int? start, int? end, int? catid,int userid)
        {
            var currentYear = DateTime.Now.Year;
            var currentWeek = DateTime.Now.GetIso8601WeekOfYear();
            var currentMonth = DateTime.Now.Month;
            var currentQuarter = DateTime.Now.GetQuarter();

            string url = string.Empty;
            var yearly = year ?? 0;
            var categoryid = catid ?? 0;

            if (!string.IsNullOrEmpty(kpilevelcode) && !string.IsNullOrEmpty(period))
            {
                //label chartjs
                var item = await _dbContext.KPILevels.FirstOrDefaultAsync(x => x.KPILevelCode == kpilevelcode);
                if(item== null)
                    return new ChartViewModel();
                var PIC = Updaters(item.ID, categoryid);
                var Owner = Owners(item.ID, categoryid);
                var OwnerManagerment = Managers(item.ID, categoryid);
                var Sponsor = Sponsors(item.ID, categoryid);
                var Participant = Participants(item.ID, categoryid);

                var kpi = await _dbContext.KPIs.FirstOrDefaultAsync(x => x.ID == item.KPIID);
                var kpiname = string.Empty;
                if (kpi != null)
                    kpiname = kpi.Name;
                var label = _dbContext.Levels.FirstOrDefault(x => x.ID == item.LevelID).Name.ToSafetyString();
                //datasets chartjs
                var model = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Yearly == yearly);

                var unit = await _dbContext.KPIs.FirstOrDefaultAsync(x => x.ID == item.KPIID);
                if (unit == null) return new ChartViewModel();
                var unitName = _dbContext.Units.FirstOrDefault(x => x.ID == unit.Unit).Name.ToSafetyString();

                if (period == "W".ToUpper())
                {
                    var standard = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.WeeklyChecked == true).WeeklyStandard;
                    var statusFavourites = _dbContext.Favourites.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.UserID == userid) == null ? false : true;

                    //Tạo ra 1 mảng tuần mặc định bằng 0
                    List<string> listDatasets = new List<string>();

                    //labels của chartjs mặc định có 53 phần tử
                    List<string> listLabels = new List<string>();

                    //labels của chartjs mặc định có 53 phần tử
                    List<string> listTargets = new List<string>();

                    //labels của chartjs mặc định có 53 phần tử
                    List<int> listStandards = new List<int>();

                    var Dataremarks = new List<Dataremark>();
                    //Search range
                    if (start > 0 && end > 0)
                    {
                        model = model.Where(x => x.Yearly == year && x.Week >= start && x.Week <= end);

                        var listValues = await model.Where(x => x.Period == "W").OrderBy(x => x.Week).Select(x => x.Value).ToArrayAsync();
                        var listLabelsW = await model.Where(x => x.Period == "W").OrderBy(x => x.Week).Select(x => x.Week).ToArrayAsync();
                        var listtargetsW = await model.Where(x => x.Period == "W").OrderBy(x => x.Week).Select(x => x.Target).ToArrayAsync();
                        for (int i = 0; i < listValues.Length; i++)
                        {
                            listStandards.Add(standard);
                        }
                        //Convert sang list string
                        var listStringLabels = Array.ConvertAll(listLabelsW, x => x.ToSafetyString());

                        //Convert sang list string
                        var listStringTargets = Array.ConvertAll(listtargetsW, x => x.ToSafetyString());

                        listDatasets.AddRange(listValues);
                        listLabels.AddRange(listStringLabels);
                        listTargets.AddRange(listStringTargets);

                        Dataremarks = model
                           .Where(x => x.Period == "W")
                           .OrderBy(x => x.Week)
                           .Select(x => new Dataremark
                           {
                               ID = x.ID,
                               Value = x.Value,
                               Remark = x.Remark,
                               Week = x.Week,
                               Target = x.Target
                           }).ToList();

                    }
                    return new ChartViewModel
                    {
                        Unit = unitName,
                        Standard = standard,
                        Dataremarks = Dataremarks,
                        datasets = listDatasets.ToArray(),
                        labels = listLabels.ToArray(),
                        label = label,
                        targets = listTargets.ToArray(),
                        standards = listStandards.ToArray(),
                        kpiname = kpiname,
                        period = "W",
                        kpilevelcode = kpilevelcode,
                        statusfavorite = statusFavourites,
                        PIC = PIC,
                        Owner = Owner,
                        OwnerManagerment = OwnerManagerment,
                        Sponsor = Sponsor,
                        Participant = Participant
                    };

                }
                else if (period == "M".ToUpper())
                {
                    var standard = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.MonthlyChecked == true).MonthlyStandard;
                    var statusFavourites = _dbContext.Favourites.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.UserID == userid) == null ? false : true;

                    //Tạo ra 1 mảng tuần mặc định bằng 0
                    List<string> listDatasets = new List<string>();

                    //labels của chartjs mặc định có 12 phần tử = 0
                    List<string> listLabels = new List<string>();

                    //labels của chartjs mặc định có 12 phần tử
                    List<string> listTargets = new List<string>();
                    //Tạo ra 1 mảng tuần mặc định bằng 0
                    List<int> listStandards = new List<int>();
                    var Dataremarks = new List<Dataremark>();


                    //Search range
                    if (start > 0 && end > 0)
                    {
                        model = model.Where(x => x.Yearly == year && x.Month >= start && x.Month <= end);

                        var listValues = await model.Where(x => x.Period == "M").OrderBy(x => x.Month).Select(x => x.Value).ToArrayAsync();
                        var listLabelsW = await model.Where(x => x.Period == "M").OrderBy(x => x.Month).Select(x => x.Month).ToArrayAsync();
                        var listtargetsW = await model.Where(x => x.Period == "M").OrderBy(x => x.Month).Select(x => x.Target).ToArrayAsync();
                        //Convert sang list string
                        var listStringTargets = Array.ConvertAll(listtargetsW, x => x.ToSafetyString());
                        listTargets.AddRange(listStringTargets);

                        for (int i = 0; i < listValues.Length; i++)
                        {
                            listStandards.Add(standard);
                        }

                        foreach (var a in listLabelsW)
                        {
                            switch (a)
                            {
                                case 1:
                                    listLabels.Add("Jan");
                                    break;
                                case 2:
                                    listLabels.Add("Feb"); break;
                                case 3:
                                    listLabels.Add("Mar"); break;
                                case 4:
                                    listLabels.Add("Apr"); break;
                                case 5:
                                    listLabels.Add("May");
                                    break;
                                case 6:
                                    listLabels.Add("Jun"); break;
                                case 7:
                                    listLabels.Add("Jul"); break;
                                case 8:
                                    listLabels.Add("Aug"); break;
                                case 9:
                                    listLabels.Add("Sep");
                                    break;
                                case 10:
                                    listLabels.Add("Oct"); break;
                                case 11:
                                    listLabels.Add("Nov"); break;
                                case 12:
                                    listLabels.Add("Dec"); break;
                            }
                        }

                        listDatasets.AddRange(listValues);

                        Dataremarks = model
                           .Where(x => x.Period == "M")
                           .OrderBy(x => x.Month)
                           .Select(x => new Dataremark
                           {
                               ID = x.ID,
                               Value = x.Value,
                               Remark = x.Remark,
                               Month = x.Month,
                               Target = x.Target
                           }).ToList();
                    }

                    return new ChartViewModel
                    {
                        Unit = unitName,
                        Standard = standard,
                        Dataremarks = Dataremarks,
                        datasets = listDatasets.ToArray(),
                        labels = listLabels.ToArray(),
                        targets = listTargets.ToArray(),
                        standards = listStandards.ToArray(),
                        label = label,
                        kpiname = kpiname,
                        period = "M",
                        kpilevelcode = kpilevelcode,
                        statusfavorite = statusFavourites,
                        PIC = PIC,
                        Owner = Owner,
                        OwnerManagerment = OwnerManagerment,
                        Sponsor = Sponsor,
                        Participant = Participant
                    };
                }
                else if (period == "Q".ToUpper())
                {
                    var standard = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.QuarterlyChecked == true).QuarterlyStandard;
                    var statusFavourites = _dbContext.Favourites.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.UserID == userid) == null ? false : true;

                    //Tạo ra 1 mảng tuần mặc định bằng 0
                    List<string> listDatasets = new List<string>();

                    //labels của chartjs mặc định có 53 phần tử = 0
                    List<string> listLabels = new List<string>();

                    //labels của chartjs mặc định có 12 phần tử
                    List<string> listTargets = new List<string>();
                    //labels của chartjs mặc định có 12 phần tử
                    List<int> listStandards = new List<int>();
                    var Dataremarks = new List<Dataremark>();


                    if (year > 0 && start > 0 && end > 0)
                    {
                        model = model.Where(x => x.Yearly == year && x.Quarter >= start && x.Quarter <= end);
                        var listValues = await model.Where(x => x.Period == "Q").OrderBy(x => x.Quarter).Select(x => x.Value).ToArrayAsync();
                        var listLabelsW = await model.Where(x => x.Period == "Q").OrderBy(x => x.Quarter).Select(x => x.Quarter).ToArrayAsync();
                        listDatasets.AddRange(listValues);
                        var listtargetsW = await model.Where(x => x.Period == "Q").OrderBy(x => x.Quarter).Select(x => x.Target).ToArrayAsync();

                        //Convert sang list string
                        var listStringTargets = Array.ConvertAll(listtargetsW, x => x.ToSafetyString());
                        listTargets.AddRange(listStringTargets);
                        for (int i = 0; i < listValues.Length; i++)
                        {
                            listStandards.Add(standard);
                        }
                        foreach (var i in listLabelsW)
                        {
                            switch (i)
                            {
                                case 1:
                                    listLabels.Add("Quarter 1"); break;
                                case 2:
                                    listLabels.Add("Quarter 2"); break;
                                case 3:
                                    listLabels.Add("Quarter 3"); break;
                                case 4:
                                    listLabels.Add("Quarter 4"); break;
                            }
                        }
                        Dataremarks = model
                         .Where(x => x.Period == "Q")
                         .OrderBy(x => x.Quarter)
                         .Select(x => new Dataremark
                         {
                             ID = x.ID,
                             Value = x.Value,
                             Remark = x.Remark,
                             Quater = x.Quarter,
                             Target = x.Target
                         }).ToList();
                    }

                    return new ChartViewModel
                    {
                        Unit = unitName,
                        Standard = standard,
                        Dataremarks = Dataremarks,
                        datasets = listDatasets.ToArray(),
                        labels = listLabels.ToArray(),
                        targets = listTargets.ToArray(),
                        standards = listStandards.ToArray(),
                        label = label,
                        kpiname = kpiname,
                        period = "Q",
                        kpilevelcode = kpilevelcode,
                        statusfavorite = statusFavourites,
                        PIC = PIC,
                        Owner = Owner,
                        OwnerManagerment = OwnerManagerment,
                        Sponsor = Sponsor,
                        Participant = Participant
                    };
                }
                else if (period == "Y".ToUpper())
                {
                    if (start > 0 && end > 0)
                    {
                        model = model.Where(x => x.Year >= start && x.Year <= end);
                    }
                    var datasets = await model.Where(x => x.Yearly == year && x.Period == "Y").OrderBy(x => x.Year).Select(x => x.Value).ToArrayAsync();
                    var Dataremarks = model
                      .Where(x => x.Period == "Y")
                      .OrderBy(x => x.Year)
                      .Select(x => new Dataremark
                      {
                          ID = x.ID,
                          Value = x.Value,
                          Remark = x.Remark,
                          Year = x.Year,
                          Target = x.Target
                      }).ToList();
                    //data: labels chartjs
                    var listlabels = await model.Where(x => x.Period == "Y").OrderBy(x => x.Year).Select(x => x.Year).ToArrayAsync();
                    var labels = Array.ConvertAll(listlabels, x => x.ToSafetyString());
                    var listtargetsW = await model.Where(x => x.Period == "Y").OrderBy(x => x.Year).Select(x => x.Target).ToArrayAsync();
                    //labels của chartjs mặc định có 12 phần tử
                    List<string> listTargets = new List<string>();
                    //Convert sang list string
                    var listStringTargets = Array.ConvertAll(listtargetsW, x => x.ToSafetyString());
                    listTargets.AddRange(listStringTargets);
                    return new ChartViewModel
                    {
                        Unit = unitName,
                        Standard = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.YearlyChecked == true).YearlyStandard,
                        Dataremarks = Dataremarks,
                        datasets = datasets,
                        labels = labels,
                        label = label,
                        targets = listTargets.ToArray(),
                        kpiname = kpiname,
                        period = "Y",
                        kpilevelcode = kpilevelcode,
                        statusfavorite = _dbContext.Favourites.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.UserID == userid) == null ? false : true,
                        PIC = PIC,
                        Owner = Owner,
                        OwnerManagerment = OwnerManagerment,
                        Sponsor = Sponsor,
                        Participant = Participant
                    };
                }
                else
                {
                    return new ChartViewModel();
                }
            }
            else
            {
                return new ChartViewModel();
            }
        }

        public async Task<ChartViewModel> ListDatas2(string kpilevelcode, string period, string lang, int? year, int? start, int? end, int? catid, int userid)
        {
            var currentYear = DateTime.Now.Year;
            var currentWeek = DateTime.Now.GetIso8601WeekOfYear();
            var currentMonth = DateTime.Now.Month;
            var currentQuarter = DateTime.Now.GetQuarter();
            var currentHalfYear = DateTime.Now.GetQuarter();

            string url = string.Empty;
            var yearly = year ?? 0;
            var categoryid = catid ?? 0;

            if (!string.IsNullOrEmpty(kpilevelcode) && !string.IsNullOrEmpty(period))
            {
                //label chartjs
                var item = await _dbContext.KPILevels.FirstOrDefaultAsync(x => x.KPILevelCode == kpilevelcode);

                var PIC = Updaters(item.ID, categoryid);
                var Owner = Owners(item.ID, categoryid);
                var OwnerManagerment = Managers(item.ID, categoryid);
                var Sponsor = Sponsors(item.ID, categoryid);
                var Participant = Participants(item.ID, categoryid);

                var kpi = await _dbContext.KPIs.Include(x => x.KPILangs).FirstOrDefaultAsync(x => x.ID == item.KPIID);
                var kpiname = string.Empty;
                if (kpi != null)
                    kpiname = kpi.KPILangs.FirstOrDefault(x => x.LanguageID == lang)?.Name ?? kpi.Name;

                var label = _dbContext.Levels.FirstOrDefault(x => x.ID == item.LevelID).Name.ToSafetyString();
                //datasets chartjs
                var model = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Yearly == yearly);

                var unit = await _dbContext.KPIs.FirstOrDefaultAsync(x => x.ID == item.KPIID);
                if (unit == null) return new ChartViewModel();
                var unitName = _dbContext.Units.FirstOrDefault(x => x.ID == unit.Unit).Name.ToSafetyString();

                if (period == "W".ToUpper())
                {
                    var standard = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.WeeklyChecked == true).WeeklyStandard;
                    var statusFavourites = _dbContext.Favourites.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.UserID == userid) == null ? false : true;

                    //Tạo ra 1 mảng tuần mặc định bằng 0
                    List<string> listDatasets = new List<string>();

                    List<string> listScore = new List<string>();

                    //labels của chartjs mặc định có 53 phần tử
                    List<string> listLabels = new List<string>();

                    //labels của chartjs mặc định có 53 phần tử
                    List<string> listTargets = new List<string>();

                    //labels của chartjs mặc định có 53 phần tử
                    List<int> listStandards = new List<int>();

                    var Dataremarks = new List<Dataremark>();
                    //Search range
                    if (start > 0 && end > 0)
                    {
                        model = model.Where(x => x.Yearly == year && x.Week >= start && x.Week <= end);

                        var listValues = await model.Where(x => x.Period == "W").OrderBy(x => x.Week).Select(x => Math.Round(Convert.ToDecimal(x.Value), 3)).ToArrayAsync();
                        var scoreListcompare = _dbContext.ScorePerfomances.Where(x => x.KPILevel_Code == kpilevelcode && x.Max != "0").ToList();
                        foreach (var score in listValues)
                        {
                            if (score.ToDouble() == 0)
                            {
                                listScore.Add("0");
                            }
                            else
                            {

                                foreach (var scores in scoreListcompare)
                                {
                                    if (score.ToDouble() <= scores.Max.ToDouble() && score.ToDouble() >= scores.Min.ToDouble())
                                    {
                                        listScore.Add(scores.Score);
                                    }

                                }
                            }
                        }
                        //var listScores = await model.Where(x => x.Period == "W").OrderBy(x => x.Week).Select(x => x.Score ?? "0").ToArrayAsync();
                        var listLabelsW = await model.Where(x => x.Period == "W").OrderBy(x => x.Week).Select(x => x.Week).ToArrayAsync();
                        var listtargetsW = await model.Where(x => x.Period == "W").OrderBy(x => x.Week).Select(x => x.Target).ToArrayAsync();
                        for (int i = 0; i < listValues.Length; i++)
                        {
                            listStandards.Add(standard);
                        }
                        //Convert sang list string
                        var listStringLabels = Array.ConvertAll(listLabelsW, x => x.ToSafetyString());

                        //Convert sang list string
                        var listStringTargets = Array.ConvertAll(listtargetsW, x => x.ToSafetyString());

                        listDatasets.AddRange(listValues.Select(x => x.ToString()).ToList());
                        listLabels.AddRange(listStringLabels);
                        listTargets.AddRange(listStringTargets);
                        //listScore.AddRange(listScores);
                        Dataremarks = model
                           .Where(x => x.Period == "W")
                           .OrderBy(x => x.Week)
                           .Select(x => new Dataremark
                           {
                               ID = x.ID,
                               Value = Math.Round(Convert.ToDecimal(x.Value), 2).ToString(),
                               Remark = x.Remark,
                               Week = x.Week,
                               Status = kpi.Status,
                               Target = x.Target
                           }).ToList();

                    }
                    return new ChartViewModel
                    {
                        Unit = unitName,
                        Standard = standard,
                        Dataremarks = Dataremarks,
                        datasets = listDatasets.ToArray(),
                        score = listScore.ToArray(),
                        labels = listLabels.ToArray(),
                        label = label,
                        targets = listTargets.ToArray(),
                        standards = listStandards.ToArray(),
                        kpiname = kpiname,
                        period = "W",
                        kpilevelcode = kpilevelcode,
                        kpilevelID = item.ID,
                        statusfavorite = statusFavourites,
                        PIC = PIC,
                        Owner = Owner,
                        OwnerManagerment = OwnerManagerment,
                        Sponsor = Sponsor,
                        Participant = Participant,
                        Status = kpi.Status
                    };

                }
                else if (period == "M".ToUpper())
                {
                    var standard = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.MonthlyChecked == true).MonthlyStandard;
                    var statusFavourites = _dbContext.Favourites.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.UserID == userid) == null ? false : true;

                    //Tạo ra 1 mảng tuần mặc định bằng 0
                    List<string> listDatasets = new List<string>();

                    List<string> listScore = new List<string>();

                    //labels của chartjs mặc định có 12 phần tử = 0
                    List<string> listLabels = new List<string>();

                    //labels của chartjs mặc định có 12 phần tử
                    List<string> listTargets = new List<string>();

                    //Tạo ra 1 mảng tuần mặc định bằng 0
                    List<int> listStandards = new List<int>();

                    var Dataremarks = new List<Dataremark>();

                    //Search range
                    if (start > 0 && end > 0)
                    {
                        model = model.Where(x => x.Yearly == year && x.Month >= start && x.Month <= end);

                        var listValues = await model.Where(x => x.Period == "M").OrderBy(x => x.Month).Select(x => x.Value).ToArrayAsync();

                        var scoreListcompare = _dbContext.ScorePerfomances.Where(x => x.KPILevel_Code == kpilevelcode  && x.Max != "0").ToList();
                        foreach (var score in listValues)
                        {
                            if (score.ToDouble() == 0)
                            {
                                listScore.Add("0");
                            }
                            else
                            {
                                foreach (var scores in scoreListcompare)
                                {
                                    if (score.ToDouble() <= scores.Max.ToDouble() && score.ToDouble() >= scores.Min.ToDouble())
                                    {
                                        listScore.Add(scores.Score);
                                    }
                                }
                            }
                        }
                        //var listScores = await model.Where(x => x.Period == "M").OrderBy(x => x.Month).Select(x => x.Score ?? "0").ToArrayAsync();
                        var listLabelsW = await model.Where(x => x.Period == "M").OrderBy(x => x.Month).Select(x => x.Month).ToArrayAsync();

                        var listtargetsW = await model.Where(x => x.Period == "M").OrderBy(x => x.Month).Select(x => x.Target).ToArrayAsync();
                        //Convert sang list string

                        var listStringTargets = Array.ConvertAll(listtargetsW, x => x.ToSafetyString());
                        listTargets.AddRange(listStringTargets);
                        //listScore.AddRange(listScores);
                        for (int i = 0; i < listValues.Length; i++)
                        {
                            listStandards.Add(standard);
                        }

                        foreach (var a in listLabelsW)
                        {
                            switch (a)
                            {
                                case 1:
                                    listLabels.Add("Jan");
                                    break;
                                case 2:
                                    listLabels.Add("Feb"); break;
                                case 3:
                                    listLabels.Add("Mar"); break;
                                case 4:
                                    listLabels.Add("Apr"); break;
                                case 5:
                                    listLabels.Add("May");
                                    break;
                                case 6:
                                    listLabels.Add("Jun"); break;
                                case 7:
                                    listLabels.Add("Jul"); break;
                                case 8:
                                    listLabels.Add("Aug"); break;
                                case 9:
                                    listLabels.Add("Sep");
                                    break;
                                case 10:
                                    listLabels.Add("Oct"); break;
                                case 11:
                                    listLabels.Add("Nov"); break;
                                case 12:
                                    listLabels.Add("Dec"); break;
                            }
                        }

                        listDatasets.AddRange(listValues);
                        
                        Dataremarks = model
                           .Where(x => x.Period == "M")
                           .OrderBy(x => x.Month)
                           .Select(x => new Dataremark
                           {
                               ID = x.ID,
                               Value = x.Value,
                               Remark = x.Remark,
                               Month = x.Month,
                               Status = kpi.Status,
                               Target = x.Target
                           }).ToList();
                    }

                    return new ChartViewModel
                    {
                        Unit = unitName,
                        Standard = standard,
                        Dataremarks = Dataremarks,
                        datasets = listDatasets.ToArray(),
                        score = listScore.ToArray(),
                        labels = listLabels.ToArray(),
                        targets = listTargets.ToArray(),
                        standards = listStandards.ToArray(),
                        label = label,
                        kpiname = kpiname,
                        period = "M",
                        kpilevelcode = kpilevelcode,
                        kpilevelID = item.ID,
                        statusfavorite = statusFavourites,
                        PIC = PIC,
                        Owner = Owner,
                        OwnerManagerment = OwnerManagerment,
                        Sponsor = Sponsor,
                        Participant = Participant,
                        Status = kpi.Status
                    };
                }
                else if (period == "Q".ToUpper())
                {
                    var standard = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.QuarterlyChecked == true).QuarterlyStandard;
                    var statusFavourites = _dbContext.Favourites.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.UserID == userid) == null ? false : true;

                    //Tạo ra 1 mảng tuần mặc định bằng 0
                    List<string> listDatasets = new List<string>();

                    List<string> listScore = new List<string>();

                    //labels của chartjs mặc định có 53 phần tử = 0
                    List<string> listLabels = new List<string>();

                    //labels của chartjs mặc định có 12 phần tử
                    List<string> listTargets = new List<string>();

                    //labels của chartjs mặc định có 12 phần tử
                    List<int> listStandards = new List<int>();

                    var Dataremarks = new List<Dataremark>();


                    if (year > 0 && start > 0 && end > 0)
                    {
                        model = model.Where(x => x.Yearly == year && x.Quarter >= start && x.Quarter <= end);
                        var listValues = await model.Where(x => x.Period == "Q").OrderBy(x => x.Quarter).Select(x => x.Value).ToArrayAsync();
                        var scoreListcompare = _dbContext.ScorePerfomances.Where(x => x.KPILevel_Code == kpilevelcode && x.Max != "0").ToList();
                        foreach (var score in listValues)
                        {
                            if (score.ToDouble() == 0)
                            {
                                listScore.Add("0");
                            }
                            else
                            {
                                foreach (var scores in scoreListcompare)
                                {
                                    if (score.ToDouble() <= scores.Max.ToDouble() && score.ToDouble() >= scores.Min.ToDouble())
                                    {
                                        listScore.Add(scores.Score);
                                    }
                                }
                            }
                        }
                        //var listScores = await model.Where(x => x.Period == "Q").OrderBy(x => x.Quarter).Select(x => x.Score ?? "0").ToArrayAsync();
                        var listLabelsW = await model.Where(x => x.Period == "Q").OrderBy(x => x.Quarter).Select(x => x.Quarter).ToArrayAsync();
                        listDatasets.AddRange(listValues);
                        var listtargetsW = await model.Where(x => x.Period == "Q").OrderBy(x => x.Quarter).Select(x => x.Target).ToArrayAsync();

                        //Convert sang list string
                        var listStringTargets = Array.ConvertAll(listtargetsW, x => x.ToSafetyString());
                        listTargets.AddRange(listStringTargets);
                        for (int i = 0; i < listValues.Length; i++)
                        {
                            listStandards.Add(standard);
                        }
                        foreach (var i in listLabelsW)
                        {
                            switch (i)
                            {
                                case 1:
                                    listLabels.Add("Quarter 1"); break;
                                case 2:
                                    listLabels.Add("Quarter 2"); break;
                                case 3:
                                    listLabels.Add("Quarter 3"); break;
                                case 4:
                                    listLabels.Add("Quarter 4"); break;
                            }
                        }
                        //listScore.AddRange(listScores);
                        Dataremarks = model
                         .Where(x => x.Period == "Q")
                         .OrderBy(x => x.Quarter)
                         .Select(x => new Dataremark
                         {
                             ID = x.ID,
                             Value = x.Value,
                             Remark = x.Remark,
                             Quater = x.Quarter,
                             Status = kpi.Status,
                             Target = x.Target
                         }).ToList();
                    }

                    return new ChartViewModel
                    {
                        Unit = unitName,
                        Standard = standard,
                        Dataremarks = Dataremarks,
                        datasets = listDatasets.ToArray(),
                        score = listScore.ToArray(),
                        labels = listLabels.ToArray(),
                        targets = listTargets.ToArray(),
                        standards = listStandards.ToArray(),
                        label = label,
                        kpiname = kpiname,
                        period = "Q",
                        kpilevelcode = kpilevelcode,
                        kpilevelID = item.ID,
                        statusfavorite = statusFavourites,
                        PIC = PIC,
                        Owner = Owner,
                        OwnerManagerment = OwnerManagerment,
                        Sponsor = Sponsor,
                        Participant = Participant,
                        Status = kpi.Status
                    };
                }
                else if (period == "H".ToUpper())
                {
                    var standard = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.HalfYearChecked == true).HalfYearStandard;
                    var statusFavourites = _dbContext.Favourites.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.UserID == userid) == null ? false : true;

                    //Tạo ra 1 mảng tuần mặc định bằng 0
                    List<string> listDatasets = new List<string>();
                    List<string> listScore = new List<string>();
                    //labels của chartjs mặc định có 53 phần tử = 0
                    List<string> listLabels = new List<string>();

                    //labels của chartjs mặc định có 12 phần tử
                    List<string> listTargets = new List<string>();
                    //labels của chartjs mặc định có 12 phần tử
                    List<int> listStandards = new List<int>();
                    var Dataremarks = new List<Dataremark>();


                    if (year > 0 && start > 0 && end > 0)
                    {
                        model = model.Where(x => x.Yearly == year && x.Half >= start && x.Half <= end);
                        var listValues = await model.Where(x => x.Period == "H").OrderBy(x => x.Half).Select(x => x.Value ).ToArrayAsync();

                        var scoreListcompare = _dbContext.ScorePerfomances.Where(x => x.KPILevel_Code == kpilevelcode && x.Max != "0").ToList();
                        foreach (var score in listValues)
                        {
                            if (score.ToDouble() == 0)
                            {
                                listScore.Add("0");
                            }
                            else
                            {

                                foreach (var scores in scoreListcompare)
                                {
                                    if (score.ToDouble() <= scores.Max.ToDouble() && score.ToDouble() >= scores.Min.ToDouble())
                                    {
                                        listScore.Add(scores.Score);
                                    }

                                }
                            }
                        }

                        //var listScores = await model.Where(x => x.Period == "H").OrderBy(x => x.Half).Select(x => x.Score ?? "0").ToArrayAsync();
                        var listLabelsW = await model.Where(x => x.Period == "H").OrderBy(x => x.Half).Select(x => x.Half).ToArrayAsync();
                        listDatasets.AddRange(listValues);
                        var listtargetsW = await model.Where(x => x.Period == "H").OrderBy(x => x.Half).Select(x => x.Target).ToArrayAsync();

                        //Convert sang list string
                        var listStringTargets = Array.ConvertAll(listtargetsW, x => x.ToSafetyString());
                        listTargets.AddRange(listStringTargets);
                        //listScore.AddRange(listScores);
                        for (int i = 0; i < listValues.Length; i++)
                        {
                            listStandards.Add(standard);
                        }
                        foreach (var i in listLabelsW)
                        {
                            switch (i)
                            {
                                case 1:
                                    listLabels.Add("Half Year 1"); break;
                                case 2:
                                    listLabels.Add("Half Year 2"); break;
                            }
                        }
                        Dataremarks = model
                         .Where(x => x.Period == "H")
                         .OrderBy(x => x.Half)
                         .Select(x => new Dataremark
                         {
                             ID = x.ID,
                             Value = x.Value,
                             Remark = x.Remark,
                             Quater = x.Half,
                             Status = kpi.Status,
                             Target = x.Target
                         }).ToList();
                    }

                    return new ChartViewModel
                    {
                        Unit = unitName,
                        Standard = standard,
                        Dataremarks = Dataremarks,
                        datasets = listDatasets.ToArray(),
                        score = listScore.ToArray(),
                        labels = listLabels.ToArray(),
                        targets = listTargets.ToArray(),
                        standards = listStandards.ToArray(),
                        label = label,
                        kpiname = kpiname,
                        period = "H",
                        kpilevelcode = kpilevelcode,
                        kpilevelID = item.ID,
                        statusfavorite = statusFavourites,
                        PIC = PIC,
                        Owner = Owner,
                        OwnerManagerment = OwnerManagerment,
                        Sponsor = Sponsor,
                        Participant = Participant,
                        Status = kpi.Status
                    };
                }
                else if (period == "Y".ToUpper())
                {
                    if (start > 0 && end > 0)
                    {
                        model = model.Where(x => x.Year >= start && x.Year <= end);
                    }
                    List<string> listScore = new List<string>();
                    var datasets = await model.Where(x => x.Yearly == year && x.Period == "Y").OrderBy(x => x.Year).Select(x => x.Value).ToArrayAsync();
                    var scoreListcompare = _dbContext.ScorePerfomances.Where(x => x.KPILevel_Code == kpilevelcode).ToList();
                    foreach (var score in datasets)
                    {
                        foreach (var scores in scoreListcompare)
                        {
                            if (score.ToDouble() <= scores.Max.ToDouble() && score.ToDouble() >= scores.Min.ToDouble())
                            {
                                listScore.Add(scores.Score);
                            }
                        }
                    }
                    //var scores = await model.Where(x => x.Yearly == year && x.Period == "Y").OrderBy(x => x.Year).Select(x => x.Score ?? "0").ToArrayAsync();
                    var Dataremarks = model
                      .Where(x => x.Period == "Y")
                      .OrderBy(x => x.Year)
                      .Select(x => new Dataremark
                      {
                          ID = x.ID,
                          Value = x.Value,
                          Remark = x.Remark,
                          Year = x.Year,
                          Status = kpi.Status,
                          Target = x.Target
                      }).ToList();
                    //data: labels chartjs
                    var listlabels = await model.Where(x => x.Period == "Y").OrderBy(x => x.Year).Select(x => x.Year).ToArrayAsync();
                    var labels = Array.ConvertAll(listlabels, x => x.ToSafetyString());
                    var listtargetsW = await model.Where(x => x.Period == "Y").OrderBy(x => x.Year).Select(x => x.Target).ToArrayAsync();
                    //labels của chartjs mặc định có 12 phần tử
                    List<string> listTargets = new List<string>();
                    //Convert sang list string
                    var listStringTargets = Array.ConvertAll(listtargetsW, x => x.ToSafetyString());
                    listTargets.AddRange(listStringTargets);
                    return new ChartViewModel
                    {
                        Unit = unitName,
                        Standard = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.YearlyChecked == true).YearlyStandard,
                        Dataremarks = Dataremarks,
                        datasets = datasets,
                        score = listScore.ToArray(),
                        labels = labels,
                        label = label,
                        targets = listTargets.ToArray(),
                        kpiname = kpiname,
                        period = "Y",
                        kpilevelcode = kpilevelcode,
                        kpilevelID = item.ID,
                        statusfavorite = _dbContext.Favourites.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.UserID == userid) == null ? false : true,
                        PIC = PIC,
                        Owner = Owner,
                        OwnerManagerment = OwnerManagerment,
                        Sponsor = Sponsor,
                        Participant = Participant,
                        Status = kpi.Status
                    };
                }
                else
                {
                    return new ChartViewModel();
                }
            }
            else
            {
                return new ChartViewModel();
            }
        }
        public ChartViewModel Compare(string kpilevelcode, string period)
        {

            var model2 = new DataCompareViewModel();

            var model = new ChartViewModel();

            var item = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode);
            model.kpiname = _dbContext.KPIs.Find(item.KPIID).Name;
            model.label = _dbContext.Levels.FirstOrDefault(x => x.ID == item.LevelID).Name;
            model.kpilevelcode = kpilevelcode;

            var unit = _dbContext.KPIs.FirstOrDefault(x => x.ID == item.KPIID).Unit;
            var unitName = _dbContext.Units.FirstOrDefault(x => x.ID == unit).Name;

            if (period == "W")
            {
                //Tạo ra 1 mảng tuần mặc định bằng 0
                List<string> listDatasets = new List<string>();

                //labels của chartjs mặc định có 53 phần tử = 0
                List<string> listLabels = new List<string>();

                var datas = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Period == period).OrderBy(x => x.Week).Select(x => new { x.Value, x.Week }).ToList();
                foreach (var valueWeek in datas)
                {
                    listDatasets.Add(valueWeek.Value);
                    listLabels.Add(valueWeek.Week.ToString());
                }

                model.datasets = listDatasets.ToArray();
                model.labels = listLabels.ToArray();
                model.period = period;

            }
            if (period == "M")
            {
                //Tạo ra 1 mảng tuần mặc định bằng 0
                List<string> listDatasets = new List<string>();

                //labels của chartjs mặc định có 53 phần tử = 0
                List<string> listLabels = new List<string>();


                var datas = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Period == period).OrderBy(x => x.Month).Select(x => new { x.Month, x.Value }).ToList();
                foreach (var monthly in datas)
                {
                    listDatasets.Add(monthly.Value);
                    switch (monthly.Month)
                    {
                        case 1:
                            listLabels.Add("Jan"); break;
                        case 2:
                            listLabels.Add("Feb"); break;
                        case 3:
                            listLabels.Add("Mar"); break;
                        case 4:
                            listLabels.Add("Apr"); break;
                        case 5:
                            listLabels.Add("May"); break;
                        case 6:
                            listLabels.Add("Jun"); break;
                        case 7:
                            listLabels.Add("Jul"); break;
                        case 8:
                            listLabels.Add("Aug"); break;
                        case 9:
                            listLabels.Add("Sep");
                            break;
                        case 10:
                            listLabels.Add("Oct"); break;
                        case 11:
                            listLabels.Add("Nov"); break;
                        case 12:
                            listLabels.Add("Dec"); break;
                    }
                }
                model.datasets = listDatasets.ToArray();
                model.labels = listLabels.ToArray();
                model.period = period;
            }
            if (period == "Q")
            {
                //Tạo ra 1 mảng tuần mặc định bằng 0
                List<string> listDatasets = new List<string>();

                //labels của chartjs mặc định có 53 phần tử = 0
                List<string> listLabels = new List<string>();
                var datas = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Period == period).OrderBy(x => x.Quarter).Select(x => new { x.Quarter, x.Value }).ToList();
                foreach (var quarterly in datas)
                {
                    listDatasets.Add(quarterly.Value);
                    switch (quarterly.Quarter)
                    {
                        case 1:
                            listLabels.Add("Quarter 1"); break;
                        case 2:
                            listLabels.Add("Quarter 2"); break;
                        case 3:
                            listLabels.Add("Quarter 3"); break;
                        case 4:
                            listLabels.Add("Quarter 4"); break;
                    }
                }
                model.datasets = listDatasets.ToArray();
                model.labels = listLabels.ToArray();
                model.period = period;
                model.Unit = unitName;
                model.Standard = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.QuarterlyChecked == true).QuarterlyStandard;
            }
            if (period == "Y")
            {
                var datasetsKPILevel1 = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Period == period).OrderBy(x => x.Year).Select(x => x.Value).ToArray();
                var labelsKPILevel1 = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Period == period).OrderBy(x => x.Year).Select(x => x.Year).ToArray();
                var labels1 = Array.ConvertAll(labelsKPILevel1, x => x.ToSafetyString());
                model.datasets = datasetsKPILevel1;
                model.labels = labels1;
                model.period = period;
            }
            return model;
        }

        public ChartViewModel2 Compare2(string kpilevelcode, string period)
        {

            var model2 = new DataCompareViewModel();

            var model = new ChartViewModel2();

            var item = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode);
            model.kpiname = _dbContext.KPIs.Find(item.KPIID).Name;
            model.label = _dbContext.Levels.FirstOrDefault(x => x.ID == item.LevelID).Name;
            model.kpilevelcode = kpilevelcode;

            var unit = _dbContext.KPIs.FirstOrDefault(x => x.ID == item.KPIID).Unit;
            var unitName = _dbContext.Units.FirstOrDefault(x => x.ID == unit).Name;

            if (period == "W")
            {
                //Tạo ra 1 mảng tuần mặc định bằng 0
                List<string> listDatasets = new List<string>();

                //labels của chartjs mặc định có 53 phần tử = 0
                List<string> listLabels = new List<string>();

                //labels của chartjs mặc định có 53 phần tử = 0
                List<string> targets = new List<string>();

                var datas = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Period == period).OrderBy(x => x.Week).Select(x => new { x.Value, x.Week, x.Target }).ToList();
                foreach (var valueWeek in datas)
                {
                    listDatasets.Add(valueWeek.Value);
                    listLabels.Add(valueWeek.Week.ToString());
                    targets.Add(valueWeek.Target.ToString());
                }

                model.datasets = listDatasets.ToArray();
                model.labels = listLabels.ToArray();
                model.targets = targets.ToArray();
                model.period = period;

            }
            if (period == "M")
            {
                //Tạo ra 1 mảng tuần mặc định bằng 0
                List<string> listDatasets = new List<string>();

                //labels của chartjs mặc định có 53 phần tử = 0
                List<string> listLabels = new List<string>();
                //labels của chartjs mặc định có 53 phần tử = 0
                List<string> targets = new List<string>();

                var datas = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Period == period).OrderBy(x => x.Month).Select(x => new { x.Month, x.Value, x.Target }).ToList();
                foreach (var monthly in datas)
                {
                    listDatasets.Add(monthly.Value);
                    switch (monthly.Month)
                    {
                        case 1:
                            listLabels.Add("Jan"); break;
                        case 2:
                            listLabels.Add("Feb"); break;
                        case 3:
                            listLabels.Add("Mar"); break;
                        case 4:
                            listLabels.Add("Apr"); break;
                        case 5:
                            listLabels.Add("May"); break;
                        case 6:
                            listLabels.Add("Jun"); break;
                        case 7:
                            listLabels.Add("Jul"); break;
                        case 8:
                            listLabels.Add("Aug"); break;
                        case 9:
                            listLabels.Add("Sep");
                            break;
                        case 10:
                            listLabels.Add("Oct"); break;
                        case 11:
                            listLabels.Add("Nov"); break;
                        case 12:
                            listLabels.Add("Dec"); break;
                    }
                }
                model.datasets = listDatasets.ToArray();
                model.labels = listLabels.ToArray();
                model.period = period;
                model.targets = targets.ToArray();
            }
            if (period == "Q")
            {
                //Tạo ra 1 mảng tuần mặc định bằng 0
                List<string> listDatasets = new List<string>();

                //labels của chartjs mặc định có 53 phần tử = 0
                List<string> listLabels = new List<string>();

                //labels của chartjs mặc định có 53 phần tử = 0
                List<string> targets = new List<string>();
                var datas = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Period == period).OrderBy(x => x.Quarter).Select(x => new { x.Quarter, x.Value, x.Target }).ToList();
                foreach (var quarterly in datas)
                {
                    listDatasets.Add(quarterly.Value);
                    switch (quarterly.Quarter)
                    {
                        case 1:
                            listLabels.Add("Quarter 1"); break;
                        case 2:
                            listLabels.Add("Quarter 2"); break;
                        case 3:
                            listLabels.Add("Quarter 3"); break;
                        case 4:
                            listLabels.Add("Quarter 4"); break;
                    }
                }
                model.datasets = listDatasets.ToArray();
                model.labels = listLabels.ToArray();
                model.period = period;
                model.Unit = unitName;
                model.targets = targets.ToArray();
                model.Standard = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.QuarterlyChecked == true).QuarterlyStandard;
            }
            if (period == "Y")
            {
                var datasetsKPILevel1 = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Period == period).OrderBy(x => x.Year).Select(x => x.Value).ToArray();
                var labelsKPILevel1 = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Period == period).OrderBy(x => x.Year).Select(x => x.Year).ToArray();
                var labels1 = Array.ConvertAll(labelsKPILevel1, x => x.ToSafetyString());
                var targets = _dbContext.Datas.Where(x => x.KPILevelCode == kpilevelcode && x.Period == period).OrderBy(x => x.Year).Select(x => x.Target).ToArray();

                model.datasets = datasetsKPILevel1;
                model.labels = labels1;
                model.period = period;
                model.targets = Array.ConvertAll(targets, x => x.ToSafetyString());
            }
            return model;
        }
        public List<ChartViewModel2> Compare2(string obj)
        {
            obj = obj.ToSafetyString();
            var listChartViewModel = new List<ChartViewModel2>();
            var value = obj.Split('-');

            // var size = value.Length;
            foreach (var item in value)
            {
                var kpilevelcode = item.Split(',')[0];
                var period = item.Split(',')[1];
                listChartViewModel.Add(Compare2(kpilevelcode, period));
            }
            return listChartViewModel;
        }
        public DataCompareViewModel Compare(string obj)
        {
            var listChartViewModel = new List<ChartViewModel>();
            var model = new DataCompareViewModel();
            obj = obj.ToSafetyString();

            var value = obj.Split('-');
            model.Period = value[1].Split(',')[1];
            var size = value.Length;
            foreach (var item in value)
            {
                var kpilevelcode = item.Split(',')[0];
                var period = item.Split(',')[1];
                listChartViewModel.Add(Compare(kpilevelcode, period));
                model.list1 = Compare(kpilevelcode, period);
            }

            if (size == 2)
            {
                var kpilevelcode1 = value[0].Split(',')[0];
                var period1 = value[1].Split(',')[1];
                var kpilevelcode2 = value[1].Split(',')[0];
                var period2 = value[1].Split(',')[1];
                model.list1 = Compare(kpilevelcode1, period1);
                model.list2 = Compare(kpilevelcode2, period2);

                return model;
            }
            else if (size == 3)
            {
                var kpilevelcode1 = value[0].Split(',')[0];
                var period1 = value[1].Split(',')[1];

                var kpilevelcode2 = value[1].Split(',')[0];
                var period2 = value[1].Split(',')[1];

                var kpilevelcode3 = value[2].Split(',')[0];
                var period3 = value[2].Split(',')[1];
                model.list1 = Compare(kpilevelcode1, period1);
                model.list2 = Compare(kpilevelcode2, period2);
                model.list3 = Compare(kpilevelcode3, period3);
                return model;

            }
            else if (size == 4)
            {
                var kpilevelcode1 = value[0].Split(',')[0];
                var period1 = value[1].Split(',')[1];

                var kpilevelcode2 = value[1].Split(',')[0];
                var period2 = value[1].Split(',')[1];

                var kpilevelcode3 = value[2].Split(',')[0];
                var period3 = value[2].Split(',')[1];

                var kpilevelcode4 = value[3].Split(',')[0];
                var period4 = value[3].Split(',')[1];
                model.list1 = Compare(kpilevelcode1, period1);
                model.list2 = Compare(kpilevelcode2, period2);
                model.list3 = Compare(kpilevelcode3, period3);
                model.list4 = Compare(kpilevelcode4, period4);
                return model;
            }
            else
            {
                return new DataCompareViewModel();
            }
        }

        public async Task<object> Remark(int dataid)
        {
            var model = await _dbContext.Datas.FirstOrDefaultAsync(x => x.ID == dataid);
            return new
            {
                model = model,
                users = await _dbContext.Users.Where(x => x.Permission > 1).ToListAsync()
            };
        }
        public async Task<bool> UpdateRemark(int dataid, string remark)
        {
            var model = await _dbContext.Datas.FirstOrDefaultAsync(x => x.ID == dataid);
            try
            {
                model.Remark = remark.ToSafetyString();
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<object> ListKPIUpload(int updaterid, int page, int pageSize)
        {
            
            var datas = await _dbContext.Datas.ToListAsync();
            try
            {
                var model = (await (from u in _dbContext.Uploaders.Where(x => x.UserID == updaterid)
                                    join item in _dbContext.KPILevels on u.KPILevelID equals item.ID
                                    join cat in _dbContext.CategoryKPILevels.Where(x => x.Status == true) on u.KPILevelID equals cat.KPILevelID
                                    join kpi in _dbContext.KPIs on item.KPIID equals kpi.ID
                                    join kpi_kind in _dbContext.KPI_Kinds on kpi.KPI_Kind_ID equals kpi_kind.ID
                                    select new
                                    {
                                        KPILevelID = u.KPILevelID,
                                        KPIName = kpi.Name,
                                        Code = item.KPILevelCode,
                                        Checked = item.Checked,
                                        Kind = kpi_kind.KPI_Kind_Name,
                                        StateDataW = item.WeeklyChecked ?? false,
                                        StateDataM = item.MonthlyChecked ?? false,
                                        StateDataH = item.HalfYearChecked ?? false,
                                        StateDataQ = item.QuarterlyChecked ?? false,
                                        StateDataY = item.YearlyChecked ?? false,
                                    }).ToListAsync())
                        .Select(x => new ListKPIUploadViewModel
                        {
                            KPILevelID = x.KPILevelID,
                            KPIName = x.KPIName,
                            Kind = x.Kind,
                            OC = _levelService.GetNode(x.Code),
                            Checked = x.Checked,
                            StateW = datas.Max(x => x.Week) > 0 ? true : false,
                            StateM = datas.Max(x => x.Month) > 0 ? true : false,
                            StateQ = datas.Max(x => x.Quarter) > 0 ? true : false,
                            StateH = datas.Max(x => x.Half) > 0 ? true : false,
                            StateY = datas.Max(x => x.Year) > 0 ? true : false,

                            StateDataW = x.StateDataW,
                            StateDataM = x.StateDataM,
                            StateDataQ = x.StateDataQ,
                            StateDataH = x.StateDataH,
                            StateDataY = x.StateDataY
                        }).Where(x => x.Checked == true).DistinctBy(p => p.KPIName).ToList();
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
                model = model.OrderBy(x => x.Kind)
                 .Skip((page - 1) * pageSize)
                 .Take(pageSize).ToList();

                return new
                {
                    data = model,
                    page,
                    pageSize,
                    status = true,
                    total = totalRow,
                    isUpdater = true,
                    totalPage,
                    currenPage

                };
            }
            catch (Exception ex)
            {

                throw;
            }
           
            //bảng uploader có nhiều KPILevel trùng nhau vì 1 KPILevel thuộc nhiều Category khác nhau 
            //nên ta phải distinctBy KPILevelID để lấy ra danh sách KPI không bị trùng nhau vì yêu cầu chỉ cần lấy ra KPI để upload dữ liệu
            ////Mỗi KPILevel ứng với 1 KPI khác nhau
            
        }

        public async Task<object> UpLoadKPILevel(int userid, int page, int pageSize)
        {
            var datas = _dbContext.Datas;
            var model = await (from u in _dbContext.Users
                               join l in _dbContext.Levels on u.LevelID equals l.ID
                               join item in _dbContext.KPILevels on l.ID equals item.LevelID
                               join kpi in _dbContext.KPIs on item.KPIID equals kpi.ID
                               where u.ID == userid && item.Checked == true
                               select new KPIUploadViewModel
                               {
                                   KPIName = kpi.Name,
                                   StateW = item.WeeklyChecked == true && datas.Where(x => x.KPILevelCode == item.KPILevelCode).Max(x => x.Week) > 0 ? true : false,
                                   StateM = item.MonthlyChecked == true && datas.Where(x => x.KPILevelCode == item.KPILevelCode).Max(x => x.Month) > 0 ? true : false,
                                   StateQ = item.QuarterlyChecked == true && datas.Where(x => x.KPILevelCode == item.KPILevelCode).Max(x => x.Quarter) > 0 ? true : false,
                                   StateY = item.YearlyChecked == true && datas.Where(x => x.KPILevelCode == item.KPILevelCode).Max(x => x.Year) > 0 ? true : false,

                                   StateDataW = item.WeeklyChecked ?? false,
                                   StateDataM = item.MonthlyChecked ?? false,
                                   StateDataQ = item.QuarterlyChecked ?? false,
                                   StateDataY = item.YearlyChecked ?? false,

                               }).ToListAsync();
            int totalRow = model.Count();
            model = model.OrderByDescending(x => x.KPIName)
              .Skip((page - 1) * pageSize)
              .Take(pageSize).ToList();
            var vm = new WorkplaceViewModel()
            {
                KPIUpLoads = model,
                total = totalRow,
                page = page,
                pageSize = pageSize
            };
            return vm;
        }


        public string GetValueData(string KPILevelCode, string CharacterPeriod, int period)
        {
            var value = CharacterPeriod.ToSafetyString();
            string obj = "0";
            switch (value)
            {
                case "W":
                    var item = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == KPILevelCode && x.Period == "W" && x.Week == period);
                    if (item != null)
                        obj = item.Value;
                    break;
                case "M":
                    var item1 = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == KPILevelCode && x.Period == "M" && x.Month == period);
                    if (item1 != null)
                        obj = item1.Value;
                    break;
                case "Q":
                    var item2 = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == KPILevelCode && x.Period == "Q" && x.Quarter == period);
                    if (item2 != null)
                        obj = item2.Value;
                    break;
                case "H":
                    var item4 = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == KPILevelCode && x.Period == "H" && x.Half == period);
                    if (item4 != null)
                        obj = item4.Value;
                    break;
                case "Y":
                    var item3 = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == KPILevelCode && x.Period == "Y" && x.Year == period);
                    if (item3 != null)
                        obj = item3.Value;
                    break;
            }
            return obj;
        }
        public string GetTargetData(string KPILevelCode, string CharacterPeriod, int period)
        {
            var value = CharacterPeriod.ToSafetyString();
            string obj = "0";
            switch (value)
            {
                case "W":
                    var item = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == KPILevelCode && x.Period == "W" && x.Week == period);
                    if (item != null)
                        obj = item.Target;
                    break;
                case "M":
                    var item1 = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == KPILevelCode && x.Period == "M" && x.Month == period);
                    if (item1 != null)
                        obj = item1.Target;
                    break;
                case "Q":
                    var item2 = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == KPILevelCode && x.Period == "Q" && x.Quarter == period);
                    if (item2 != null)
                        obj = item2.Target;
                    break;
                case "H":
                    var item4 = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == KPILevelCode && x.Period == "H" && x.Half == period);
                    if (item4 != null)
                        obj = item4.Target;
                    break;
                case "Y":
                    var item3 = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == KPILevelCode && x.Period == "Y" && x.Year == period);
                    if (item3 != null)
                        obj = item3.Target;
                    break;
            }
            return obj;
        }

        public List<DataExportViewModel> DataExport(int userid)
        {
            var datas = _dbContext.Datas;
            var uploaders = _dbContext.Uploaders.Any(x => x.UserID == userid);
            var owner = _dbContext.Owners.Any(x => x.UserID == userid);
            var man = _dbContext.Managers.Any(x => x.UserID == userid);

            if (owner && uploaders)
            {
                return (from u in _dbContext.Uploaders.Where(x => x.UserID == userid)
                        join kpiLevel in _dbContext.KPILevels on u.KPILevelID equals kpiLevel.ID
                        join cat in _dbContext.CategoryKPILevels on u.KPILevelID equals cat.KPILevelID
                        join kpi in _dbContext.KPIs on kpiLevel.KPIID equals kpi.ID
                        join l in _dbContext.Levels on kpiLevel.LevelID equals l.ID
                        where kpiLevel.Checked == true && cat.Status == true
                        select new DataExportViewModel
                        {
                            Area = l.Name,
                            KPILevelCode = kpiLevel.KPILevelCode,
                            KPIName = kpi.Name,
                            StateW = kpiLevel.WeeklyChecked ?? false,
                            StateM = kpiLevel.MonthlyChecked ?? false,
                            StateH = kpiLevel.HalfYearChecked ?? false,
                            StateQ = kpiLevel.QuarterlyChecked ?? false,
                            StateY = kpiLevel.YearlyChecked ?? false,

                            PeriodValueW = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Week) ?? 0 : 0,
                            PeriodValueM = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Month) ?? 0 : 0,
                            PeriodValueH = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Half) ?? 0 : 0,
                            PeriodValueQ = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Quarter) ?? 0 : 0,
                            PeriodValueY = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Year) ?? 0 : 0,

                            UploadTimeW = kpiLevel.Weekly,
                            UploadTimeM = kpiLevel.Monthly,
                            UploadTimeH = kpiLevel.HalfYear,
                            UploadTimeQ = kpiLevel.Quarterly,
                            UploadTimeY = kpiLevel.Yearly,
                            //TargetValueW = kpi.Unit == 1 ? "not require" : "require"
                        }).DistinctBy(x => x.KPILevelCode).ToList();
            }
            else if (owner)
            {

                return (from u in _dbContext.Owners.Where(x => x.UserID == userid)
                        join kpiLevel in _dbContext.KPILevels on u.KPILevelID equals kpiLevel.ID
                        join cat in _dbContext.CategoryKPILevels on u.KPILevelID equals cat.KPILevelID
                        join kpi in _dbContext.KPIs on kpiLevel.KPIID equals kpi.ID
                        join l in _dbContext.Levels on kpiLevel.LevelID equals l.ID
                        where kpiLevel.Checked == true && cat.Status == true
                        select new DataExportViewModel
                        {
                            Area = l.Name,
                            KPILevelCode = kpiLevel.KPILevelCode,
                            KPIName = kpi.Name,
                            StateW = kpiLevel.WeeklyChecked ?? false,
                            StateM = kpiLevel.MonthlyChecked ?? false,
                            StateH = kpiLevel.HalfYearChecked ?? false,
                            StateQ = kpiLevel.QuarterlyChecked ?? false,
                            StateY = kpiLevel.YearlyChecked ?? false,

                            PeriodValueW = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Week) ?? 0 : 0,
                            PeriodValueM = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Month) ?? 0 : 0,
                            PeriodValueH = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Half) ?? 0 : 0,
                            PeriodValueQ = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Quarter) ?? 0 : 0,
                            PeriodValueY = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Year) ?? 0 : 0,

                            UploadTimeW = kpiLevel.Weekly,
                            UploadTimeM = kpiLevel.Monthly,
                            UploadTimeH = kpiLevel.HalfYear,
                            UploadTimeQ = kpiLevel.Quarterly,
                            UploadTimeY = kpiLevel.Yearly,
                            //TargetValueW = kpi.Unit == 1 ? "not require" : "require"
                        }).DistinctBy(x => x.KPILevelCode).ToList();
            }
            else if (man)
            {

                return (from u in _dbContext.Managers.Where(x => x.UserID == userid)
                        join kpiLevel in _dbContext.KPILevels on u.KPILevelID equals kpiLevel.ID
                        join cat in _dbContext.CategoryKPILevels on u.KPILevelID equals cat.KPILevelID
                        join kpi in _dbContext.KPIs on kpiLevel.KPIID equals kpi.ID
                        join l in _dbContext.Levels on kpiLevel.LevelID equals l.ID
                        where kpiLevel.Checked == true && cat.Status == true
                        select new DataExportViewModel
                        {
                            Area = l.Name,
                            KPILevelCode = kpiLevel.KPILevelCode,
                            KPIName = kpi.Name,
                            StateW = kpiLevel.WeeklyChecked ?? false,
                            StateM = kpiLevel.MonthlyChecked ?? false,
                            StateH = kpiLevel.HalfYearChecked ?? false,
                            StateQ = kpiLevel.QuarterlyChecked ?? false,
                            StateY = kpiLevel.YearlyChecked ?? false,

                            PeriodValueW = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Week) ?? 0 : 0,
                            PeriodValueM = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Month) ?? 0 : 0,
                            PeriodValueH = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Half) ?? 0 : 0,
                            PeriodValueQ = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Quarter) ?? 0 : 0,
                            PeriodValueY = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Year) ?? 0 : 0,

                            UploadTimeW = kpiLevel.Weekly,
                            UploadTimeM = kpiLevel.Monthly,
                            UploadTimeH = kpiLevel.HalfYear,
                            UploadTimeQ = kpiLevel.Quarterly,
                            UploadTimeY = kpiLevel.Yearly,
                            //TargetValueW = kpi.Unit == 1 ? "not require" : "require"
                        }).DistinctBy(x => x.KPILevelCode).ToList();
            }
            else
            {
                return (from u in _dbContext.Uploaders.Where(x => x.UserID == userid)
                        join kpiLevel in _dbContext.KPILevels on u.KPILevelID equals kpiLevel.ID
                        join cat in _dbContext.CategoryKPILevels on u.KPILevelID equals cat.KPILevelID
                        join kpi in _dbContext.KPIs on kpiLevel.KPIID equals kpi.ID
                        join l in _dbContext.Levels on kpiLevel.LevelID equals l.ID
                        where kpiLevel.Checked == true && cat.Status == true
                        select new DataExportViewModel
                        {
                            Area = l.Name,
                            KPILevelCode = kpiLevel.KPILevelCode,
                            KPIName = kpi.Name,
                            StateW = kpiLevel.WeeklyChecked ?? false,
                            StateM = kpiLevel.MonthlyChecked ?? false,
                            StateH = kpiLevel.HalfYearChecked ?? false,
                            StateQ = kpiLevel.QuarterlyChecked ?? false,
                            StateY = kpiLevel.YearlyChecked ?? false,

                            PeriodValueW = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Week) ?? 0 : 0,
                            PeriodValueM = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Month) ?? 0 : 0,
                            PeriodValueH = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Half) ?? 0 : 0,
                            PeriodValueQ = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Quarter) ?? 0 : 0,
                            PeriodValueY = datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).FirstOrDefault() != null ? (int?)datas.Where(x => x.KPILevelCode == kpiLevel.KPILevelCode).Max(x => x.Year) ?? 0 : 0,

                            UploadTimeW = kpiLevel.Weekly,
                            UploadTimeM = kpiLevel.Monthly,
                            UploadTimeH = kpiLevel.HalfYear,
                            UploadTimeQ = kpiLevel.Quarterly,
                            UploadTimeY = kpiLevel.Yearly,
                            //TargetValueW = kpi.Unit == 1 ? "not require" : "require"
                        }).DistinctBy(x => x.KPILevelCode).ToList();
            }

        }

        public async Task<bool> IsUpdater(int id)
        {
            if (await _dbContext.Uploaders.FirstOrDefaultAsync(x => x.UserID == id) == null)
                return false;
            return true;
        }
        public async Task<object> KPIRelated(int levelId, int page, int pageSize)
        {
            var obj = await _dbContext.KPILevels.Where(x => x.LevelID == levelId && x.Checked == true).ToListAsync();
            var kpilevel = _dbContext.KPILevels.Where(x => x.LevelID == levelId && x.Checked == true);
            var kpiName = _dbContext.KPIs;
            var datas = _dbContext.Datas;
            var categoryKPILevels = _dbContext.CategoryKPILevels;
            var list = new List<KPIUploadViewModel>();
            if (obj != null)
            {
                foreach (var item in obj)
                {
                    var CheckCategory = categoryKPILevels.FirstOrDefault(a => a.KPILevelID == item.ID) != null ? categoryKPILevels.FirstOrDefault(a => a.KPILevelID == item.ID).Status : false;
                    if(CheckCategory == true)
                    {
                        var data = new KPIUploadViewModel()
                        {
                            KPIName = kpiName.FirstOrDefault(x => x.ID == item.KPIID).Name,
                            Area = _levelService.GetNode(item.KPILevelCode),
                            StateW = item.WeeklyChecked == true && datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Week > 0) != null ? true : false,
                            StateM = item.MonthlyChecked == true && datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Month > 0) != null ? true : false,
                            StateQ = item.QuarterlyChecked == true && datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Quarter > 0) != null ? true : false,
                            StateH = item.HalfYearChecked == true && datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Half > 0) != null ? true : false,
                            StateY = item.YearlyChecked == true && datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Year > 0) != null ? true : false,

                            StateDataW = item.WeeklyChecked ?? false,
                            StateDataM = item.MonthlyChecked ?? false,
                            StateDataQ = item.QuarterlyChecked ?? false,
                            StateDataH = item.HalfYearChecked ?? false,
                            StateDataY = item.YearlyChecked ?? false,

                        };
                        list.Add(data);
                    }
                }
                var total = list.Count();
                int totalPage = (int)Math.Ceiling((double)total / pageSize);
                var currenPage = page;
                if (totalPage > 0)
                {
                    if (currenPage < 1)
                        currenPage = 1;

                    if (currenPage > totalPage)
                        currenPage = totalPage.ToInt();
                }
                list = list.OrderBy(x => x.KPIName).Skip((page - 1) * pageSize).Take(pageSize).ToList();
                return new
                {
                    model = list,
                    total,
                    page,
                    pageSize,
                    totalPage,
                    currenPage,
                    status = true
                };
            }
            return new
            {
                status = false
            };
        }
        /// <summary>
        /// Convert the nested hierarchical object to flatten object
        /// </summary>
        /// <param name="parent"></param>
        /// <returns></returns>
        public IEnumerable<TreeView> ConvertHierarchicalToFlattenObject(TreeView parent)
        {
            yield return parent;
            foreach (TreeView child in parent.children) // check null if you must
                foreach (TreeView relative in ConvertHierarchicalToFlattenObject(child))
                    yield return relative;
        }
        public IEnumerable<LevelViewModel> ConvertHierarchicalToFlattenObject2(LevelViewModel parent)
        {
            if (parent == null)
                parent = new LevelViewModel();
            if (parent.Levels == null)
                parent.Levels = new List<LevelViewModel>();
            yield return parent;
            foreach (LevelViewModel child in parent.Levels) // check null if you must
                foreach (LevelViewModel relative in ConvertHierarchicalToFlattenObject2(child))
                    yield return relative;
        }
        public List<LevelViewModel> GetTree(List<LevelViewModel> list, int parent)
        {
            return list.Where(x => x.ParentID == parent).Select(x => new LevelViewModel
            {
                ID = x.ID,
                Name = x.Name,
                Levels = GetTree(list, x.ID)
            }).ToList();
        }
        public async Task<object> UpLoadKPILevelTrack(int userid, int page, int pageSize)
        {
            var model1 = await _levelService.GetListTreeForWorkplace(userid);
            var relative = ConvertHierarchicalToFlattenObject(model1);
            var itemuser = _dbContext.Users.FirstOrDefault(x => x.ID == userid).LevelID;
            var level = _dbContext.Levels.Select(
                x => new LevelViewModel
                {
                    ID = x.ID,
                    Name = x.Name,
                    Code = x.Code,
                    ParentID = x.ParentID,
                    ParentCode = x.ParentCode,
                    LevelNumber = x.LevelNumber,
                    State = x.State,
                    CreateTime = x.CreateTime
                }).ToList();
            // here you get your list
            var itemlevel = _dbContext.Levels.FirstOrDefault(x => x.ID == itemuser);
            var tree = GetTree(level, itemuser).FirstOrDefault();

            var relative2 = ConvertHierarchicalToFlattenObject2(tree);
            //var KPILevels = _dbContext.KPILevels.Where(x => x.Checked == true).ToList();
            var list = new List<KPIUploadViewModel>();


            var userKPIlevel = _dbContext.KPILevels.Where(x => x.Checked == true && x.LevelID == itemuser).ToList();
            foreach (var item in userKPIlevel)
            {
                var data = new KPIUploadViewModel()
                {
                    KPIName = _dbContext.KPIs.FirstOrDefault(x => x.ID == item.KPIID).Name,
                    Area = _dbContext.Levels.FirstOrDefault(x => x.ID == item.LevelID).Name,
                    StateW = item.WeeklyChecked == true && _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Week > 0) != null ? true : false,
                    StateM = item.MonthlyChecked == true && _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Month > 0) != null ? true : false,
                    StateQ = item.QuarterlyChecked == true && _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Quarter > 0) != null ? true : false,
                    StateY = item.YearlyChecked == true && _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode && x.Year > 0) != null ? true : false,

                    StateDataW = (bool?)item.WeeklyChecked ?? false,
                    StateDataM = (bool?)item.MonthlyChecked ?? false,
                    StateDataQ = (bool?)item.QuarterlyChecked ?? false,
                    StateDataY = (bool?)item.YearlyChecked ?? false,

                };
                list.Add(data);
            }
            var total = 0;
            if (relative2 != null)
            {
                var KPILevels = new List<KPILevel>();
                foreach (var aa in relative2)
                {
                    if (aa != null)
                    {
                        KPILevels = (await _dbContext.KPILevels.Where(x => x.Checked == true && x.LevelID == aa.ID)
                       .Select(a => new
                       {
                           a.KPIID,
                           a.LevelID,
                           a.WeeklyChecked,
                           a.MonthlyChecked,
                           a.QuarterlyChecked,
                           a.YearlyChecked,
                           a.KPILevelCode
                       }).ToListAsync())
                       .Select(x => new KPILevel
                       {
                           KPIID = x.KPIID,
                           LevelID = x.LevelID,
                           WeeklyChecked = x.WeeklyChecked,
                           MonthlyChecked = x.MonthlyChecked,
                           QuarterlyChecked = x.QuarterlyChecked,
                           YearlyChecked = x.YearlyChecked,
                           KPILevelCode = x.KPILevelCode
                       }).ToList();
                    }

                    if (KPILevels != null)
                    {
                        foreach (var item in KPILevels)
                        {
                            var data = new KPIUploadViewModel()
                            {
                                KPIName = (await _dbContext.KPIs.FirstOrDefaultAsync(x => x.ID == item.KPIID)).Name,
                                Area = (await _dbContext.Levels.FirstOrDefaultAsync(x => x.ID == item.LevelID)).Name,
                                StateW = item.WeeklyChecked == true && (await _dbContext.Datas.FirstOrDefaultAsync(x => x.KPILevelCode == item.KPILevelCode && x.Week > 0)) != null ? true : false,
                                StateM = item.MonthlyChecked == true && (await _dbContext.Datas.FirstOrDefaultAsync(x => x.KPILevelCode == item.KPILevelCode && x.Month > 0)) != null ? true : false,
                                StateQ = item.QuarterlyChecked == true && (await _dbContext.Datas.FirstOrDefaultAsync(x => x.KPILevelCode == item.KPILevelCode && x.Quarter > 0)) != null ? true : false,
                                StateY = item.YearlyChecked == true && (await _dbContext.Datas.FirstOrDefaultAsync(x => x.KPILevelCode == item.KPILevelCode && x.Year > 0)) != null ? true : false
                            };
                            list.Add(data);
                        }
                    }

                }
                total = list.Count();
                list = list.OrderBy(x => x.KPIName).Skip((page - 1) * pageSize).Take(pageSize).ToList();

            }

            return new
            {
                model = list,
                total,
                page,
                pageSize
            };
        }


        #region *) Helper của hàm ImportData

        /// <summary>
        /// Kiểm tra tồn tại Data
        /// </summary>
        /// <param name="kpilevelcode"></param>
        /// <param name="period"></param>
        /// <param name="periodValue"></param>
        /// <param name="year"></param>
        /// <returns></returns>
        public Data IsExistKPILevelData(string kpilevelcode, string period, int periodValue, int year)
        {
            switch (period.ToSafetyString().ToUpper())
            {
                case "W":
                    return _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.Week == periodValue && x.Yearly == year);
                case "M":
                    return _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.Month == periodValue && x.Yearly == year);
                case "H":
                    return _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.Half == periodValue && x.Yearly == year);
                case "Q":
                    return _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.Quarter == periodValue && x.Yearly == year);
                case "Y":
                    return _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevelcode && x.Period == period && x.Year == periodValue && x.Yearly == year);

                default:
                    return null;
            }
        }
        /// <summary>
        /// Hàm này dùng để lọc dữ liệu "Tạo mới" hay là "Cập nhật" đọc từ file Excel.
        /// </summary>
        /// <param name="entity">Danh sách đọc từ excel</param>
        /// <returns>Trả về 2 danh sách "Tạo mới" và "Cập nhật" đọc từ file Excel</returns>
        public Tuple<List<Data>, List<Data>> CreateOrUpdateData(List<UploadDataViewModel> entity)
        {
            List<Data> listCreateData = new List<Data>();
            List<Data> listUpdateData = new List<Data>();
            List<UploadDataViewModel> list = new List<UploadDataViewModel>();
            foreach (var item in entity)
            {
                var value = item.KPILevelCode;
                var kpilevelcode = value.Substring(0, value.Length - 1);
                var period = value.Substring(value.Length - 1, 1);
                var year = item.Year; //dữ liệu trong năm vd: năm 2019
                var valuePeriod = item.Value;
                var target = item.TargetValue;
                //query trong bảng data nếu updated thì update lại db
                var isExistData = IsExistKPILevelData(kpilevelcode, period, item.PeriodValue, year);
                switch (period)
                {
                    case "W":
                        var dataW = new Data();
                        dataW.KPILevelCode = kpilevelcode;
                        dataW.Value = item.Value;
                        dataW.Week = item.PeriodValue;
                        dataW.Yearly = year;
                        dataW.CreateTime = item.CreateTime;
                        dataW.Period = period;
                        if (item.TargetValue.ToDouble() > 0)
                            dataW.Target = item.TargetValue.ToString();
                        else dataW.Target = "0";
                        if (isExistData == null)
                            listCreateData.Add(dataW);
                        else if (isExistData != null)
                        {
                            if (isExistData.Value != valuePeriod || isExistData.Target != target)
                            {
                                dataW.ID = isExistData.ID;
                                listUpdateData.Add(dataW);
                            }
                        }
                        else
                            list.Add(item);
                        break;
                    case "M":
                        var dataM = new Data();
                        dataM.KPILevelCode = kpilevelcode;
                        dataM.Value = item.Value;
                        dataM.Month = item.PeriodValue;
                        dataM.Yearly = year;
                        dataM.CreateTime = item.CreateTime;
                        dataM.Period = period;

                        if (item.TargetValue.ToDouble() > 0)
                            dataM.Target = item.TargetValue.ToString();
                        else dataM.Target = "0";
                        if (isExistData == null)
                            listCreateData.Add(dataM);
                        else if (isExistData != null)
                        {
                            if (isExistData.Value != valuePeriod || isExistData.Target != target)
                            {
                                dataM.ID = isExistData.ID;
                                listUpdateData.Add(dataM);
                            }
                        }
                        else
                            list.Add(item);
                        break;

                    case "H":
                        var dataH = new Data();
                        dataH.KPILevelCode = kpilevelcode;
                        dataH.Value = item.Value;
                        dataH.Half = item.PeriodValue;
                        dataH.Yearly = year;
                        dataH.CreateTime = item.CreateTime;
                        dataH.Period = period;

                        if (item.TargetValue.ToDouble() > 0)
                            dataH.Target = item.TargetValue.ToString();
                        else dataH.Target = "0";
                        if (isExistData == null)
                            listCreateData.Add(dataH);
                        else if (isExistData != null)
                        {
                            if (isExistData.Value != valuePeriod || isExistData.Target != target)
                            {
                                dataH.ID = isExistData.ID;
                                listUpdateData.Add(dataH);
                            }
                        }
                        else
                            list.Add(item);
                        break;
                    case "Q":
                        var dataQ = new Data();
                        dataQ.KPILevelCode = kpilevelcode;
                        dataQ.Value = item.Value;
                        dataQ.Quarter = item.PeriodValue;
                        dataQ.Yearly = year;
                        dataQ.CreateTime = item.CreateTime;
                        dataQ.Period = period;

                        if (item.TargetValue.ToDouble() > 0)
                            dataQ.Target = item.TargetValue.ToString();
                        else dataQ.Target = "0";
                        if (isExistData == null)
                            listCreateData.Add(dataQ);
                        else if (isExistData != null)
                        {
                            if (isExistData.Value != valuePeriod || isExistData.Target != target)
                            {
                                dataQ.ID = isExistData.ID;
                                listUpdateData.Add(dataQ);
                            }
                        }
                        else
                            list.Add(item);
                        break;
                    case "Y":
                        var dataY = new Data();
                        dataY.KPILevelCode = kpilevelcode;
                        dataY.Value = item.Value;
                        dataY.Year = item.PeriodValue;
                        dataY.Yearly = year;
                        dataY.CreateTime = item.CreateTime;
                        dataY.Period = period;

                        if (item.TargetValue.ToDouble() > 0)
                            dataY.Target = item.TargetValue.ToString();
                        else dataY.Target = "0";
                        if (isExistData == null)
                            listCreateData.Add(dataY);
                        else if (isExistData != null)
                        {
                            if (isExistData.Value != valuePeriod || isExistData.Target != target)
                            {
                                dataY.ID = isExistData.ID;
                                listUpdateData.Add(dataY);
                            }
                        }
                        else
                            list.Add(item);
                        break;
                    default:

                        break;
                }
            }

            return Tuple.Create(listCreateData, listUpdateData);
        }
        public async Task<bool> IsExistsTag(int userId, int notifyId)
        {
            return await _dbContext.Tags.AnyAsync(x => x.UserID == userId && x.NotificationID == notifyId);
        }
        /// <summary>
        /// Hàm này dùng để tìm CÁC category của mỗi kpilevelcode
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        private async Task<List<int>> GetAllCategoryByKPILevel(string code)
        {
            var item = await _dbContext.KPILevels.FirstOrDefaultAsync(x => x.KPILevelCode == code && x.Checked == true);
            var kpilevelID = item.ID;
            var listCategory = await _dbContext.CategoryKPILevels.Where(x => x.KPILevelID == kpilevelID && x.Status == true).Select(x => x.CategoryID).ToListAsync();
            return listCategory;
        }

        public async Task<string> GetKPIName(string code)
        {
            var item = await _dbContext.KPILevels.FirstOrDefaultAsync(x => x.KPILevelCode == code && x.Checked == true);
            var kpilevelID = item.KPIID;
            var listCategory = await _dbContext.KPIs.Where(x => x.ID == kpilevelID).FirstOrDefaultAsync();
            return listCategory.Name;
        }

        /// <summary>
        /// Hàm này dùng để tạo url chuyển tới trang ChartPriod của từng data khi update hoặc create
        /// </summary>
        /// <param name="datas"></param>
        /// <returns></returns>
        private async Task<List<string[]>> ListURLToChartPriodAsync(List<Data> datas)
        {
            var listURLToChartPeriod = new List<string[]>();
            string http = _configuration.GetSection("AppSettings:URL").Value.ToSafetyString();
            string url = string.Empty;
            foreach (var item in datas.DistinctBy(x => x.KPILevelCode))
            {
                var oc = _levelService.GetNode(item.KPILevelCode);
                var kpiname = await GetKPIName(item.KPILevelCode);
                var listCategories = await GetAllCategoryByKPILevel(item.KPILevelCode);
                if (item.Period == "W")
                {

                    foreach (var cat in listCategories)
                    {
                        url = http + $"/ChartPeriod/{item.KPILevelCode}/{cat}/{item.Period}/{DateTime.Now.Year}/1/53";
                        listURLToChartPeriod.Add(new string[3]
                                           {
                                url,kpiname,oc
                                           });
                    }

                }
                if (item.Period == "M")
                {
                    foreach (var cat in listCategories)
                    {
                        url = http + $"/ChartPeriod/{item.KPILevelCode}/{cat}/{item.Period}/{DateTime.Now.Year}/1/12";
                        listURLToChartPeriod.Add(new string[3]
                        {
                                url,kpiname,oc
                        });
                    }
                }
                if (item.Period == "H")
                {
                    foreach (var cat in listCategories)
                    {
                        url = http + $"/ChartPeriod/{item.KPILevelCode}/{cat}/{item.Period}/{DateTime.Now.Year}/1/6";
                        listURLToChartPeriod.Add(new string[3]
                        {
                                url,kpiname,oc
                        });
                    }
                }
                if (item.Period == "Q")
                {
                    foreach (var cat in listCategories)
                    {
                        url = http + $"/ChartPeriod//{item.KPILevelCode}/{cat}/{item.Period}/{DateTime.Now.Year}/1/4";
                        listURLToChartPeriod.Add(new string[3]
                        {
                                url,kpiname,oc
                        });
                    }
                }
                if (item.Period == "Y")
                {
                    foreach (var cat in listCategories)
                    {
                        url = http + $"/ChartPeriod/{item.KPILevelCode}/{cat}/{item.Period}/{DateTime.Now.Year}/{DateTime.Now.Year}/{DateTime.Now.Year}";
                        listURLToChartPeriod.Add(new string[3]
                        {
                                    url,kpiname,oc
                        });
                    }
                }
            }
            return listURLToChartPeriod;

        }
        /// <summary>
        /// Hàm này dùng để xem chi tiết cụ thể của thông báo
        /// </summary>
        /// <param name="datas"></param>
        /// <param name="users"></param>
        /// <param name="notificationId"></param>
        /// <returns></returns>
        public async Task CreateListTagAndNotificationDetail(List<string[]> datas, IEnumerable<int> users, int notificationId)
        {
            var listNotification = new List<NotificationDetail>();
            foreach (var item in users)
            {
                foreach (var item2 in datas)
                {
                    listNotification.Add(new NotificationDetail
                    {
                        Content = item2[1] + " ( " + item2[2] + " ) ",
                        URL = item2[0].ToSafetyString(),
                        NotificationID = notificationId,
                        UserID = item,
                    });
                }
            }

            await _dbContext.NotificationDetails.AddRangeAsync(listNotification);
            try
            {
                await _dbContext.SaveChangesAsync();
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        /// <summary>
        /// Tạo thông báo
        /// </summary>
        /// <param name="notification"></param>
        /// <returns></returns>
        public async Task<int> CreateNotification(Notification notification)
        {
            _dbContext.Notifications.Add(notification);
            await _dbContext.SaveChangesAsync();
            return notification.ID;
        }

        /// <summary>
        /// Tạo list PIC để thông báo gửi mail
        /// </summary>
        /// <param name="listKPILevelID"></param>
        /// <returns></returns>
        public async Task<List<int>> CreateListPIC(List<int> listKPILevelID)
        {
            #region *) Thông báo với các manager, owner, sponsor, updater khi upload xong
            var listManager = (await _dbContext.Managers.Where(x => listKPILevelID.Contains(x.KPILevelID)).ToListAsync()).DistinctBy(x => x.KPILevelID).Select(x => x.UserID).ToList();
            var listOwner = (await _dbContext.Owners.Where(x => listKPILevelID.Contains(x.KPILevelID)).ToListAsync()).DistinctBy(x => x.KPILevelID).Select(x => x.UserID).ToList();
            var listSponsor = (await _dbContext.Sponsors.Where(x => listKPILevelID.Contains(x.KPILevelID)).ToListAsync()).DistinctBy(x => x.KPILevelID).Select(x => x.UserID).ToList();
            var listUpdater = (await _dbContext.Uploaders.Where(x => listKPILevelID.Contains(x.KPILevelID)).ToListAsync()).DistinctBy(x => x.KPILevelID).Select(x => x.UserID).ToList();
            var listAll = listManager.Union(listOwner).Union(listOwner).Union(listSponsor).Union(listUpdater);
            #endregion
            return listManager.Union(listOwner).Union(listOwner).Union(listSponsor).Union(listUpdater).ToList();
        }
        #endregion

        public async Task<ImportDataViewModel> ImportData(List<UploadDataViewModel> entity, string userUpdate, int userid)
        {
            #region *) Biến toàn cục
            string http = _configuration.GetSection("AppSettings:URL").Value.ToSafetyString();

            var listAdd = new List<Data>();
            var listTag = new List<Tag>();
            var listSendMail = new List<string>();
            var listUploadKPIViewModels = new List<UploadKPIViewModel>();
            var listOverTargets = new List<UploadKPIViewModel>();
            var listDataSuccess = new List<UploadKPIViewModel>();

            var dataModel = _dbContext.Datas;
            var kpiLevelModel = _dbContext.KPILevels;
            var kpiModel = _dbContext.KPIs;
            var levelModel = _dbContext.Levels;
            #endregion

            #region *) Lọc dữ liệu làm 2 loại là tạo mới và cập nhật
            var tuple = CreateOrUpdateData(entity);
            var listCreate = tuple.Item1;
            var listUpdate = tuple.Item2;
            #endregion

            try
            {
                #region *) Tạo mới
                if (listCreate.Count() > 0)
                {
                    _dbContext.Datas.AddRange(listCreate);
                    await _dbContext.SaveChangesAsync();
                    //Gui mail list nay khi update
                    //Tạo mới xong rồi thì thêm vào list gửi mail 
                    foreach (var item in listCreate)
                    {
                        var tblKPILevelByKPILevelCode = await kpiLevelModel.FirstOrDefaultAsync(x => x.KPILevelCode == item.KPILevelCode);
                        #region *) Upload thành công thì sẽ gửi mail thông báo
                        if (item.Value.ToDouble() > 0)
                        {
                            var dataSuccess = new UploadKPIViewModel()
                            {
                                KPILevelCode = item.KPILevelCode,
                                Area = levelModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.LevelID).Name,
                                KPIName = kpiModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.KPIID).Name,
                                Week = item.Week,
                                Month = item.Month,
                                Half = item.Half,
                                Quarter = item.Quarter,
                                Year = item.Year
                            };
                            listDataSuccess.Add(dataSuccess);
                        }
                        #endregion

                        #region *) Dưới target thì sẽ gửi mail thông báo
                        if(kpiModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.KPIID).Status == false)
                        {
                            if (item.Value.ToDouble() < item.Target.ToDouble())
                            {
                                var dataUploadKPIViewModel = new UploadKPIViewModel()
                                {
                                    KPILevelCode = item.KPILevelCode,
                                    Area = levelModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.LevelID).Name,
                                    KPIName = kpiModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.KPIID).Name,
                                    Week = item.Week,
                                    Month = item.Month,
                                    Half = item.Half,
                                    Quarter = item.Quarter,
                                    Year = item.Year
                                };
                                listUploadKPIViewModels.Add(dataUploadKPIViewModel);
                            }
                        }
                        else
                        {
                            if (item.Value.ToDouble() > item.Target.ToDouble())
                            {
                                var dataUploadKPIViewModel = new UploadKPIViewModel()
                                {
                                    KPILevelCode = item.KPILevelCode,
                                    Area = levelModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.LevelID).Name,
                                    KPIName = kpiModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.KPIID).Name,
                                    Week = item.Week,
                                    Month = item.Month,
                                    Half = item.Half,
                                    Quarter = item.Quarter,
                                    Year = item.Year
                                };
                                listOverTargets.Add(dataUploadKPIViewModel);
                            }
                        }
                        #endregion

                    }
                    //Tìm ID theo KPILevelCode trong bảng KPILevel
                    var listKPILevel = listCreate.Select(x => x.KPILevelCode).Distinct().ToArray();
                    var listKPILevelID = _dbContext.KPILevels.Where(a => listKPILevel.Contains(a.KPILevelCode)).Select(a => a.ID).ToList();

                    #region *) Lưu vào bảng thông báo
                    var notifyId = await CreateNotification(new Notification
                    {
                        Content = "You have just uploaded some KPIs.",
                        Action = "Upload",
                        TaskName = "Upload KPI Data",
                        UserID = userid,
                        Link = http + "/Home/ListSubNotificationDetail/"
                    });

                    #endregion

                    #region *) Thông báo với các manager, owner, sponsor, updater khi upload xong
                    var listAll = await CreateListPIC(listKPILevelID);
                    #endregion

                    #region *) Tạo danh sách gửi mail
                    listSendMail = _dbContext.Users.Where(x => listAll.Contains(x.ID)).Select(x => x.Email).ToList();
                    #endregion

                    #region *) Thêm vào bảng chi tiết thông báo
                    var listUrls = await ListURLToChartPriodAsync(listCreate);
                    await CreateListTagAndNotificationDetail(listUrls, listAll, notifyId);
                    #endregion
                }
                #endregion

                #region *) Cập nhật
                if (listUpdate.Count() > 0)
                {
                    foreach (var item in listUpdate)
                    {
                        switch (item.Period)
                        {
                            case "W":
                                var dataW = await dataModel.FirstOrDefaultAsync(x => x.KPILevelCode == item.KPILevelCode && x.Period == item.Period && x.Week == item.Week && x.Yearly == item.Yearly);
                                dataW.Value = item.Value;
                                dataW.Target = item.Target;
                                _dbContext.SaveChanges();
                                break;
                            case "M":
                                var dataM = await dataModel.FirstOrDefaultAsync(x => x.KPILevelCode == item.KPILevelCode && x.Period == item.Period && x.Month == item.Month && x.Yearly == item.Yearly);
                                dataM.Value = item.Value;
                                dataM.Target = item.Target;
                                _dbContext.SaveChanges();
                                break;
                            case "H":
                                var dataH = await dataModel.FirstOrDefaultAsync(x => x.KPILevelCode == item.KPILevelCode && x.Period == item.Period && x.Half == item.Half && x.Yearly == item.Yearly);
                                dataH.Value = item.Value;
                                dataH.Target = item.Target;
                                _dbContext.SaveChanges();
                                break;
                            case "Q":

                                var dataQ = await dataModel.FirstOrDefaultAsync(x => x.KPILevelCode == item.KPILevelCode && x.Period == item.Period && x.Quarter == item.Quarter && x.Yearly == item.Yearly);
                                dataQ.Value = item.Value;
                                dataQ.Target = item.Target;
                                _dbContext.SaveChanges();
                                break;
                            case "Y":
                                var dataY = await dataModel.FirstOrDefaultAsync(x => x.KPILevelCode == item.KPILevelCode && x.Period == item.Period && x.Year == item.Year && x.Yearly == item.Yearly);
                                dataY.Value = item.Value;
                                dataY.Target = item.Target;
                                _dbContext.SaveChanges();
                                break;
                            default:
                                break;
                        }
                        var tblKPILevelByKPILevelCode = await kpiLevelModel.FirstOrDefaultAsync(x => x.KPILevelCode == item.KPILevelCode);
                        #region *)
                        if (item.Value.ToDouble() > 0)
                        {
                            var dataSuccess = new UploadKPIViewModel()
                            {
                                KPILevelCode = item.KPILevelCode,
                                Area = levelModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.LevelID).Name,
                                KPIName = kpiModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.KPIID).Name,
                                Week = item.Week,
                                Month = item.Month,
                                Half = item.Half,
                                Quarter = item.Quarter,
                                Year = item.Year
                            };
                            listDataSuccess.Add(dataSuccess);
                        }
                        #endregion

                        #region *) Nếu dữ liệu mà nhỏ hơn mục tiêu thì sẽ gửi mail
                        if (kpiModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.KPIID).Status == false)
                        {
                            if (item.Value.ToFloat() < item.Target.ToFloat())
                            {
                                var dataUploadKPIViewModel = new UploadKPIViewModel()
                                {
                                    KPILevelCode = item.KPILevelCode,
                                    Area = levelModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.LevelID).Name,
                                    KPIName = kpiModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.KPIID).Name,
                                    Week = item.Week,
                                    Month = item.Month,
                                    Half = item.Half,
                                    Quarter = item.Quarter,
                                    Year = item.Year
                                };
                                listUploadKPIViewModels.Add(dataUploadKPIViewModel);
                            }
                        }
                        else
                        {
                            if (item.Value.ToFloat() > item.Target.ToFloat())
                            {
                                var dataUploadKPIViewModel = new UploadKPIViewModel()
                                {
                                    KPILevelCode = item.KPILevelCode,
                                    Area = levelModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.LevelID).Name,
                                    KPIName = kpiModel.FirstOrDefault(x => x.ID == tblKPILevelByKPILevelCode.KPIID).Name,
                                    Week = item.Week,
                                    Month = item.Month,
                                    Half = item.Half,
                                    Quarter = item.Quarter,
                                    Year = item.Year
                                };
                                listOverTargets.Add(dataUploadKPIViewModel);
                            }
                        }
                        #endregion
                    }
                    //Tìm ID theo KPILevelCode trong bản KPILevel
                    var listKPILevel = listUpdate.Select(x => x.KPILevelCode).Distinct().ToArray();
                    var listKPILevelID = _dbContext.KPILevels.Where(a => listKPILevel.Contains(a.KPILevelCode)).Select(a => a.ID).ToList();

                    #region *) Lưu vào bảng thông báo
                    var notifyId = await CreateNotification(new Notification
                    {
                        Content = "You have just uploaded some KPIs.",
                        Action = "Upload",
                        TaskName = "Upload KPI Data",
                        UserID = userid,
                        Link = http + "/Home/ListSubNotificationDetail/"
                    });

                    #endregion

                    #region *) Thông báo với các manager, owner, sponsor, updater khi upload xong
                    var listAll = await CreateListPIC(listKPILevelID);
                    #endregion
                    #region Tạo danh sách gửi mail
                    listSendMail = _dbContext.Users.Where(x => listAll.Contains(x.ID)).Select(x => x.Email).ToList();
                    #endregion

                    #region *) Thêm vào bảng chi tiết thông báo
                    var listUrls = await ListURLToChartPriodAsync(listUpdate);
                    await CreateListTagAndNotificationDetail(listUrls, listAll, notifyId);
                    #endregion
                }

                #endregion
                if (listUploadKPIViewModels.Count > 0 || listDataSuccess.Count > 0)
                {
                    return new ImportDataViewModel
                    {
                        ListDatasBelowTarget = listUploadKPIViewModels,
                        ListDatasOverTarget = listOverTargets,
                        ListDatasSuccess = listDataSuccess,
                        ListSendMail = listSendMail,
                        Status = true,
                    };
                }else if (listOverTargets.Count > 0 || listDataSuccess.Count > 0)
                {
                    return new ImportDataViewModel
                    {
                        ListDatasOverTarget = listOverTargets,
                        ListDatasSuccess = listDataSuccess,
                        ListSendMail = listSendMail,
                        Status = true,
                    };
                }
                else
                {
                    return new ImportDataViewModel
                    {
                        ListDatasBelowTarget = listUploadKPIViewModels,
                        ListDatasSuccess = listDataSuccess,
                        ListSendMail = listSendMail,
                        Status = true,
                    };
                }
               
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return new ImportDataViewModel
                {
                    ListDatasBelowTarget = listUploadKPIViewModels,
                   
                    Status = false,
                };
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

        public async Task AddLateOnUploadAsync(List<LateOnUpLoad> lateOnUpLoads)
        {
            try
            {
                await _dbContext.LateOnUpLoads.AddRangeAsync(lateOnUpLoads);
                await _dbContext.SaveChangesAsync();
            }
            catch
            {

            }
        }

        public PagedList<LateOnUpLoad> LateOnUpLoads(int userId, int notificationId, int? page, int? pageSize)
        {
            var source = _dbContext.LateOnUpLoads.Where(x => x.UserID == userId && x.NotificationID == notificationId).ToList();

            return PagedList<LateOnUpLoad>.Create(source, page ?? 1, pageSize ?? 20);
        }
        public async Task<PagedList<ActionPlanTagViewModel>> ListTasks(string code, int? page, int? pageSize)
        {
            var actionPlans = new List<ActionPlanTagViewModel>();
            var model = await _dbContext.ActionPlans.Where(x => x.KPILevelCode == code).ToListAsync();
            foreach (var x in model)
            {
                var kpilevel = await _dbContext.KPILevels.FirstOrDefaultAsync(a => a.KPILevelCode == x.KPILevelCode);
                var ocName = _levelService.GetNode(kpilevel.LevelID);
                var kpiName = (await _dbContext.KPIs.FirstOrDefaultAsync(a => a.ID == kpilevel.KPIID)).Name;
                var createdBy = (await _dbContext.Users.FirstOrDefaultAsync(a => a.ID == x.UserID)).Alias;

                actionPlans.Add(new ActionPlanTagViewModel
                {
                    TaskName = x.Title,
                    Description = x.Description,
                    DueDate = x.Deadline.ToString("dddd, dd MMMM yyyy"),
                    UpdateSheduleDate = x.UpdateSheduleDate?.ToString("dddd, dd MMMM yyyy") ?? "#N/A",
                    ActualFinishDate = x.ActualFinishDate?.ToString("dddd, dd MMMM yyyy") ?? "#N/A",
                    Status = x.Status,
                    PIC = x.Tag,
                    Approved = x.ApprovedStatus,
                    KPIName = kpiName,
                    OC = ocName,
                    URL = _dbContext.Notifications.FirstOrDefault(a => a.ActionplanID == x.ID)?.Link,
                    CreatedBy = createdBy,
                    CreatedDate = x.CreateTime.ToString("dddd, dd MMMM yyyy")
                });
            }
            return PagedList<ActionPlanTagViewModel>.Create(actionPlans, page ?? 1, pageSize ?? 20);
        }

        public async Task<PagedList<NotificationDetail>> GetAllSubNotificationsByIdAsync(int notificationId, int user, int? page, int? pageSize)
        {
            var model = _dbContext.NotificationDetails.Where(x => x.NotificationID == notificationId && x.UserID == user);
            return await PagedList<NotificationDetail>.CreateAsync(model, page ?? 1, pageSize ?? 20);
        }

        public List<ActionDataExportViewModel> DataExportActionPlan(int kpilevelID)
        {
            throw new NotImplementedException();
        }

        
    }
}
