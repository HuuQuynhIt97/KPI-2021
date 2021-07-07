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

namespace Service.Interface
{
    public interface ICategoryService : ICommonService<Category>, IDisposable
    {
        Task<object> GetAllByCategory(int page, int pageSize, int level, int ocID);
        Task<object> GetAllByCategory2( int level, string lang, int ocID, int page, int pageSize);
        /// <summary>
        /// tbl.Category và tbl.OCs là quan hệ n - n, Nên dựa vào tbl.OCCateogries để lấy ra danh sách tương ứng.
        /// +) Mỗi tbl.Categories, tbl.OCs có 1 levelNumber, 
        /// dựa vào levelNumber của tbl.OCs để lấy ra danh sách Category 
        /// Select ID,Name,
        ///        (Select Status 
        ///         From OCCategories 
        ///         Where OCID = 55 and 
        ///        	   OCCategories.CategoryID = Categories.ID)  as State
        /// From Categories
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <param name="level">Level Number của 2 bảng</param>
        /// <param name="ocID"></param>
        /// <returns></returns>
        Task<object> GetCategoryByOC(int page, int pageSize, int level, int ocID);
        Task<object> GetCategoryByOC2(int level,string lang, int ocID, int page, int pageSize);

        Task<object> GetById2(int Id);
        Task<bool> UpdateAsync(CategoryVM entity);

        Task<bool> AddCateKind(CateKind entity);
        Task<bool> UpdateCateKind(CateKind entity);
        Task<bool> RemoveCateKind(int Id);
        Task<object> GetAllCateKind();
    }
}
