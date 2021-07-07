using Models.Data;
using Models.EF;
using System;
using System.Threading.Tasks;

namespace Service.Interface
{
    public interface IUserService: IDisposable,ICommonService<User>
    {
        Task<bool> AddUserToLevel(int id, int levelid,string modifyBy);
        Task<object> LoadDataUser(int levelid, string code, int page, int pageSize);
        Task<object> LoadDataUser2(int levelid, string code);
        Task<object> GetUserOnline();
        Task<object> LoadDataUser3(int levelid, string code, int page, int pageSize);
        Task<bool> LockUser(int id);
        Task<bool> ChangePassword(string username, string newpass);
        Task<bool> Checkpermisson(int userid);
        Task<object> Sidebars(int role,int userid);
        Task<object> GetListAllRoles(int userid);
        Task<object> LoadData(string name, int page, int pageSize);
        Task<int> AddAsync(User user);
        Task<object> FindByEmail(string email,string username);
        Task<object> FindByEmail1(string email);
    }

}
