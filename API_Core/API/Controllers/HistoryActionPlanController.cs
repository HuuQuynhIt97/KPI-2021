using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Models.EF;
using Models.ViewModels.HistoryActionPlan;
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
    public class HistoryActionPlanController : ControllerBase
    {
 
        private readonly IHistoryActionPlanService _historyActionPlanService;

        public HistoryActionPlanController( IHistoryActionPlanService historyActionPlanService)
        {

            _historyActionPlanService = historyActionPlanService;
        }
        [AllowAnonymous]
        [HttpGet]
        public async Task<ActionResult> GetAll()
        {

            return Ok(await _historyActionPlanService.GetAll());
        }
        [AllowAnonymous]
        [HttpPost]
        public async Task<ActionResult<HistoryActionPlan>> Create(HistoryActionPlan model)
        {
            return Ok(await _historyActionPlanService.Create(model));
        }

        [AllowAnonymous]
        [HttpGet("{actionplanID}")]
        public async Task<IActionResult> LoadHistoryActionPlanByID(int actionplanID)
        {
            return Ok(await _historyActionPlanService.LoadHistoryActionPlanByID(actionplanID));
        }
    }
}