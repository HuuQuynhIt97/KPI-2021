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

namespace Service.Interface
{
   public interface IKPIService: IDisposable, ICommonService<KPI>
    {
        Task<bool> AddKPILevel(KPILevel entity);
        int Total();
        List<Category> GetCategoryCode();
        Task<bool> Delete(int id);
        Task<bool> Delete2(int id,int userid);
        Task<KPI> GetbyId(int ID);
        Task<object> Autocomplete(string search);
        Task<object> GetAllAjax(string kpilevelcode, string period);
        Task<object> ListComments(int dataid, int userid);
        Task<object> LoadData(int? CatID ,string name,string lang, int page, int pageSize);
        Task<object> LoadData2(int? CatID, string name, string lang, int page, int pageSize);
        //Task<object> Add(KPIVM entity);
        Task<bool> AddAsync(KPIVM entity);
        Task<bool> AddKPIKINDAsync(KPIKINDVM entity);
        Task<bool> UpdateKPIKIND(KPIKINDVM entity);
        Task<bool> RemoveKpiKind(int Id);
        Task<object> GetAllKpiKind();
        Task<object> GetAllKpiKindWithLang( string lang);
        Task<bool> AddAsync2(KPIVM entity);
        Task<object> GetByIdd(int Id);
        Task<bool> UpdateAsync(KPIVM entity);
    }

}
