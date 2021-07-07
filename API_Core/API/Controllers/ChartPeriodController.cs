using Models.EF;
using Models.ViewModels.Comment;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;
using System.Threading.Tasks;
using API.Helpers;
using System.Linq;
using Service.Helpers;
using System.Collections.Generic;
using Models.ViewModels.ActionPlan;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using API.SignalR;
using System.Threading;
using API.Dto;
using API.Dto.ChartPeriod;
using System;
using System.Data;
using System.IO;
using OfficeOpenXml;
using OfficeOpenXml.Table;
using OfficeOpenXml.Style;
using Microsoft.AspNetCore.Http;
using Models.Data;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using System.Net.Http.Headers;
using Microsoft.AspNetCore.Http.Features;

namespace API.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class ChartPeriodController : ControllerBase
    {
        private readonly IDataService _dataService;
        private readonly ICommentService _commentService;
        private readonly IActionPlanService _actionPlanService;
        private readonly ISettingService _settingService;
        private readonly IMailHelper _mailHelper;
        private readonly IKPILevelService _kPILevelService;
        private readonly IFavouriteService _favouriteService;
        private readonly IConfiguration _configuaration;
        private readonly IHubContext<HenryHub> _hubContext;
        private readonly INotificationService _notificationService;
        private readonly IConfiguration _configuration;
        public readonly IWebHostEnvironment _environment;
        // GET: Month
        public ChartPeriodController(IDataService dataService,
            ICommentService commentService,
            IWebHostEnvironment environment,
            IActionPlanService actionPlanService,
            ISettingService settingService,
            IMailHelper mailHelper,
            IKPILevelService kPILevelService,
            IFavouriteService favouriteService,
            IConfiguration configuaration,
            IHubContext<HenryHub> hubContext,
            INotificationService notificationService, IConfiguration configuration)
        {
            _environment = environment;
            _configuration = configuration;
            _dataService = dataService;
            _commentService = commentService;
            _actionPlanService = actionPlanService;
            _settingService = settingService;
            _mailHelper = mailHelper;
            _kPILevelService = kPILevelService;
            _favouriteService = favouriteService;
            _configuaration = configuaration;
            _hubContext = hubContext;
            _notificationService = notificationService;
        }


        [AllowAnonymous]
        [HttpGet("{kpilevelID}/{userID}")]
        public async Task<IActionResult> GetAllActionPlan(int kpilevelID, int userID)
        {
            //var userprofile = Session["UserProfile"] as UserProfileVM;
            return Ok(await _actionPlanService.GetAllActionPlan(kpilevelID , userID));
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> SaveFile(IFormFile formFile)
        {
            try
            {
                IFormFile file = Request.Form.Files["formFile"];
                if (file != null)
                {
                    string filename = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    filename = _environment.WebRootPath + "\\Image" + $@"\{filename}";
                    if (!System.IO.File.Exists(filename))
                    {
                        using (FileStream fs = System.IO.File.Create(filename))
                        {
                            file.CopyTo(fs);
                            fs.Flush();
                        }
                    }
                    else
                    {
                        Response.Clear();
                        Response.StatusCode = 204;
                        Response.HttpContext.Features.Get<IHttpResponseFeature>().ReasonPhrase = "File already exists.";
                        return Ok(new { status = false, ExistFile = true });
                    }
                }

            }
            catch (Exception ex)
            {
                Response.Clear();
                Response.ContentType = "application/json; charset=utf-8";
                Response.StatusCode = 204;
                Response.HttpContext.Features.Get<IHttpResponseFeature>().ReasonPhrase = "No Content";
                Response.HttpContext.Features.Get<IHttpResponseFeature>().ReasonPhrase = ex.Message;
            }
            return Content("");
        }

        [AllowAnonymous]
        [HttpGet("{filename}")]
        public ActionResult DownloadExcelActionPlan(string filename)

        {
            string Files = $"wwwroot/FileUpload/{filename}";

            byte[] fileBytes = System.IO.File.ReadAllBytes(Files);

            System.IO.File.WriteAllBytes(Files, fileBytes);

            MemoryStream ms = new MemoryStream(fileBytes);

            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, filename);

        }

        [AllowAnonymous]
        [HttpPost("{filename}")]
        public ActionResult DeleteFile(string filename)

        {
            string Files = $"wwwroot/image/{filename}";
            FileInfo TheFileInfo = new FileInfo(Files);
            if (TheFileInfo.Exists)
            {
                System.IO.File.Delete(Files);
            }
            return Ok();

        }

        [AllowAnonymous]
        [HttpGet("{kpilevelID}")]
        public ActionResult ActionPlanExcelExport(int kpilevelID)
        {
      
            var model = _dataService.DataExportActionPlan(kpilevelID);


            DataTable Dt = new DataTable();
            Dt.Columns.Add("KPILevel Code", typeof(string));
            Dt.Columns.Add("KPI Name", typeof(string));
            Dt.Columns.Add("Actual Value", typeof(string));
            Dt.Columns.Add("Target Value", typeof(object));
            Dt.Columns.Add("Period Value", typeof(string));
            Dt.Columns.Add("Year", typeof(int));
            Dt.Columns.Add("OC", typeof(string));
            Dt.Columns.Add("Update Time", typeof(object));
            Dt.Columns.Add("Start Date", typeof(string));
            Dt.Columns.Add("End Date", typeof(string));
            foreach (var item in model)
            {
                //var oc = _levelService.GetNode(item.KPILevelCode);
               
            }
            var memoryStream = new MemoryStream();
            using var excelPackage = new ExcelPackage(memoryStream);
            var worksheet = excelPackage.Workbook.Worksheets.Add("Sheet1");
            worksheet.Cells["A1"].LoadFromDataTable(Dt, true, TableStyles.None);
            worksheet.Cells["A1:AN1"].Style.Font.Bold = true;
            worksheet.DefaultRowHeight = 18;

            worksheet.Column(2).Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
            worksheet.Column(6).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            worksheet.Column(7).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            worksheet.DefaultColWidth = 20;
            worksheet.Column(2).AutoFit();
            if (excelPackage == null)
            {
                return NotFound();
            }

            byte[] data = excelPackage.GetAsByteArray() as byte[];

            return File(data, "application/octet-stream", "DataUpload.xlsx");

        }

        [HttpGet("{kpilevelcode}/{catid}/{period}/{year}/{start}/{end}")]
        public async Task<IActionResult> ListDatas(string kpilevelcode, int? catid, string period, int? year, int? start, int? end)
        {
            string token = Request.Headers["Authorization"];
            var userID = Extensions.GetDecodeTokenByProperty(token, "nameid").ToInt();
            var model =await _dataService.ListDatas(kpilevelcode, period, year, start, end, catid, userID);
            return Ok(model);
        }

        [AllowAnonymous]
        [HttpGet("{kpilevelcode}/{catid}/{period}/{lang}/{year}/{start}/{end}")]
        public async Task<IActionResult> ListDatas2(string kpilevelcode, int? catid, string period,string lang, int? year, int? start, int? end)
        {
            string token = Request.Headers["Authorization"];
            var userID = Extensions.GetDecodeTokenByProperty(token, "nameid").ToInt();
            var model = await _dataService.ListDatas2(kpilevelcode, period, lang, year, start, end, catid, userID);
            return Ok(model);
        }

        [HttpGet("{code}/{period}")]
        public async Task<IActionResult> GetItemInListOfWorkingPlan(string code, string period)
        {
            return Ok(await _kPILevelService.GetItemInListOfWorkingPlan(code, period));
        }

        [HttpPost]
        public async Task<IActionResult> AddComment([FromBody]AddCommentViewModel entity)
        {
            string token = Request.Headers["Authorization"];
            var userID = Extensions.GetDecodeTokenByProperty(token, "nameid").ToInt();

            var levelNumberOfUserComment = Extensions.GetDecodeTokenByProperty(token, "LevelId").ToInt();

            var data = await _commentService.AddComment(entity, levelNumberOfUserComment);
            
            //await _hubContext.Clients.All.SendAsync("ReceiveMessage", "user", "message");



            var tos = new List<string>();

            await _hubContext.Clients.All.SendAsync("ReceiveMessage", data, "message");


            if (data.ListEmails.Count > 0 && await _settingService.IsSendMail("ADDCOMMENT"))
            {
                var model = data.ListEmails.DistinctBy(x => x);
                //string from = ConfigurationManager.AppSettings["FromEmailAddress"].ToSafetyString();
                string content = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                   <p>The account <b>" + model.First()[0] + "</b> mentioned you in KPI System Apps. </p>" +
                                  "<p>Content: " + model.First()[4] + "</p>" +
                                  "<p>Link: <a href='" + data.QueryString + "'>Click Here</a></p>" +
                                  "<br/>" +

                                  @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                   <p> 帳號 <b> " + model.First()[0] + " </b> 在 KPI 系統提及您. </p>"+
                                   "<p>內容: " + model.First()[4] + "</p>" +
                                  "<p>連結: <a href='" + data.QueryString + "'>點選這裡</a></p>";
                Thread thread = new Thread(async () =>
                {
                    await _mailHelper.SendEmailRange(model.Select(x => x[1]).ToList(), "[KPI System-02] Comment", content);
                });
                thread.Start();
            }
            return Ok(new { status = data.Status, isSendmail = true });
        
        }
        [AllowAnonymous]
        [HttpGet("{dataid}/{userid}/{kpiID}")]
        public async Task<IActionResult> LoadDataComment(int dataid, int userid, int kpiID)
        {
            return Ok(await _commentService.ListComments(dataid, userid , kpiID));
        }
        [HttpPost]
        public async Task<IActionResult> AddCommentHistory([FromBody]int userid, int dataid)
        {
            return Ok(await _commentService.AddCommentHistory(userid, dataid));
        }
        [HttpGet("{dataid}")]
        public async Task<IActionResult> Remark(int dataid)
        {
            return Ok(await _dataService.Remark(dataid));
        }
        [HttpPost]
        public async Task<IActionResult> AddFavourite([FromBody]Favourite entity)
        {
            return Ok(await _favouriteService.Add(entity));
        }

        [AllowAnonymous]
        [HttpGet("{obj}/{page}/{pageSize}")]
        public async Task<IActionResult> LoadDataProvide(string obj, int page, int pageSize)
        {
            return Ok(await _kPILevelService.LoadDataProvide(obj, page, pageSize));
        }
        [HttpGet("{dataid}/{remark}")]
        public async Task<IActionResult> UpdateRemark(int dataid, string remark)
        {
            return Ok(await _dataService.UpdateRemark(dataid, remark));
        }
        [HttpPost]
        public async Task<IActionResult> Update([FromBody]ActionPlan item)
        {
            return Ok(await _actionPlanService.Update(item));
        }
        [HttpPost]
        public async Task<IActionResult> Add([FromBody]ActionPlanParams obj)
        {
            string token = Request.Headers["Authorization"];
            var userID = Extensions.GetDecodeTokenByProperty(token, "nameid").ToInt();
            obj.OwnerID = userID;
            var data = await _actionPlanService.Add(obj);//(item, obj.Subject, obj.Auditor, obj.CategoryID);
            try
            {
                await _hubContext.Clients.All.SendAsync("ReceiveMessage", "user", "message");

            }
            catch (System.Exception ex)
            {

                throw;
            }


            
            return Ok(new { status = data.Status, isSendmail = true });
        }

        [HttpPost]
        public async Task<ActionResult> AddActionPlanFormData([FromForm]ActionPlanParams obj)
        {
            string token = Request.Headers["Authorization"];
            var userID = Extensions.GetDecodeTokenByProperty(token, "nameid").ToInt();
            obj.OwnerID = userID;
            IFormFile file = Request.Form.Files["UploadedFile"];
            if (file != null)
            {
                if (!Directory.Exists(_environment.WebRootPath + "\\ExcelFolder\\"))
                {
                    Directory.CreateDirectory(_environment.WebRootPath + "\\ExcelFolder\\");
                }
                using (FileStream fileStream = System.IO.File.Create(_environment.WebRootPath + "\\ExcelFolder\\" + file.FileName))
                {
                    file.CopyTo(fileStream);
                    fileStream.Flush();

                }
                obj.FileName = file.FileName;
            }
            else
            {
                obj.FileName = null;
            }

            var data = await _actionPlanService.AddActionPlanFormData(obj);
            

            await _hubContext.Clients.All.SendAsync("ReceiveMessage", "user", "message");


            return Ok(new { status = data.Status, isSendmail = true , message = data.Message });
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            return Ok(await _actionPlanService.Remove(id));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> DeleteComment2(int id)
        {
            return Ok(await _commentService.Remove(id));
        }

        [AllowAnonymous]
        [HttpGet("{DataID}/{CommentID}/{UserID}")]
        public async Task<IActionResult> GetAll(int DataID, int CommentID, int UserID)
        {
            //var userprofile = Session["UserProfile"] as UserProfileVM;
            return Ok(await _actionPlanService.GetAll(DataID, CommentID, UserID));
        }
        [AllowAnonymous]
        [HttpPost("{DataID}/{CommentID}/{UserID}/{keyword}")]
        [HttpPost("{DataID}/{CommentID}/{UserID}/{keyword}/{page}/{pageSize}")]
        public async Task<IActionResult> GetAllPaging(int DataID, int CommentID, int UserID, string keyword, int? page, int? pageSize)
        {
            //var userprofile = Session["UserProfile"] as UserProfileVM;
            return Ok(await _actionPlanService.GetAll(DataID, CommentID, UserID, keyword, page ?? 1, pageSize ?? 5));
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> GetByID(int id)
        {
            return Ok(await _actionPlanService.GetById(id));
        }
        [HttpPost]
        public async Task<IActionResult> Approval([FromBody]ApprovalDto obj)
        {
            string token = Request.Headers["Authorization"];

            var userID = Extensions.GetDecodeTokenByProperty(token, "nameid").ToInt();

            var model = await _actionPlanService.Approve(obj.id, userID, obj.KPILevelCode, obj.CategoryID);

            await _hubContext.Clients.All.SendAsync("ReceiveMessage", "user", "message");


            if (model.Item1.Count > 0 && await _settingService.IsSendMail("APPROVAL"))
            {
                if(model.Item2 == true)
                {
                    Thread thread = new Thread(async () =>
                    {
                        string URL = _configuaration.GetSection("AppSettings:URL").ToSafetyString();
                        var data = model.Item1.DistinctBy(x => x);
                        string content = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                        <p>The account <b>" + data.First()[0].ToTitleCase() + "</b> approved the action plan <b>'" + data.First()[3] + "'</b> </p>" +
                                        "<p>Link: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>Click Here</a></p>" +
                                        "<br/>" +

                                        @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                        <p>帳號<b>" + data.First()[0].ToTitleCase() + "</b> 已經核准了行動方案 <b>'" + data.First()[3] + "'</b> </p>" +
                                        "<p>連結: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>點選這裡</a></p>"
                                        ;
                        await _mailHelper.SendEmailRange(data.Select(x => x[1]).ToList(), "[KPI System-05] Approved (已核准)", content);
                    });
                    thread.Start();
                }
                else
                {
                    Thread thread = new Thread(async () =>
                    {
                        string URL = _configuaration.GetSection("AppSettings:URL").ToSafetyString();
                        var data = model.Item1.DistinctBy(x => x);
                        string content = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                        <p>The account <b>" + data.First()[0].ToTitleCase() + "</b> not approve the action plan <b>'" + data.First()[3] + "'</b> </p>" +
                                        "<p>Link: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>Click Here</a></p>" +
                                        "<br/>" +

                                        @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                        <p>帳號<b>" + data.First()[0].ToTitleCase() + "</b> 取消核准行動方案 <b>'" + data.First()[3] + "'</b> </p>" +
                                        "<p>連結: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>點選這裡</a></p>"
                                        ;
                        await _mailHelper.SendEmailRange(data.Select(x => x[1]).ToList(), "[KPI System-05] Not Approved", content);
                    });
                    thread.Start();
                }
            }
            return Ok(new { status = true, isSendmail = true });
        }
        [HttpPost]
        public async Task<IActionResult> Done([FromBody]DoneDto obj)
        {

            string token = Request.Headers["Authorization"];
            var userID = Extensions.GetDecodeTokenByProperty(token, "nameid").ToInt();

            var model = await _actionPlanService.Done(obj.id, userID, obj.KPILevelCode, obj.CategoryID);
            await _hubContext.Clients.All.SendAsync("ReceiveMessage", "user", "message");


            if (model.Item1.Count > 0 && await _settingService.IsSendMail("DONE"))
            {
                Thread thread = new Thread(async () =>
                {
                    string URL = _configuaration.GetSection("AppSettings:URL").ToSafetyString();

                    var data = model.Item1.DistinctBy(x => x);
                    string content = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                    <p>The account <b>" + data.First()[0].ToTitleCase() + "</b> has finished the action plan name <b>'" + data.First()[3] + "'</b></p>" +
                                  "<p>Link: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>Click Here</a></p>" + 
                                  "<br/>" +

                                  @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                    <p>帳號 <b>" + data.First()[0].ToTitleCase() + "</b> 已經完成行動方案 <b>'" + data.First()[3] + "'</b></p>" +
                                  "<p>連結: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>點選這裡</a></p>"
                                  ;
                    await _mailHelper.SendEmailRange(data.Select(x => x[1]).ToList(), "[KPI System-04] Action Plan (Finished Task) - 行動方案(任務完成)", content);
                });
                thread.Start();
            }
            return Ok(new { status = model.Item2, isSendmail = true });
        }
        [HttpPost]
        public async Task<IActionResult> AddNotification([FromBody]Notification notification)
        {
            var status = await _notificationService.Add(notification);
            await _hubContext.Clients.All.SendAsync("SendMessage");

            return Ok(status);
        }
        [HttpPost]
        public async Task<IActionResult> UpdateActionPlan([FromBody]ActionPlanForUpdateParams actionPlan)
        {
            return Ok(await _actionPlanService.UpdateActionPlan(actionPlan));
        }
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> UpdateSheduleDate([FromForm]UpdateActionPlanDto obj)
        {

            var model = await _actionPlanService.UpdateSheduleDate2(obj.name, obj.value, obj.pk, obj.userid);
            //var name = obj.name.ToLower();
            if (model.Item1.Count > 0 && obj.name == "Title")
            {
                Thread thread = new Thread(async () =>
                {
                    string URL = _configuaration.GetSection("AppSettings:URL").ToSafetyString();
                    var data = model.Item1.DistinctBy(x => x);
                    string content = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                    <p>The account <b>" + data.First()[0].ToTitleCase() + "</b> changed Title on the task name <b>'" + data.First()[3] + "'</b> </p>" +
                                    "<p>Link: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>Click Here</a></p>" +
                                    "<br/>" +

                                    @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                    <p>帳號<b>" + data.First()[0].ToTitleCase() + "</b> 已經核准了行動方案 <b>'" + data.First()[3] + "'</b> </p>" +
                                    "<p>連結: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>點選這裡</a></p>"
                                    ;
                    await _mailHelper.SendEmailRange(data.Select(x => x[1]).ToList(), "[KPI System-00] Action Plan (Remark on the task) ", content);
                });
                thread.Start();
            }
            if (model.Item1.Count > 0 && obj.name == "Description")
            {
                Thread thread = new Thread(async () =>
                {
                    string URL = _configuaration.GetSection("AppSettings:URL").ToSafetyString();
                    var data = model.Item1.DistinctBy(x => x);
                    string content = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                    <p>The account <b>" + data.First()[0].ToTitleCase() + "</b> changed Description on the task name <b>'" + data.First()[3] + "'</b> </p>" +
                                    "<p>Link: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>Click Here</a></p>" +
                                    "<br/>" +

                                    @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                    <p>帳號<b>" + data.First()[0].ToTitleCase() + "</b> 已經核准了行動方案 <b>'" + data.First()[3] + "'</b> </p>" +
                                    "<p>連結: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>點選這裡</a></p>"
                                    ;
                    await _mailHelper.SendEmailRange(data.Select(x => x[1]).ToList(), "[KPI System-00] Action Plan (Remark on the task) ", content);
                });
                thread.Start();
            }
            if (model.Item1.Count > 0 && obj.name == "Remark")
            {
                Thread thread = new Thread(async () =>
                {
                    string URL = _configuaration.GetSection("AppSettings:URL").ToSafetyString();
                    var data = model.Item1.DistinctBy(x => x);
                    string content = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                    <p>The account <b>" + data.First()[0].ToTitleCase() + "</b> remarked on the task name <b>'" + data.First()[3] + "'</b> </p>" +
                                    "<p>Link: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>Click Here</a></p>" +
                                    "<br/>" +

                                    @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                    <p>帳號<b>" + data.First()[0].ToTitleCase() + "</b> 已經核准了行動方案 <b>'" + data.First()[3] + "'</b> </p>" +
                                    "<p>連結: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>點選這裡</a></p>"
                                    ;
                    await _mailHelper.SendEmailRange(data.Select(x => x[1]).ToList(), "[KPI System-00] Action Plan (Remark on the task) ", content);
                });
                thread.Start();
            }

            if (model.Item1.Count > 0 && obj.name == "UpdateSheduleDate")
            {
                Thread thread = new Thread(async () =>
                {
                    string URL = _configuaration.GetSection("AppSettings:URL").ToSafetyString();
                    var data = model.Item1.DistinctBy(x => x);
                    string content = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                    <p>The account <b>" + data.First()[0].ToTitleCase() + "</b> Change Sheduledate on the task name <b>'" + data.First()[3] + "'</b> </p>" +
                                    "<p>Link: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>Click Here</a></p>" +
                                    "<br/>" +

                                    @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                    <p>帳號<b>" + data.First()[0].ToTitleCase() + "</b> 已經修改了行動方案日期 <b>'" + data.First()[3] + "'</b> </p>" +
                                    "<p>連結: <a href='" + _configuration["AppSettings:URL"] + model.Item3 + "'>點選這裡</a></p>"
                                    ;
                    await _mailHelper.SendEmailRange(data.Select(x => x[1]).ToList(), "[KPI System-05] Change Sheduledate ", content);
                });
                thread.Start();
            }
            return Ok(new { status = model.Item2, isSendmail = true });
            //return Ok(model);
        }

        [HttpPost("{id}")]
        public async Task<ActionResult> DeleteComment(int id)
        {
            string token = Request.Headers["Authorization"];
            var userID = Extensions.GetDecodeTokenByProperty(token, "nameid").ToInt();
            return Ok(await _commentService.DeleteComment(id, userID));
        }
        [AllowAnonymous]
        [HttpPut("{commentid}")]
        public async Task<IActionResult> Pin(int commentid)
        {
            string token = Request.Headers["Authorization"];
            var userID = Extensions.GetDecodeTokenByProperty(token, "nameid").ToInt();
            var model = await _commentService.Pin(commentid, userID);
            return Ok(model);
        }
        [AllowAnonymous]
        [HttpPut("{id}")]
        public async Task<IActionResult> Unpin(int id)
        {
            var model = await _commentService.Unpin(id);
            return Ok(model);
        }
        [AllowAnonymous]
        [HttpPost("{code}")]
        [HttpPost("{code}/{page}/{pageSize}")]
        public async Task<ActionResult> ListTasks(string code, int? page, int? pageSize)
        {
            var pagedList = await _dataService.ListTasks(code, page, pageSize);
            return Ok(new
            {
                data = pagedList,
                total = pagedList.Count,
                pageCount = pagedList.TotalPages,
                status = true,
                page,
                pageSize
            });
        }


        //public async Task<IActionResult> GetAllDataByCategory(int catid, string period, int? year)
        //{
        //    var currenYear = year ?? DateTime.Now.Year;
        //    return Ok(new DataChartDAO().GetAllDataByCategory(catid, period, currenYear));

        //}
    }
}