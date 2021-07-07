
using Models.EF;
using Models.ViewModels.KPILevel;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using API.Helpers;

namespace API.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class AdminKPILevelController : ControllerBase
    {
        private readonly IKPILevelService _KPILevelService;
        private readonly ILevelService _levelService;
        private readonly IUserService _userService;

        public AdminKPILevelController(IKPILevelService KPILevelService, ILevelService levelService,IUserService userService)
        {
            _KPILevelService = KPILevelService;
            _levelService = levelService;
            _userService = userService;

        }
        // GET: AdminKPILevel
        /// <summary>
        /// Lấy ra danh sách OC theo tree view
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
        public async Task<IActionResult> GetListTree()
        {
            return Ok(await _levelService.GetListTree());
        }

        [HttpGet("{level}/{category}")]
        [HttpGet("{level}/{category}/{page}/{pageSize}")]
        public async Task<IActionResult> LoadDataKPILevel(int level, int category, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _KPILevelService.LoadData(level, category, page, pageSize));
        }

        [AllowAnonymous]
        [HttpGet("{level}/{category}/{lang}/{page}/{pageSize}")]
        public async Task<IActionResult> LoadDataKPILevel2(int level, int category,string lang, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _KPILevelService.LoadData2(level, category,lang, page, pageSize));
        }

        [AllowAnonymous]
        [HttpGet("{level}/{category}/{name}/{lang}/{page}/{pageSize}")]
        public async Task<IActionResult> LoadDataKPILevel3(int level, int category,string name, string lang, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _KPILevelService.LoadData3(level, category,name, lang, page, pageSize));
        }

        [HttpGet("{level}/{category}")]
        [HttpGet("{level}/{category}/{page}/{pageSize}")]
        public async Task<IActionResult> GetAll(int level, int category, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _KPILevelService.GetAllPaging(level, category, page, pageSize));
        }

        //public async Task<IActionResult> GetCategoryCode(Category entity)
        //{
        //    return Ok(await _KPILevelService.GetAllCategory());
        //}
        //update kpiLevel
        [HttpPost]
        public async Task<IActionResult> UpdateKPILevel([FromBody]KPILevelForUpdate entity)
        {
            return Ok(await _KPILevelService.Update(entity));
        }

        [HttpPost]
        public async Task<IActionResult> UpdateConversionKPILevel([FromBody] KPILevelForUpdate entity)
        {
            return Ok(await _KPILevelService.UpdateConversionKPILevel(entity));
        }

        [HttpGet("{kpilevelcode}")]
        public async Task<IActionResult> LoadDataPerfomance(string kpilevelcode)
        {
            return Ok(await _KPILevelService.LoadDataPerfomance(kpilevelcode));
        }


        [HttpPost]
        public async Task<IActionResult> AddScorePerfomance([FromBody] ScoreViewModel entity)
        {
            return Ok(await _KPILevelService.AddScorePerfomance(entity));
        }

        [HttpPost]
        public async Task<IActionResult> UpdateScorePerfomanceData([FromBody] ScoreViewModel entity)
        {
            return Ok(await _KPILevelService.UpdateScorePerfomanceData(entity));
        }

        [HttpPost]
        public async Task<IActionResult> UpdateScoreData([FromBody] KPILevelForUpdate entity)
        {
            return Ok(await _KPILevelService.UpdateScoreData(entity));
        }
        //update kpiLevel
        [HttpPost]
        public async Task<IActionResult> Update([FromBody]KPILevelForUpdate entity)
        {
            return Ok(await _KPILevelService.UpdateKPILevel(entity));
        }
        [AllowAnonymous]
        [HttpGet("{ID}")]
        public async Task<IActionResult> GetbyID(int ID)
        {
            return Ok(await _KPILevelService.GetDetail(ID));
        }
        [HttpGet]
        [AllowAnonymous]
        public async Task<IActionResult> GetListAllUser()
        {
            return Ok(await _userService.GetAll());
        }
    }
}