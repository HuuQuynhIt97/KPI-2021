using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using API.SignalR;
using System.Threading.Tasks;
using API.Dto;
using Models.EF;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using Service.Interface;
using API.Dtos;
using Service.Helpers;
using API.Helpers;
using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using Models.Data;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;
        private readonly IConfiguration _configuration;
        private readonly IMapper _mapper;
        private readonly ILevelService _levelService;
        private readonly IHubContext<HenryHub> _hubContext;
        private readonly DataContext _dbContext;
        public AuthController(IAuthService authService,
            ILevelService levelService,
            IConfiguration configuration,
            IHubContext<HenryHub> hubContext,
            DataContext dbContext,
            IMapper mapper)
        {
            _authService = authService;
            _configuration = configuration;
            _mapper = mapper;
            _hubContext = hubContext;
            _levelService = levelService;
            _dbContext = dbContext;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] UserForRegisterDto userForRegisterDto)
        {
            userForRegisterDto.Username = userForRegisterDto.Username.ToLower();

            if (await _authService.FindByNameAsync(userForRegisterDto.Username) != null)
                return BadRequest("Username already exists");
          
            var user=  _mapper.Map<User>(userForRegisterDto);
            var createdUser = await _authService.Register(user, userForRegisterDto.Password);


            return CreatedAtRoute("GetUser", new { controller = "User", id = createdUser.ID }, userForRegisterDto);
        }


        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody]UserForLoginDto userForLoginDto)
        {
            var user = await _authService.FindByNameAsync(userForLoginDto.Username);
            var result = await _authService.Login(userForLoginDto.Username, userForLoginDto.Password);
            if (result == null)
                return Unauthorized();
            var userprofile = new UserProfileDto()
            {
                User = new UserForReturnLogin
                {
                    Username = user.Username,
                    Role = user.Role,
                    ID = user.ID,
                    Alias = user.Alias,
                    ListOCs = await _levelService.GetListID(user.LevelID),
                    LevelOC = await _levelService.GetlevelOC(user.LevelID),
                    IsActive = user.IsActive
                },
                Menus = JsonConvert.SerializeObject(await _authService.GetMenusAsync(user.Role))
            };
            await _hubContext.Clients.All.SendAsync("updateCount");
            
            return Ok(new
            {
                token =  GenerateJwtToken(new Models.ViewModels.Auth.UserLang
                {
                    ID = result.ID,
                    Username = result.Username,
                    Alias = result.Alias,
                    Permission = result.Permission,
                    LevelID = result.LevelID,
                    LevelOC = await _levelService.GetlevelOC(user.LevelID),
                    IsActive = result.IsActive,
                    Lang = "en"
                }),
                user = userprofile,
            });
        }

        //damaris will write new function to login 

        //step 1 declare http method

        [HttpPost("logininto")]
        //step 2 declare function name and keyword (public or private)
        public async Task<IActionResult> Logininto([FromBody] UserForLoginDto userForLoginDt)
        {
            //get user info from database by entered username
            var userinfo = _dbContext.Users.FirstOrDefault(x => x.Username == userForLoginDt.Username);
            var result = new User();

            //verify the password
            if (userinfo != null)
            {
                if(userinfo.Password == userForLoginDt.Password)
                {
                    result = userinfo;
                }
            }
            return Ok(result);
        }
        //step 3 writing comparasion code 


        [HttpPost]
        public async Task<IActionResult> Edit([FromBody] UserForLoginDto userForLoginDto)
        {
            return Ok(await _authService.Edit(userForLoginDto.Username));
        }

        [HttpPost("UpdateIsOnline/{userid}")]
        public async Task<IActionResult> UpdateIsOnline(int userid)
        {
            return Ok(await _authService.UpdateIsOnline(userid));
        }

        private string GenerateJwtToken(Models.ViewModels.Auth.UserLang user)
        {
            if (user.Permission == 1)
            {
                user.Role = "Admin";
            } else if (user.Permission == 2 && user.LevelOC == 3 || user.LevelOC == 2)
            {
                user.Role = "Admin";
            } else
            {
                user.Role = "User";

            }
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, user.ID.ToString()),
                new Claim(ClaimTypes.Name, user.Username),
                new Claim(ClaimTypeEnum.LevelId.ToString(), user.LevelID.ToSafetyString(),ClaimTypeEnum.LevelId.ToString()),
                new Claim(ClaimTypeEnum.Alias.ToString(), user.Alias.ToSafetyString(),ClaimTypeEnum.Alias.ToString()),
                new Claim(ClaimTypeEnum.RoleName.ToString(), user.Role.ToSafetyString(),ClaimTypeEnum.Role.ToString()),
                new Claim(ClaimTypeEnum.Role.ToString(), user.Permission.ToSafetyString(),ClaimTypeEnum.Role.ToString()),
                new Claim(ClaimTypeEnum.Lang.ToString(), user.Lang.ToSafetyString(),ClaimTypeEnum.Lang.ToString())

            };
          
            var key = new SymmetricSecurityKey(Encoding.UTF8
                .GetBytes(_configuration.GetSection("AppSettings:Token").Value));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.Now.AddDays(1),
                SigningCredentials = creds
            };

            var tokenHandler = new JwtSecurityTokenHandler();

            var token = tokenHandler.CreateToken(tokenDescriptor);
            //Response.Cookies.Append("access_token", tokenHandler.WriteToken(token), new CookieOptions() { HttpOnly = true, SameSite = SameSiteMode.Strict });
            return tokenHandler.WriteToken(token);
        }
    }
}