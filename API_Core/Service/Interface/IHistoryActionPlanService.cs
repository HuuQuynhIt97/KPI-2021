using Models.Data;
using Models.EF;
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

namespace Service.Interface
{
    public interface IHistoryActionPlanService
    {
        Task<List<HistoryActionPlan>> GetAll();

        Task<bool> Create(HistoryActionPlan entity);
        //Task<object> Add(HistoryActionPlanViewModel obj);
        Task<object> LoadHistoryActionPlanByID(int actionplanID);

    }
}
