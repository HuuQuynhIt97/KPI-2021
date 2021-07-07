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
using Models.ViewModels.Menu;
using Models.ViewModels.Category;

namespace Service.Implementation
{
    
    public class MenuService : IMenuService
    {
        private readonly DataContext _dbContext;

        public MenuService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<bool> Add(Menu entity)
        {

            try
            {
                _dbContext.Menus.Add(entity);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch
            {

                return false;
            }
        }

        public async Task<bool> Remove(int Id)
        {
            try
            {
                var category = await GetById(Id);
                _dbContext.Menus.Remove(category);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch 
            {
               
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

        public async Task<List<Menu>> GetAll()
        {
            return await _dbContext.Menus.ToListAsync() ;
        }

        //public List<Menu> GetAllPaging(string keyword, int page, int pageSize)
        //{
        //    throw new NotImplementedException();
        //}

        public async Task<Menu> GetById(int Id)
        {
            return await _dbContext.Menus.FindAsync(Id);
        }

        public async Task<bool> Update(Menu entity)
        {
            try
            {
                var item = await _dbContext.Menus.FirstOrDefaultAsync(x => x.ID == entity.ID);
                item.Name = entity.Name;
                item.Link = entity.Link;
                item.Position = entity.Position;
                item.BackgroudColor = entity.BackgroudColor;
                item.FontAwesome = entity.FontAwesome;
                item.MenuLangs = entity.MenuLangs;
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

        public async Task<List<Menu>> GetAllById(int Id)
        {
            return await _dbContext.Menus.Where(x=>x.ID == Id).ToListAsync();

        }
        public async Task<List<MenuViewModel>> GetMenusAsync(int role)
        {
            var model = await _dbContext.MenuRoles.Where(x => x.RoleID == role).Select(x => new MenuViewModel
            {
                Code = x.Menu.Code,
                BackgroudColor = x.Menu.BackgroudColor,
                Link = x.Menu.Link,
                FontAwesome = x.Menu.FontAwesome,
                Index = x.Index,
                Position = x.Menu.Position
            }).OrderBy(x => x.Position).ToListAsync();
            return model;
        }

        public async Task<List<MenuViewModel>> GetMenusAsync2(int role , string lang)
        {
            var model = await _dbContext.MenuRoles.Where(x => x.RoleID == role ).Select(x => new MenuViewModel
            {
                Code = x.Menu.Code,
                BackgroudColor = x.Menu.BackgroudColor,
                Link = x.Menu.Link,
                FontAwesome = x.Menu.FontAwesome,
                Index = x.Index,
                Position = x.Menu.Position
            }).OrderBy(x => x.Position).ToListAsync();
            return model;
        }

        public async Task<PagedList<Menu>> GetAllPaging(string keyword, int page, int pageSize)
        {
            var source = _dbContext.Menus.AsQueryable();
            if (!keyword.IsNullOrEmpty())
            {
                source = source.Where(x => x.Name.Contains(keyword));
            }
            return await PagedList<Menu>.CreateAsync(source, page, pageSize);
        }

        public object GetMenusAsync3(int role, string lang)
        {
            var model =  _dbContext.MenuRoles.Include(x=>x.Menu).ThenInclude(x=>x.MenuLangs).Where(x => x.RoleID == role).Select(x => new MenuViewModel
            {
                Code = x.Menu.Code,
                BackgroudColor = x.Menu.BackgroudColor,
                Link = x.Menu.Link,
                FontAwesome = x.Menu.FontAwesome,
                Index = x.Index,
                Position = x.Menu.Position,
                Name = x.Menu.MenuLangs.FirstOrDefault(a=>a.LangID == lang).Name
            }).OrderBy(x => x.Position).ToList();
            return model;
        }

        public object GetMenusAsyncAdmin(string lang)
        {
            var model = _dbContext.MenuRoles.Include(x => x.Menu).ThenInclude(x => x.MenuLangs).Where(x => x.RoleID == 1).Select(x => new MenuViewModel
            {
                Code = x.Menu.Code,
                BackgroudColor = x.Menu.BackgroudColor,
                Link = x.Menu.Link,
                FontAwesome = x.Menu.FontAwesome,
                Index = x.Index,
                Position = x.Menu.Position,
                Name = x.Menu.MenuLangs.FirstOrDefault(a => a.LangID == lang).Name
            }).OrderBy(x => x.Position).ToList();
            return model;
        }
        public object GetMenusAsyncUser(string lang)
        {
            var model = _dbContext.MenuRoles.Include(x => x.Menu).ThenInclude(x => x.MenuLangs).Where(x => x.RoleID == 2).Select(x => new MenuViewModel
            {
                Code = x.Menu.Code,
                BackgroudColor = x.Menu.BackgroudColor,
                Link = x.Menu.Link,
                FontAwesome = x.Menu.FontAwesome,
                Index = x.Index,
                Position = x.Menu.Position,
                Name = x.Menu.MenuLangs.FirstOrDefault(a => a.LangID == lang).Name
            }).OrderBy(x => x.Position).ToList();
            return model;
        }

        public Task<PagedList<Menu>> GetAllPaging(string keyword, string lang, int page, int pageSize)
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
