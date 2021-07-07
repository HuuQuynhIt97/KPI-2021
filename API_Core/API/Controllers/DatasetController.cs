
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;
using System;
using System.Threading.Tasks;
using API.Helpers;
using Service.Helpers;

namespace API.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class DatasetController : ControllerBase
    {
        private readonly IDataService _dataService;

        public DatasetController(IDataService dataService)
        {
            _dataService = dataService;
        }

        // GET: Dataset
        [HttpGet("{catid}/{period}/{start}/{end}/{year}")]
        public async Task<ActionResult> GetAllDataByCategory(int catid, string period, int? start, int? end, int? year)
        {
            year ??= DateTime.Now.Year;
            return Ok(await _dataService.GetAllDataByCategory(catid, period, start, end, year));
        }

        [HttpGet("{catid}/{period}/{start}/{end}/{year}")]
        public async Task<ActionResult> GetAllKPIOverview(int catid, string period , int? start, int? end , int? year)
        {
            year ??= DateTime.Now.Year;
            string token = Request.Headers["Authorization"];
            var userId = Extensions.GetDecodeTokenByProperty(token, "nameid").ToInt();
            return Ok(await _dataService.GetAllKpiOverview(catid, period, start, end, year, userId));
        }

        [HttpGet("{catid}/{period}/{lang}/{start}/{end}/{year}")]
        public async Task<ActionResult> GetAllKPIOverviewWithLang(int catid, string period, string lang , int? start, int? end, int? year)
        {
            year ??= DateTime.Now.Year;
            string token = Request.Headers["Authorization"];
            var userId = Extensions.GetDecodeTokenByProperty(token, "nameid").ToInt();
            return Ok(await _dataService.GetAllKpiOverview2(catid, period,lang, start, end, year, userId));
        }

        [HttpGet("{catid}/{period}/{start}/{end}/{year}")]
        public async Task<ActionResult> SortKPIOverview(int catid, string period, int? start, int? end, int? year)
        {
            year ??= DateTime.Now.Year;
            string token = Request.Headers["Authorization"];
            var userId = Extensions.GetDecodeTokenByProperty(token, "nameid").ToInt();
            return Ok(await _dataService.SortKpiOverview(catid, period, start, end, year, userId));
        }

        [AllowAnonymous]
        [HttpGet("{period}/{point}/{kpilevelID}/{userID}")]
        public async Task<ActionResult> SortActionPlanByPeriod(string period , int point, int kpilevelID, int userID)
        {
            return Ok(await _dataService.SortActionPlanByPeriod(period, point, kpilevelID, userID));
        }


        [AllowAnonymous]
        [HttpGet("{period}/{point}/{kpilevelID}/{kpilevelCode}/{userID}")]
        public async Task<ActionResult> SortActionPlanByPeriodTest(string period, int point, int kpilevelID, string kpilevelCode , int userID)
        {
            return Ok(await _dataService.SortActionPlanByPeriodTest(period, point, kpilevelID, kpilevelCode, userID));
        }
    }
}