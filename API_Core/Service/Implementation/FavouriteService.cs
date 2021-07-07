
using Models.Data;
using Models.EF;
using Models.ViewModels.Favourite;
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
   
    public class FavouriteService : IFavouriteService
    {
        private readonly DataContext _dbContext;
        public FavouriteService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<bool> Add(Favourite entity)
        {

            try
            {
                _dbContext.Favourites.Add(entity);
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


        public Task<List<Favourite>> GetAll()
        {
            throw new NotImplementedException();
        }

        public Task<List<Favourite>> GetAllById(int Id)
        {
            throw new NotImplementedException();
        }

        public async Task<PagedList<Favourite>> GetAllPaging(string keyword, int page, int pageSize)
        {
            var source = _dbContext.Favourites.AsQueryable();
            if (!keyword.IsNullOrEmpty())
            {
                source = source.Where(x => x.Period.Contains(keyword));
            }
            return await PagedList<Favourite>.CreateAsync(source, page, pageSize);

        }

        public Task<Favourite> GetById(int Id)
        {
            throw new NotImplementedException();
        }
        public async Task<bool> Remove(int id)
        {
            try
            {
                var item = await _dbContext.Favourites.FirstOrDefaultAsync(x => x.ID == id);
                _dbContext.Favourites.Remove(item);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return false;
            }
        }
        

        public Task<bool> Update(Favourite entity)
        {
            throw new NotImplementedException();
        }
        public async Task<object> GetAllPaging(int userid, int page, int pageSize)
        {

            try
            {

                var model = (await _dbContext.Favourites
               .Where(x => x.UserID == userid).Join(
                    _dbContext.KPILevels,
                    f => f.KPILevelCode,
                    kpilevel => kpilevel.KPILevelCode,
                    (f, kpilevel) => new
                    {
                        f.UserID,
                        kpilevel.KPIID,
                        kpilevel.LevelID,
                        f.CreateTime,
                        kpilevel.KPILevelCode,
                        f.Period,
                        f.Link,
                        f.ID
                    }).ToListAsync())
               .Select(x => new FavouriteViewModel
               {
                   KPIName = _dbContext.KPIs.FirstOrDefault(k => k.ID == x.KPIID).Name,
                   Username = _dbContext.Users.FirstOrDefault(u => u.ID == x.UserID).Username,
                   TeamName = _dbContext.Levels.FirstOrDefault(l => l.ID == x.LevelID).Name,
                   Level = _dbContext.KPIs.FirstOrDefault(k => k.ID == x.KPIID).LevelID,
                   CreateTime = x.CreateTime,
                   KPILevelCode = x.KPILevelCode,
                   Link = x.Link,
                   Period = x.Period,
                   ID = x.ID
               })
               .OrderByDescending(x => x.CreateTime)
               .Skip((page - 1) * pageSize)
               .Take(pageSize)
               .ToList();
                int totalRow = model.Count();
                return new
                {
                    status = true,
                    data = model,
                    total = totalRow
                };

            }
            catch (Exception ex)
            {
                var message = ex.Message;
                throw;
            }

        }

        public Task<PagedList<Favourite>> GetAllPaging(string keyword, string lang, int page, int pageSize)
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
