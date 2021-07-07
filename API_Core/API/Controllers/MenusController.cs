using Models.EF;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using API.Helpers;
using System.Linq;
using Service.Helpers;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Http;
using System;

namespace API.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class MenusController : ControllerBase
    {
        private readonly IMenuService _menuService;

        public MenusController(IMenuService menuService)
        {
            _menuService = menuService;
        }
        [HttpPost]
        public async Task<IActionResult> Add([FromBody]Menu entity)
        {
            if (await _menuService.Add(entity))
                return Ok();
            return BadRequest();
        }
        [HttpPost]
        public async Task<IActionResult> Update([FromBody]Menu entity)
        {
            if (await _menuService.Update(entity))
                if (await _menuService.Update(entity))
                    return Ok();
            return BadRequest();
        }
        [HttpGet("{Id}")]
        public async Task<IActionResult> Delete(int Id)
        {
            if (await _menuService.Remove(Id))
                return Ok();
            return BadRequest();
        }
        [HttpGet("{Id}")]
        public async Task<IActionResult> GetById(int Id)
        {

            return Ok(await _menuService.GetById(Id));
        }
        [AllowAnonymous]
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            string token = Request.Headers["Authorization"];
            var roleId = Extensions.DecodeToken(token).FirstOrDefault(x => x.Type == "Role").Value.ToInt();
            return Ok(await _menuService.GetMenusAsync(roleId));
        }

  
        [AllowAnonymous]
        [HttpGet("{lang}")]
        public IActionResult GetAll2(string lang)
        {
            string token = Request.Headers["Authorization"];
            var roleId = Extensions.DecodeToken(token).FirstOrDefault(x => x.Type == "Role").Value.ToInt();
            return Ok( _menuService.GetMenusAsync3(roleId, lang));
        }

        [AllowAnonymous]
        [HttpGet("{lang}")]
        public IActionResult GetMenuAdmin(string lang)
        {
            return Ok(_menuService.GetMenusAsyncAdmin(lang));
        }

        [AllowAnonymous]
        [HttpGet("{lang}")]
        public IActionResult GetMenuUser(string lang)
        {
            return Ok(_menuService.GetMenusAsyncUser(lang));
        }
        //[HttpGet("{keyword}")]
        //[HttpGet("{page}/{pageSize}/{keyword}")]
        //public async Task<IActionResult> GetAllPaging(string keyword, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        //{
        //    return Ok(await _menuService.GetAllPaging(keyword, page, pageSize));
        //}

        [HttpGet("{langBy}")]
        public IActionResult ChangeLocale(string langBy)
        {
            string token = Request.Headers["Authorization"];
            var role = Extensions.DecodeToken(token).FirstOrDefault(x => x.Type == "Role").Value.ToInt();
            return Ok(role);

        }
        /// <summary>  
        /// set the cookie  
        /// </summary>  
        /// <param name="key">key (unique indentifier)</param>  
        /// <param name="value">value to store in cookie object</param>  
        /// <param name="expireTime">expiration time</param>  
        private void Set(string key, string value, int? expireTime)
        {
            CookieOptions option = new CookieOptions();

            if (expireTime.HasValue)
                option.Expires = DateTime.Now.AddMinutes(expireTime.Value);
            else
                option.Expires = DateTime.Now.AddMilliseconds(10);
            option.HttpOnly = false;
            Response.Cookies.Append(key, value, option);
        }
        /// <summary>  
        /// Delete the key  
        /// </summary>  
        /// <param name="key">Key</param>  
        private void Remove(string key)
        {
            Response.Cookies.Delete(key);
        }
        /// <summary>  
        /// Get the cookie  
        /// </summary>  
        /// <param name="key">Key </param>  
        /// <returns>string value</returns>  
        private string Get(string key)
        {
            return Request.Cookies[key];
        }
    }
}
