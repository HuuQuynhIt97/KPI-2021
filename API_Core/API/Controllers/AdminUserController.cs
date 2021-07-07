
using Models.EF;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;
using System.Threading.Tasks;
using API.Helpers;
using Models.ViewModels.Auth;
using Microsoft.AspNetCore.Authorization;
using Models.Data;
using Microsoft.Extensions.Configuration;
//using Microsoft.AspNetCore.Identity.UI.V3.Pages.Account.Internal;

namespace API.Controllers
{
    [ApiController]
    [Authorize]
    [Route("[controller]/[action]")]
    public class AdminUserController : ControllerBase
    {
        private readonly DataContext _dbContext;
        private readonly IUserService _userService;
        private readonly IMenuService _menuService;
        private readonly IMailHelper _mailHelper;
        private readonly IConfiguration _configuration;
        public AdminUserController(IUserService userService, IMenuService menuService, DataContext dbContext, IMailHelper mailHelper, IConfiguration configuration)
        {
            _mailHelper = mailHelper;
            _configuration = configuration;
            _userService = userService;
            _menuService = menuService;
            _dbContext = dbContext;
        }


        // GET: Account
        [HttpPost]
        public async Task<IActionResult> Add([FromBody]User entity)
        {
            return Ok(await _userService.AddAsync(entity));
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _userService.GetAll());
        }
        [HttpGet]
        public async Task<IActionResult> GetUserOnline()
        {
            return Ok(await _userService.GetUserOnline());
        }
        [AllowAnonymous]
        [HttpPost("{page}/{pageSize}")]
        [HttpPost("{page}/{pageSize}/{name}")]
        public async Task<IActionResult> LoadData(string name, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _userService.LoadData(name, page, pageSize));
        }
        [AllowAnonymous]
        [HttpPost("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            return Ok(await _userService.Remove(id));
        }
        [HttpPost]
        public async Task<IActionResult> Update([FromBody]User entity)
        {
            return Ok(await _userService.Update(entity));
        }
        [HttpGet("{ID}")]
        public async Task<IActionResult> GetbyID(int ID)
        {
            return Ok(await _userService.GetById(ID));
        }
        [HttpGet("{ID}")]
        public async Task<IActionResult> LockUser(int ID)
        {
            return Ok(await _userService.LockUser(ID));
        }
        [HttpGet]
        public async Task<IActionResult> GetAllMenus()
        {
            return Ok(await _menuService.GetAll());
        }

        [HttpGet("{userid}")]
        public async Task<IActionResult> Checkpermisson(int userid)
        {
            return Ok(await _userService.Checkpermisson(userid));
        }

        [AllowAnonymous]
        [HttpGet("{userid}")]
        public async Task<IActionResult> GetListAllPermissions(int userid)
        {
            return Ok(await _userService.GetListAllRoles(userid));
        }
        [HttpPost]
        public async Task<IActionResult> ChangePassword([FromBody]ChangePasswordModel model)
        {
            return Ok(await _userService.ChangePassword(model.Username, model.Password));
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> ForgotPassword([FromBody]ForgotPasswordModel model)
        {
            return Ok(await _userService.FindByEmail(model.Email,model.Username));
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> RecoverPassword([FromBody]ForgotPasswordModel model)
        {
            return Ok(await _userService.FindByEmail1(model.Email));
        }


        [HttpPost]
        public async Task<IActionResult> UpdatePassword([FromBody]string username, string password)
        {
            return Ok(await _userService.ChangePassword(username, password));
        }
    }
}