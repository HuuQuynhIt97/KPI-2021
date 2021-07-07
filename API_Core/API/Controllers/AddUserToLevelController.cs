
using API.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace API.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class AddUserToLevelController : ControllerBase
    {
        private readonly IUserService _userService;
        public AddUserToLevelController(IUserService userService)
        {
            _userService = userService;
        }

        // GET: AddUserToLevel
        [HttpPost("{id}/{levelid}/{modifyBy}")]
        public async Task<IActionResult> AddUserToLevel(int id, int levelid,string modifyBy)
        {
            return Ok(await _userService.AddUserToLevel(id, levelid, modifyBy));
        }
        [AllowAnonymous]
        [HttpGet("{levelid}")]
        [HttpGet("{levelid}/{code}/{page}/{pageSize}")]
        public async Task<IActionResult> LoadDataUser(int levelid, string code, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            
            return Ok(await _userService.LoadDataUser(levelid, code, page, pageSize));
        }
        [AllowAnonymous]

        [HttpGet("{code}/{levelid}")]
        public async Task<IActionResult> LoadDataUser2(int levelid, string code)
        {

            return Ok(await _userService.LoadDataUser2(levelid, code));
        }

        [AllowAnonymous]

        [HttpGet("{levelid}/{page}/{pageSize}")]
        public async Task<IActionResult> LoadDataUser3(int levelid, string code, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {

            return Ok(await _userService.LoadDataUser3(levelid, code, page, pageSize));
        }
    }
}