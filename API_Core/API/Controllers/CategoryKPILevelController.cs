
using Models.EF;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;
using System.Threading.Tasks;
using API.Helpers;
using Microsoft.AspNetCore.Authorization;
using Service.Helpers;

namespace API.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class CategoryKPILevelController : ControllerBase
    {
        private readonly ICategoryKPILevelService _categoryKPILevelService;
        private readonly IKPILevelService _kPILevelService;
        private readonly ICategoryService _categoryService;
        private readonly ILevelService _levelService;

        public CategoryKPILevelController(ICategoryKPILevelService categoryKPILevelService, ILevelService levelService,
            IKPILevelService kPILevelService,
            ICategoryService categoryService)
        {
            _categoryKPILevelService = categoryKPILevelService;
            _kPILevelService = kPILevelService;
            _categoryService = categoryService;
            _levelService = levelService;
        }
        // GET: CategoryKPILevelAdmin
        [HttpGet("{ocID}/{level}")]
        [HttpGet("{ocID}/{level}/{page}/{pageSize}")]
        public async Task<IActionResult> GetAllCategories(int level,int ocID, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _categoryService.GetAllByCategory(page, pageSize, level, ocID));
        }
        [AllowAnonymous]
        [HttpGet("{ocID}/{lang}/{level}/{page}/{pageSize}")]
        public async Task<IActionResult> GetAllCategories2(int level,string lang, int ocID, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _categoryService.GetAllByCategory2( level,lang, ocID,page, pageSize));
        }

        [HttpGet("{page}/{pageSize}")]
        public async Task<IActionResult> GetAllKPIlevels(int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _kPILevelService.GetAll(page, pageSize));
        }
        [HttpPost]
        public async Task<IActionResult> Add([FromBody]CategoryKPILevel entity)
        {
            return Ok(await _categoryKPILevelService.Add(entity));
        }
        [AllowAnonymous]
        [HttpGet("{category}")]
        [HttpGet("{category}/{page}/{pageSize}")]
        public async Task<IActionResult> GetAllKPILevelByCategory(int category, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _categoryKPILevelService.LoadKPILevel(category, page, pageSize));

        }
        [AllowAnonymous]
        [HttpGet("{category}/{level}/{lang}/{page}/{pageSize}")]
        public async Task<IActionResult> GetAllKPILevelByCategory2(int category,int level, string lang ,int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _categoryKPILevelService.LoadKPILevel2(category, level, lang, page, pageSize ));

        }
        [HttpGet]
        public async Task<IActionResult> GetListID()
        {
            string token = Request.Headers["Authorization"];
            var ocID = Extensions.GetDecodeTokenByProperty(token, "LevelId").ToInt();
            return Ok( await _levelService.GetListID2(ocID));

        }

        [HttpGet]
        public async Task<IActionResult> GetlevelOC()
        {
            string token = Request.Headers["Authorization"];
            var ocID = Extensions.GetDecodeTokenByProperty(token, "LevelId").ToInt();
            return Ok(await _levelService.GetlevelOC(ocID));

        }
    }
}