using Models.Data;
using Models.EF;
using Models.ViewModels.ActionPlan;
using Models.ViewModels.HistoryActionPlan;
using Models.ViewModels.Comment;
using Models.ViewModels.User;
using Microsoft.EntityFrameworkCore;
using Service.Helpers;
using Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using System.Threading;
using Service.SignalR;
using Models.ViewModels.Category;
using Microsoft.AspNetCore.SignalR;

namespace Service.Implementation
{

    public class HistoryActionPlanService : IHistoryActionPlanService
    {
        private readonly DataContext _dbContext;
  
        //private readonly IHistoryActionPlanService _historyActionPlanService;

        public HistoryActionPlanService(DataContext dbContext
            //IHistoryActionPlanService historyActionPlanService
            )
        {
            //_historyActionPlanService = historyActionPlanService;
            _dbContext = dbContext;

        }

        public async Task<bool> Create(HistoryActionPlan entity)
        {
            //entity.UpdateSheduleDate = entity.UpdateSheduleDate.ToDateTime();
            if (entity.UpdateSheduleDate == null)
            {
                entity.UpdateSheduleDate = null;
            }
            else
            {

                entity.UpdateSheduleDate = entity.UpdateSheduleDate;
            }

            if (entity.ActualFinishDate == null)
            {
                entity.ActualFinishDate = null;
            }
            else
            {

                entity.ActualFinishDate = entity.ActualFinishDate;
            }
            await _dbContext.HistoryActionPlans.AddAsync(entity);

            try
            {
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                return false;

            }
        }


        /// <summary>
        /// Khi thêm 1 comment nếu tag nhiều user thì lưu vào bảng Tag đồng thời lưu vào bảng Notification để thông báo đẩy
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="subject"></param>
        /// <param name="auditor"></param>
        /// <returns></returns>


        public async Task<List<HistoryActionPlan>> GetAll()
        {
            return await _dbContext.HistoryActionPlans.ToListAsync();
        }

        public async Task<object> LoadHistoryActionPlanByID(int actionplanID)
        {
            
            var data = await _dbContext.HistoryActionPlans.Where(x => x.ActionPlanID == actionplanID)
                .Select(x => new HistoryActionPlanViewModel
                {
                    Action = x.Action,
                    Title = _dbContext.ActionPlans.FirstOrDefault(a => a.ID == actionplanID).Title,
                    ActualFinishDate = x.ActualFinishDate,
                    UpdateSheduleDate = x.UpdateSheduleDate,
                    CreatedBy = _dbContext.Users.FirstOrDefault(a => a.ID == x.UserID).Alias
                })
                .ToListAsync();

            return new
            {
                data,
                title = _dbContext.ActionPlans.FirstOrDefault(a => a.ID == actionplanID).Title
            };
        }
    }
}
