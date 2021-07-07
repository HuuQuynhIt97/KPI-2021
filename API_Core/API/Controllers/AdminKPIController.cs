using Models.EF;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using API.Helpers;
using Models.ViewModels.KPI;
using API.SignalR;
using Microsoft.AspNetCore.SignalR;

namespace API.Controllers
{
    [ApiController]
    [Route("[controller]/[action]")]
    [Authorize]
    public class AdminKPIController : ControllerBase
    {
        private readonly IKPIService _KPIService;
        private readonly IUnitService _unitService;
        private readonly IHubContext<HenryHub> _hubContext;
        public AdminKPIController(IKPIService KPIService, IUnitService unitService, IHubContext<HenryHub> hubContext)
        {
            _KPIService = KPIService;
            _unitService = unitService;
            _hubContext = hubContext;
        }
        /// <summary>
        /// Thêm KPI
        /// </summary>
        /// <param name="entity"></param>
        /// <returns>True or False</returns>

        [HttpPost]
        public async Task<IActionResult> Add([FromBody]KPIVM entity)
        {
            return Ok(await _KPIService.AddAsync(entity));
        }

        
        [HttpPost]
        public async Task<IActionResult> Add2([FromBody]KPIVM entity)

        {
            await _hubContext.Clients.All.SendAsync("SentMess", "message");
            return Ok(await _KPIService.AddAsync2(entity));
        }

        [HttpPost]
        public async Task<IActionResult> Update([FromBody] KPIVM entity)
        {
            return Ok(await _KPIService.UpdateAsync(entity));
        }
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> AddKPIKIND([FromBody] KPIKINDVM entity)
        {
            return Ok(await _KPIService.AddKPIKINDAsync(entity));
        }
        //KPI KIND
        [AllowAnonymous]
        [HttpGet]
        public async Task<IActionResult> GetAllKpiKind()
        {
            return Ok(await _KPIService.GetAllKpiKind());
        }


        //KPI KIND
        [AllowAnonymous]
        [HttpGet("{lang}")]
        public async Task<IActionResult> GetAllKpiKindWithLang(string lang)
        {
            return Ok(await _KPIService.GetAllKpiKindWithLang(lang));
        }


        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> UpdateKPIKIND([FromBody] KPIKINDVM entity)
        {
            return Ok(await _KPIService.UpdateKPIKIND(entity));
        }

        [AllowAnonymous]
        [HttpPost("{id}")]
        public async Task<IActionResult> DeleteKpiKind(int id)
        {
            return Ok(await _KPIService.RemoveKpiKind(id));
        }
        //KPI KIND
        [HttpPost]
        public async Task<IActionResult> AddKPILevel([FromBody]KPILevel entity)
        {
            return Ok(await _KPIService.AddKPILevel(entity));
        }
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _KPIService.GetAll());
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            await _hubContext.Clients.All.SendAsync("SentMess", "message");
            return Ok(await _KPIService.Delete(id));
        }

        [AllowAnonymous]
        [HttpPost("{id}/{userid}")]
        public async Task<IActionResult> Delete2(int id,int userid)
        {
            return Ok(await _KPIService.Delete2(id,userid));
        }
        
        [AllowAnonymous]
        [HttpGet("{ID}")]
        public async Task<IActionResult> GetbyID(int ID)
        {
            return Ok(await _KPIService.GetByIdd(ID));
        }
        /// <summary>
        /// Lấy danh sách theo phân trang
        /// </summary>
        /// <param name="catID">Khóa chỉnh của bảng category</param>
        /// <param name="name">Keyword để lọc dữ liệu</param>
        /// <param name="page">Số trang</param>
        /// <param name="pageSize">Số dòng trên 1 trang</param>
        /// <returns>Trả về danh sách dữ liệu đã được phân trang</returns>
        /// 
        [AllowAnonymous]
        [HttpPost("{page}/{pageSize}")]

        [HttpPost("{page}/{pageSize}/{name}/{lang}")]
        public async Task<IActionResult> LoadData(int? catID, string name, string lang, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            return Ok(await _KPIService.LoadData(catID, name, lang, page, pageSize));
        }
        [AllowAnonymous]

        [HttpPost("{page}/{pageSize}/{lang}")]
        public async Task<IActionResult> LoadData2(int? catID, string name, string lang, int page = ConstantCommon.PAGE, int pageSize = ConstantCommon.PAGE_SIZE)
        {
            //await _hubContext.Clients.All.SendAsync("ReceiveMessage", "user", "message");

            return Ok(await _KPIService.LoadData2(catID, name, lang, page, pageSize));
        }

        [HttpGet("{name}")]
        public async Task<IActionResult> Autocomplete(string name)
        {
            return Ok(await _KPIService.Autocomplete(name));
        }
        [HttpGet]
        public async Task<IActionResult> GetAllUnit()
        {
            return Ok(await _unitService.GetAll());
        }
    }
}