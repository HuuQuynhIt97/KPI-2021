using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Models.EF;
using Service.Helpers;
using Service.Interface;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace API.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class ActionPlanController : ControllerBase
    {
        private readonly IActionPlanService _actionPlanService;
        private readonly ICategoryService _categoryService;
        public readonly IWebHostEnvironment _environment;


        public ActionPlanController(
            IWebHostEnvironment environment,
            IActionPlanService actionPlanService, ICategoryService categoryService
            )
        {
            _environment = environment;
            _actionPlanService = actionPlanService;
            _categoryService = categoryService;
        }

        // GET: ActionPlan/GetActionPlanByCategory
        [HttpGet("{catid}")]
        public async Task<IActionResult> GetAllById(int catid)
        {
            return Ok(await _actionPlanService.GetAllById(catid));
        }
        [HttpGet]
        public async Task<IActionResult> GetAllCategory()
        {

            return Ok(await _categoryService.GetAll());
        }
        [HttpGet("{actionPlanID}")]
        [AllowAnonymous]
        public async Task<IActionResult> GetFileUpload(int actionPlanID)
        {
            return Ok(await _actionPlanService.GetFileUpload(actionPlanID));
        }

        [HttpPost]
        public async Task<ActionResult<UploadFile>> UploadFile([FromForm]List<UploadFile> entity)
        {
            if (ModelState.IsValid)
            {
                var list = new List<UploadFile>();
                var file = Request.Form.Files["UploadedFile"];
                var uploadBy = Request.Form["uploadBy"];
                var actionPlanID = Request.Form["actionPlanID"];
                if (file != null)
                {

                    if (!Directory.Exists(_environment.WebRootPath + "\\FileUpload\\"))
                    {
                        Directory.CreateDirectory(_environment.WebRootPath + "\\FileUpload\\");
                    }

                    for (int i = 0; i < Request.Form.Files.Count; i++)
                    {
                        var currentFile = Request.Form.Files[i];
                        using FileStream fileStream = System.IO.File.Create(_environment.WebRootPath + "\\FileUpload\\" + currentFile.FileName);
                        await currentFile.CopyToAsync(fileStream);
                        fileStream.Flush();
                        list.Add(new UploadFile
                        {
                            ActionPlanID = actionPlanID.ToInt(),
                            UploadBy = uploadBy.ToInt(),
                            Name = currentFile.FileName
                        });
                    }

                }
                var model = await _actionPlanService.UploadFile(list);
                return Ok(model);
            }
            else
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors);
            }
            return Ok(entity);
        }
    }
}