using Models.Data;
using Models.EF;
using Models.ViewModels.ActionPlan;
using Models.ViewModels.Comment;
using Models.ViewModels.User;
using Microsoft.EntityFrameworkCore;
using Service.Helpers;
using Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using System.Threading;
using Service.SignalR;
using Models.ViewModels.Category;
using Microsoft.AspNetCore.SignalR;
using Microsoft.AspNetCore.Http;
using System.IO;

namespace Service.Implementation
{

    public class ActionPlanService : IActionPlanService
    {
        private readonly DataContext _dbContext;
        private readonly IErrorMessageService _errorService;
        private readonly IDataService _dataService;
        private readonly INotificationService _notificationService;
        private readonly ILevelService _levelService;
        private readonly ISettingService _settingService;
        private readonly IHubContext<HenryHub> _hubContext;
        private readonly IMailExtension _mailHelper;
        public ActionPlanService(DataContext dbContext,
            IErrorMessageService errorService,
            IHubContext<HenryHub> hubContext,
            IDataService dataService,
            INotificationService notificationService,
            ISettingService settingService,
            IMailExtension mailHelper,
            ILevelService levelService)
        {
            _dbContext = dbContext;
            _errorService = errorService;
            _dataService = dataService;
            _settingService = settingService;
            _mailHelper = mailHelper;
            _hubContext = hubContext;
            _notificationService = notificationService;
            _levelService = levelService;
        }
        /// <summary>
        /// Khi thêm 1 comment nếu tag nhiều user thì lưu vào bảng Tag đồng thời lưu vào bảng Notification để thông báo đẩy
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="subject"></param>
        /// <param name="auditor"></param>
        /// <returns></returns>

        public async Task<bool> UploadFile(List<UploadFile> entity)
        {
            var ListUpload = new List<UploadFile>();
            foreach (var item in entity)
            {
                ListUpload.Add(new UploadFile
                {
                    ActionPlanID = item.ActionPlanID,
                    UploadBy = item.UploadBy,
                    Name = item.Name
                });
            }
            try
            {
                _dbContext.UploadFiles.AddRange(ListUpload);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }


            throw new NotImplementedException();
        }
        public async  Task<object> GetFileUpload(int actionPlanID)
        {
            return  _dbContext.UploadFiles.Where(x => x.ActionPlanID == actionPlanID).DistinctBy(x => x.Name).ToList();
        }
        public async Task<CommentForReturnViewModel> Add(ActionPlanParams obj)//(ActionPlan entity, string subject, string auditor,int catid)
        {
            var subject = obj.Subject;
            var auditor = obj.Auditor;
            var kpilevelcode = obj.KPILevelCode;
            var catid = obj.CategoryID;
            var flag = new bool();
            string queryString = string.Empty;
            var kpilevelModel = await _dbContext.KPILevels.FirstOrDefaultAsync(x => x.KPILevelCode == kpilevelcode);
            var DefaultLink = obj.DefaultLink;

            if (kpilevelModel == null)
                return new CommentForReturnViewModel
                {
                    Status = false,
                    ListEmails = new List<string[]>(),
                    Message = "Error!",
                };

            //Bước 1: Kiem tra neu la owner thi moi cho add task(actionPlan)
            if (await _dbContext.Owners.FirstOrDefaultAsync(x => x.CategoryID == catid && x.UserID == obj.OwnerID && x.KPILevelID == kpilevelModel.ID) == null)
                return new CommentForReturnViewModel
                {
                    Status = false,
                    ListEmails = new List<string[]>(),
                    Message = "You are not Owner of this KPI.",
                };
            else
            {
                var title = Regex.Replace(subject.Split('-')[0].ToSafetyString(), @"\s+", "-");
                var entity = new ActionPlan();
                entity.Name = subject;
                entity.Title = obj.Title;
                entity.Description = obj.Description;
                entity.KPILevelCodeAndPeriod = obj.KPILevelCodeAndPeriod;
                entity.KPILevelCode = obj.KPILevelCode;
                entity.KPILevelID = obj.KPILevelID;
                entity.Tag = obj.Tag;
                entity.UserID = obj.UserID;
                entity.DataID = obj.DataID;
                entity.Name = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpilevelModel.KPIID)?.Name ?? obj.Title.ToSafetyString().Split('-')[2];
                entity.CommentID = obj.CommentID;
                entity.SubmitDate = obj.SubmitDate.ToDateTime();
                entity.Deadline = obj.Deadline.ToDateTime();

                //+) Gắn thêm link để chuyển đến trang Chartperiod sau đó hiện model
                if (!obj.Link.Contains("title"))
                {
                    var qrlink = obj.Link.Split('#').First();
                    entity.Link = DefaultLink + $"/task/{obj.CommentID}/{obj.DataID}/{title}";
                    //entity.Link = qrlink + $"/task/{obj.CommentID}/{obj.DataID}/{title}";
                    queryString = qrlink + '#' + entity.Link;
                }
                else
                {
                    if (obj.Link.Contains("remark"))
                        entity.Link = obj.Link.Split('#').Last().Replace("remark", "task");
                    else
                        entity.Link = obj.Link;

                }
             
                //+) Khai báo biến
                var user = _dbContext.Users;
                var listAuditor = new List<ActionPlanDetail>();
                var listEmail = new List<string[]>();
                var listEmailsForAuditor = new List<string[]>();

                var listUserID = new List<int>();
                var listFullNameTag = new List<string>();
                var listTags = new List<Tag>();
                var itemTag = _dbContext.Tags;
                var listNotificationDetail = new List<NotificationDetail>();

                var listUserForAuditor = new List<UserViewModel>();
                var listUserForPIC = new List<UserViewModel>();

                var listAuditors = new List<int>();
                var listPIC = new List<int>();
                try
                {
                    entity.Description = obj.Description;

                    //Bước 2: Thêm mới ActionPlan (Task)
                    _dbContext.ActionPlans.Add(entity);
                    await _dbContext.SaveChangesAsync();

                    //Bước 3: Thông báo đến user đc chỉ định làm Auditor và PIC trong Task
                    if (!auditor.IsNullOrEmpty())
                    {
                        //Nếu chỉ có 1 auditor
                        //Thêm vào bảng ActionPkanDetail
                        if (auditor.IndexOf(",") == -1)
                        {
                            var userResult = await _dbContext.Users.FirstOrDefaultAsync(x => x.Alias == auditor);
                            listUserForAuditor.Add(new UserViewModel { ID = userResult.ID, Email = userResult.Email });

                            entity.Auditor = userResult.ID;

                            _dbContext.ActionPlanDetails.Add(new ActionPlanDetail
                            {
                                ActionPlanID = entity.ID,
                                UserID = userResult.ID

                            });
                            //Add vao list de kiem tra PIC va Auditor
                            listAuditors.Add(userResult.ID);

                            //Thêm vào list Email để gửi mail

                            listFullNameTag.Add(userResult.FullName);
                            listEmailsForAuditor.Add(new string[5] {
                                user.FirstOrDefault(x => x.ID == entity.UserID).FullName,
                                userResult.Email,
                                entity.Link,
                                entity.Title,
                                entity.Description
                            });
                        }
                        else//add nhiều auditor
                        {
                            var list = auditor.Split(',');
                            var listUsers = await _dbContext.Users.Where(x => list.Contains(x.Alias))
                                .ToListAsync();
                            foreach (var item in listUsers)
                            {
                                listUserForAuditor.Add(new UserViewModel { ID = item.ID, Email = item.Email });
                                listAuditor.Add(new ActionPlanDetail
                                {
                                    ActionPlanID = entity.ID,
                                    UserID = item.ID

                                });
                                listEmailsForAuditor.Add(new string[5] {
                                    user.FirstOrDefault(x => x.ID == entity.UserID).FullName,
                                    item.Email,
                                    entity.Link,
                                    entity.Title,
                                    entity.Description
                                });
                                listFullNameTag.Add(item.FullName);
                            }
                            //Add vao list de kiem tra PIC va Auditor
                            listAuditors.AddRange(listUsers.Select(x => x.ID));

                            _dbContext.ActionPlanDetails.AddRange(listAuditor);
                        }
                    }
                    //Kiểm tra Tag (PIC)
                    if (!entity.Tag.IsNullOrEmpty())
                    {


                        if (entity.Tag.IndexOf(",") == -1)
                        {
                            var userItem = await user.FirstOrDefaultAsync(x => x.Alias == entity.Tag);
                            listUserForPIC.Add(new UserViewModel { ID = userItem.ID, Email = userItem.Email });

                            if (userItem != null)
                            {
                                //Add vao list de kiem tra PIC va Auditor
                                listPIC.Add(userItem.ID);

                                _dbContext.Tags.Add(new Tag { ActionPlanID = entity.ID, UserID = userItem.ID });

                                //Thêm vào list Email để gửi mail
                                listEmail.Add(new string[5] {
                                    user.FirstOrDefault(x => x.ID == entity.UserID).FullName,
                                    userItem.Email,
                                    entity.Link,
                                    entity.Title,
                                    entity.Description
                                });
                                listFullNameTag.Add(userItem.FullName);
                            }
                        }
                        else
                        {
                            var list = entity.Tag.Split(',');
                            var listUsers = await _dbContext.Users.Where(x => list.Contains(x.Alias)).ToListAsync();
                            foreach (var item in listUsers)
                            {
                                listUserForPIC.Add(new UserViewModel { ID = item.ID, Email = item.Email });
                                listTags.Add(new Tag { ActionPlanID = entity.ID, UserID = item.ID });

                                //Thêm vào list Email để gửi mail
                                listEmail.Add(new string[5] {
                                    user.FirstOrDefault(x => x.ID == entity.UserID).FullName,
                                    item.Email,
                                    entity.Link,
                                    entity.Title,
                                    entity.Description
                                });
                                listFullNameTag.Add(item.FullName);
                            }
                            //Add vao list de kiem tra PIC va Auditor
                            listPIC.AddRange(listUsers.Select(x => x.ID));
                            //Lưu db
                            _dbContext.Tags.AddRange(listTags);
                        }
                    }

                    //Kiểm tra nếu PIC trùng với Auditor

                    foreach (var pic in listPIC)
                    {
                        if (listAuditors.Contains(pic))
                            flag = true;
                    }

                    if (flag)
                    {
                        _dbContext.ActionPlans.Remove(_dbContext.ActionPlans.Find(entity.ID));
                        //_dbContext.ActionPlanDetails.RemoveRange(_dbContext.ActionPlanDetails.Where(x => x.ActionPlanID == entity.ID));
                        //_dbContext.Tags.RemoveRange(_dbContext.Tags.Where(x => x.ActionPlanID == entity.ID));
                        await _dbContext.SaveChangesAsync();
                        return new CommentForReturnViewModel
                        {
                            Status = false,
                            ListEmails = new List<string[]>(),
                            Message = "Warning! PIC and Auditor can not same!",
                        };
                    }
                    else
                    {
                        await _dbContext.SaveChangesAsync();


                        //BƯớc 4: Thêm mới Notification

                        var notifyAuditor = await CreateNotification(new Notification
                        {
                            ActionplanID = entity.ID,
                            Content = entity.Description,
                            UserID = entity.UserID,
                            KPIName = entity.Name,
                            Link = entity.Link,
                            Tag = string.Join(",", listFullNameTag),
                            Title = subject,
                            Action = "Task-Auditor",
                            TaskName = entity.Title
                        });

                        var notifyPIC = await CreateNotification(new Notification
                        {
                            ActionplanID = entity.ID,
                            Content = entity.Description,
                            UserID = entity.UserID,
                            KPIName = entity.Name,
                            Link = entity.Link,
                            Tag = string.Join(",", listFullNameTag),
                            Title = subject,
                            Action = "Task",
                            TaskName = entity.Title
                        });
                        foreach (var item in listUserForPIC)
                        {
                            //Thêm vào chi tiết thông báo
                            listNotificationDetail.Add(new NotificationDetail
                            {
                                UserID = item.ID,
                                Seen = false,
                                URL = notifyPIC.Link,
                                NotificationID = notifyPIC.ID
                            });

                        }
                        foreach (var item in listUserForAuditor)
                        {
                            //Thêm vào chi tiết thông báo
                            listNotificationDetail.Add(new NotificationDetail
                            {
                                UserID = item.ID,
                                Seen = false,
                                URL = notifyAuditor.Link,
                                NotificationID = notifyAuditor.ID
                            });

                        }
                        //Lưu Db
                        _dbContext.NotificationDetails.AddRange(listNotificationDetail);
                        await _dbContext.SaveChangesAsync();

                        if (listEmail.Count > 0 && await _settingService.IsSendMail("ADDTASK"))
                        {

                            string contentForPIC = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                            <p>The account <b>" + listEmail.First()[0].ToTitleCase() + "</b> assigned a action plan to you in KPI System App. </p>" +
                                            "<p>Action plan name : <b>" + listEmail.First()[3] + "</b></p>" +
                                            "<p>Description : " + listEmail.First()[4] + "</p>" +
                                            "<p>Link: <a href='" + queryString + "'>Click Here</a></p>" + 
                                            "<br/>" +

                                            @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                            <p>帳號 <b>" + listEmail.First()[0].ToTitleCase() + "</b> 在KPI系統指派您一項行動方案任務. </p>" +
                                            "<p>任務名稱 : <b>" + listEmail.First()[3] + "</b></p>" +
                                            "<p>描述 : " + listEmail.First()[4] + "</p>" +
                                            "<p>連結: <a href='" + queryString + "'>點選這裡</a></p>"
                                            ;

                            string contentAuditor = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                            <p>The account <b>" + listEmailsForAuditor.First()[0].ToTitleCase() + "</b> created a new action plan ,assigned you are an auditor in KPI System App. </p>" +
                                            "<p>Action plan name : <b>" + listEmailsForAuditor.First()[3] + "</b></p>" +
                                            "<p>Description : " + listEmailsForAuditor.First()[4] + "</p>" +
                                            "<p>Link: <a href='" + queryString + "'>Click Here</a></p>" + 
                                            "<br/>" +

                                            @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                            <p>帳號 <b>" + listEmailsForAuditor.First()[0].ToTitleCase() + "</b> 在KPI系統增加一項行動方案任務，並且請您擔任稽核者。. </p>" +
                                            "<p>任務名稱 : <b>" + listEmailsForAuditor.First()[3] + "</b></p>" +
                                            "<p>描述 : " + listEmailsForAuditor.First()[4] + "</p>" +
                                            "<p>連結: <a href='" + queryString + "'>點選這裡</a></p>"
                                            ;
                            Thread thread = new Thread(async () =>
                            {
                                await _mailHelper.SendEmailRange(listEmail.Select(x => x[1]).ToList(), "[KPI System-03] Action Plan (Add Action plan - Assign Auditor) - 行動方案(增加任務-稽核者)", contentAuditor);
                            });
                            Thread thread2 = new Thread(async () =>
                            {
                                await _mailHelper.SendEmailRange(listEmail.Select(x => x[1]).ToList(), "[KPI System-03] Action Plan (Add Action plan) - 行動方案(增加任務)", contentForPIC);
                            });
                            thread.Start();
                            thread2.Start();
                        }
                    }
                    return new CommentForReturnViewModel
                    {
                        Status = true,
                        ListEmails = listEmail,
                        ListEmailsForAuditor = listEmailsForAuditor,
                        QueryString = entity.Link
                    };
                }
                catch (Exception ex)
                {
                    var message = ex.Message;
                    return new CommentForReturnViewModel
                    {
                        Status = false,
                        ListEmails = listEmail
                    };
                }
            }


        }

        public async Task<CommentForReturnViewModel> AddActionPlanFormData(ActionPlanParams obj)
        {
            var subject = obj.Subject;
            var auditor = obj.Auditor;
            var kpilevelcode = obj.KPILevelCode;
            var catid = obj.CategoryID;
            var flag = new bool();
            string queryString = string.Empty;
            var kpilevelModel = await _dbContext.KPILevels.FirstOrDefaultAsync(x => x.KPILevelCode == kpilevelcode);
            var DefaultLink = obj.DefaultLink;
            if (kpilevelModel == null)
                return new CommentForReturnViewModel
                {
                    Status = false,
                    ListEmails = new List<string[]>(),
                    Message = "Error!",
                };

            //Bước 1: Kiem tra neu la owner thi moi cho add task(actionPlan)
            if (await _dbContext.Owners.FirstOrDefaultAsync(x => x.CategoryID == catid && x.UserID == obj.OwnerID && x.KPILevelID == kpilevelModel.ID) == null)
                return new CommentForReturnViewModel
                {
                    Status = false,
                    ListEmails = new List<string[]>(),
                    Message = "You are not Owner of this KPI.",
                };
            else
            {
                var title = Regex.Replace(subject.Split('-')[0].ToSafetyString(), @"\s+", "-");
                var entity = new ActionPlan();
                entity.Name = subject;
                entity.Title = obj.Title;
                entity.Description = obj.Description;
                entity.KPILevelCodeAndPeriod = obj.KPILevelCodeAndPeriod;
                entity.KPILevelCode = obj.KPILevelCode;
                entity.KPILevelID = obj.KPILevelID;
                entity.Tag = obj.Tag;
                entity.UserID = obj.UserID;
                entity.DataID = obj.DataID;
                entity.Name = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpilevelModel.KPIID)?.Name ?? obj.Title.ToSafetyString().Split('-')[2];
                entity.CommentID = obj.CommentID;
                entity.SubmitDate = obj.SubmitDate.ToDateTime();
                entity.Deadline = obj.Deadline.ToDateTime();
                entity.FileName = obj.FileName;

                //+) Gắn thêm link để chuyển đến trang Chartperiod sau đó hiện model
                if (!obj.Link.Contains("title"))
                {
                    var qrlink = obj.Link.Split('#').First();
                    entity.Link = DefaultLink + $"/task/{obj.CommentID}/{obj.DataID}/{title}";
                    //entity.Link = qrlink + $"/task/{obj.CommentID}/{obj.DataID}/{title}";
                    queryString = qrlink + '#' + entity.Link;
                }
                else
                {
                    if (obj.Link.Contains("remark"))
                        entity.Link = obj.Link.Split('#').Last().Replace("remark", "task");
                    else
                        entity.Link = obj.Link;

                }

                //+) Khai báo biến
                var user = _dbContext.Users;
                var listAuditor = new List<ActionPlanDetail>();
                var listEmail = new List<string[]>();
                var listEmailsForAuditor = new List<string[]>();

                var listUserID = new List<int>();
                var listFullNameTag = new List<string>();
                var listTags = new List<Tag>();
                var itemTag = _dbContext.Tags;
                var listNotificationDetail = new List<NotificationDetail>();

                var listUserForAuditor = new List<UserViewModel>();
                var listUserForPIC = new List<UserViewModel>();

                var listAuditors = new List<int>();
                var listPIC = new List<int>();
                try
                {
                    entity.Description = obj.Description;

                    //Bước 2: Thêm mới ActionPlan (Task)
                    _dbContext.ActionPlans.Add(entity);
                    await _dbContext.SaveChangesAsync();

                    //Bước 3: Thông báo đến user đc chỉ định làm Auditor và PIC trong Task
                    if (!auditor.IsNullOrEmpty())
                    {
                        //Nếu chỉ có 1 auditor
                        //Thêm vào bảng ActionPkanDetail
                        if (auditor.IndexOf(",") == -1)
                        {
                            var userResult = await _dbContext.Users.FirstOrDefaultAsync(x => x.Alias == auditor);
                            listUserForAuditor.Add(new UserViewModel { ID = userResult.ID, Email = userResult.Email });

                            entity.Auditor = userResult.ID;

                            _dbContext.ActionPlanDetails.Add(new ActionPlanDetail
                            {
                                ActionPlanID = entity.ID,
                                UserID = userResult.ID

                            });
                            //Add vao list de kiem tra PIC va Auditor
                            listAuditors.Add(userResult.ID);

                            //Thêm vào list Email để gửi mail

                            listFullNameTag.Add(userResult.FullName);
                            listEmailsForAuditor.Add(new string[5] {
                                user.FirstOrDefault(x => x.ID == entity.UserID).FullName,
                                userResult.Email,
                                entity.Link,
                                entity.Title,
                                entity.Description
                            });
                        }
                        else//add nhiều auditor
                        {
                            var list = auditor.Split(',');
                            var listUsers = await _dbContext.Users.Where(x => list.Contains(x.Alias))
                                .ToListAsync();
                            foreach (var item in listUsers)
                            {
                                listUserForAuditor.Add(new UserViewModel { ID = item.ID, Email = item.Email });
                                listAuditor.Add(new ActionPlanDetail
                                {
                                    ActionPlanID = entity.ID,
                                    UserID = item.ID

                                });
                                listEmailsForAuditor.Add(new string[5] {
                                    user.FirstOrDefault(x => x.ID == entity.UserID).FullName,
                                    item.Email,
                                    entity.Link,
                                    entity.Title,
                                    entity.Description
                                });
                                listFullNameTag.Add(item.FullName);
                            }
                            //Add vao list de kiem tra PIC va Auditor
                            listAuditors.AddRange(listUsers.Select(x => x.ID));

                            _dbContext.ActionPlanDetails.AddRange(listAuditor);
                        }
                    }
                    //Kiểm tra Tag (PIC)
                    if (!entity.Tag.IsNullOrEmpty())
                    {


                        if (entity.Tag.IndexOf(",") == -1)
                        {
                            var userItem = await user.FirstOrDefaultAsync(x => x.Alias == entity.Tag);
                            listUserForPIC.Add(new UserViewModel { ID = userItem.ID, Email = userItem.Email });

                            if (userItem != null)
                            {
                                //Add vao list de kiem tra PIC va Auditor
                                listPIC.Add(userItem.ID);

                                _dbContext.Tags.Add(new Tag { ActionPlanID = entity.ID, UserID = userItem.ID });

                                //Thêm vào list Email để gửi mail
                                listEmail.Add(new string[5] {
                                    user.FirstOrDefault(x => x.ID == entity.UserID).FullName,
                                    userItem.Email,
                                    entity.Link,
                                    entity.Title,
                                    entity.Description
                                });
                                listFullNameTag.Add(userItem.FullName);
                            }
                        }
                        else
                        {
                            var list = entity.Tag.Split(',');
                            var listUsers = await _dbContext.Users.Where(x => list.Contains(x.Alias)).ToListAsync();
                            foreach (var item in listUsers)
                            {
                                listUserForPIC.Add(new UserViewModel { ID = item.ID, Email = item.Email });
                                listTags.Add(new Tag { ActionPlanID = entity.ID, UserID = item.ID });

                                //Thêm vào list Email để gửi mail
                                listEmail.Add(new string[5] {
                                    user.FirstOrDefault(x => x.ID == entity.UserID).FullName,
                                    item.Email,
                                    entity.Link,
                                    entity.Title,
                                    entity.Description
                                });
                                listFullNameTag.Add(item.FullName);
                            }
                            //Add vao list de kiem tra PIC va Auditor
                            listPIC.AddRange(listUsers.Select(x => x.ID));
                            //Lưu db
                            _dbContext.Tags.AddRange(listTags);
                        }
                    }

                    //Kiểm tra nếu PIC trùng với Auditor
                    await _dbContext.SaveChangesAsync();


                    //BƯớc 4: Thêm mới Notification

                    var notifyAuditor = await CreateNotification(new Notification
                    {
                        ActionplanID = entity.ID,
                        Content = entity.Description,
                        UserID = entity.UserID,
                        KPIName = entity.Name,
                        Link = entity.Link,
                        Tag = string.Join(",", listFullNameTag),
                        Title = subject,
                        Action = "Task-Auditor",
                        TaskName = entity.Title
                    });

                    var notifyPIC = await CreateNotification(new Notification
                    {
                        ActionplanID = entity.ID,
                        Content = entity.Description,
                        UserID = entity.UserID,
                        KPIName = entity.Name,
                        Link = entity.Link,
                        Tag = string.Join(",", listFullNameTag),
                        Title = subject,
                        Action = "Task",
                        TaskName = entity.Title
                    });
                    foreach (var item in listUserForPIC)
                    {
                        //Thêm vào chi tiết thông báo
                        listNotificationDetail.Add(new NotificationDetail
                        {
                            UserID = item.ID,
                            Seen = false,
                            URL = notifyPIC.Link,
                            NotificationID = notifyPIC.ID
                        });

                    }
                    foreach (var item in listUserForAuditor)
                    {
                        //Thêm vào chi tiết thông báo
                        listNotificationDetail.Add(new NotificationDetail
                        {
                            UserID = item.ID,
                            Seen = false,
                            URL = notifyAuditor.Link,
                            NotificationID = notifyAuditor.ID
                        });

                    }
                    //Lưu Db
                    _dbContext.NotificationDetails.AddRange(listNotificationDetail);
                    await _dbContext.SaveChangesAsync();

                    if (listEmail.Count > 0 && await _settingService.IsSendMail("ADDTASK"))
                    {

                        string contentForPIC = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                            <p>The account <b>" + listEmail.First()[0].ToTitleCase() + "</b> assigned a action plan to you in KPI System App. </p>" +
                                        "<p>Action plan name : <b>" + listEmail.First()[3] + "</b></p>" +
                                        "<p>Description : " + listEmail.First()[4] + "</p>" +
                                        "<p>Link: <a href='" + queryString + "'>Click Here</a></p>" +
                                        "<br/>" +

                                        @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                            <p>帳號 <b>" + listEmail.First()[0].ToTitleCase() + "</b> 在KPI系統指派您一項行動方案任務. </p>" +
                                        "<p>任務名稱 : <b>" + listEmail.First()[3] + "</b></p>" +
                                        "<p>描述 : " + listEmail.First()[4] + "</p>" +
                                        "<p>連結: <a href='" + queryString + "'>點選這裡</a></p>"
                                        ;

                        string contentAuditor = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p> 
                                            <p>The account <b>" + listEmailsForAuditor.First()[0].ToTitleCase() + "</b> created a new action plan ,assigned you are an auditor in KPI System App. </p>" +
                                        "<p>Action plan name : <b>" + listEmailsForAuditor.First()[3] + "</b></p>" +
                                        "<p>Description : " + listEmailsForAuditor.First()[4] + "</p>" +
                                        "<p>Link: <a href='" + queryString + "'>Click Here</a></p>" +
                                        "<br/>" +

                                        @"<p><b>*請勿回信*這封信是KPI系統自動寄出.</b></p> 
                                            <p>帳號 <b>" + listEmailsForAuditor.First()[0].ToTitleCase() + "</b> 在KPI系統增加一項行動方案任務，並且請您擔任稽核者。. </p>" +
                                        "<p>任務名稱 : <b>" + listEmailsForAuditor.First()[3] + "</b></p>" +
                                        "<p>描述 : " + listEmailsForAuditor.First()[4] + "</p>" +
                                        "<p>連結: <a href='" + queryString + "'>點選這裡</a></p>"
                                        ;
                        Thread thread = new Thread(async () =>
                        {
                            await _mailHelper.SendEmailRange(listEmail.Select(x => x[1]).ToList(), "[KPI System-03] Action Plan (Add Action plan - Assign Auditor) - 行動方案(增加任務-稽核者)", contentAuditor);
                        });
                        Thread thread2 = new Thread(async () =>
                        {
                            await _mailHelper.SendEmailRange(listEmail.Select(x => x[1]).ToList(), "[KPI System-03] Action Plan (Add Action plan) - 行動方案(增加任務)", contentForPIC);
                        });
                        thread.Start();
                        thread2.Start();
                    }
                    //foreach (var pic in listPIC)
                    //{
                    //    if (listAuditors.Contains(pic))
                    //        flag = true;
                    //}

                    //if (flag)
                    //{
                    //    _dbContext.ActionPlans.Remove(_dbContext.ActionPlans.Find(entity.ID));
                    //    //_dbContext.ActionPlanDetails.RemoveRange(_dbContext.ActionPlanDetails.Where(x => x.ActionPlanID == entity.ID));
                    //    //_dbContext.Tags.RemoveRange(_dbContext.Tags.Where(x => x.ActionPlanID == entity.ID));
                    //    await _dbContext.SaveChangesAsync();
                    //    return new CommentForReturnViewModel
                    //    {
                    //        Status = false,
                    //        ListEmails = new List<string[]>(),
                    //        Message = "Warning! PIC and Auditor can not same!",
                    //    };
                    //}
                    //else
                    //{

                    //}
                    return new CommentForReturnViewModel
                    {
                        Status = true,
                        ListEmails = listEmail,
                        ListEmailsForAuditor = listEmailsForAuditor,
                        QueryString = entity.Link
                    };
                }
                catch (Exception ex)
                {
                    var message = ex.Message;
                    return new CommentForReturnViewModel
                    {
                        Status = false,
                        ListEmails = listEmail
                    };
                }
            }


        }

        public Task<bool> Add(ActionPlan entity)
        {
            throw new NotImplementedException();
        }

        public async Task<Tuple<List<string[]>, bool, string>> Approve(int id, int aproveBy, string KPILevelCode, int CategoryID)
        {
            var listTags = new List<Tag>();
            var listEmail = new List<string[]>();
            var listuserChecking = new List<int>();

            var user = _dbContext.Users;
            var model = await _dbContext.ActionPlans.FirstOrDefaultAsync(x => x.ID == id);
            var userTags = _dbContext.Tags.Where(x => x.ActionPlanID == model.ID).Select(x => x.UserID);
            //var userAuditors = _dbContext.Tags.Where(x => x.ActionPlanID == model.ID).Select(x => x.UserID);
            var listDetails = new List<NotificationDetail>();
            listuserChecking.Add(model.Auditor);
            listuserChecking.Add(model.UserID);

            //Kiểm tra nếu là người tạo hoặc auditor thì mới dc aprove
            if (!listuserChecking.Contains(aproveBy))
            {
                return Tuple.Create(new List<string[]>(), false, "");
            }
            model.ApprovedBy = aproveBy;
            model.ApprovedStatus = !model.ApprovedStatus;
            model.ActualFinishDate = DateTime.Now;
            if(model.ApprovedStatus == false)
            {
                model.ApprovedBy = 0;
                model.ActualFinishDate = null;
            }
            try
            {
                await _dbContext.SaveChangesAsync();
                //Add vao Notification
                //Bước 1: Tìm tất cả user đã được tag khi tạo actionPlan de gui mail
                var tags = await _dbContext.Tags.Where(x => x.ActionPlanID == model.ID).ToListAsync();
                foreach (var tag in tags)
                {
                    string[] arrayString = new string[5];
                    arrayString[0] = user.Find(aproveBy).Alias; //Bi danh
                    arrayString[1] = user.Find(tag.UserID).Email;
                    arrayString[2] = "Approve Task";
                    arrayString[3] = model.Title;
                    listEmail.Add(arrayString);
                }
                //await _dbContext.SaveChangesAsync();
                var notify = new Notification();
                notify.ActionplanID = model.ID;
                notify.Content = model.Description;
                notify.UserID = aproveBy; //Nguoi xet duyet
                notify.Title = model.Title;
                notify.Link = model.Link.Split('#').Last();
                notify.KPIName = model.Name ?? model.Title.ToSafetyString().Split('-')[2];
                notify.TaskName = model.Title;

                if (model.Status == false && model.ApprovedStatus == false)
                {
                    notify.Action = "UpdateApproval";
                }
                else
                {
                    notify.Action = "Approval";
                }
                //Add vao Notification
                var notify2 = await CreateNotification(notify);
                foreach (var item in userTags)
                {
                    listDetails.Add(new NotificationDetail
                    {
                        UserID = item,
                        Seen = false,
                        URL = notify2.Link,
                        NotificationID = notify2.ID
                    });
                }
                _dbContext.NotificationDetails.AddRange(listDetails);
                await _dbContext.SaveChangesAsync();
                return Tuple.Create(listEmail, model.ApprovedStatus, model.Link);
            }
            catch (Exception ex)
            {
                //logger
                await _errorService.Add(new ErrorMessage { Name = ex.Message, Function = "Approval" });
                return Tuple.Create(new List<string[]>(), true, "");
            }
            
        }

        public Task<List<ActionPlan>> GetAllById(int Id)
        {
            return _dbContext.ActionPlans.Where(x => x.ID == Id).ToListAsync();
        }
        public Task<List<ActionPlan>> GetAll()
        {
            return _dbContext.ActionPlans.ToListAsync();
        }
        public async Task<PagedList<ActionPlan>> GetAllPaging(string keyword, int page, int pageSize)
        {
            var source = _dbContext.ActionPlans.AsQueryable();
            if (!keyword.IsNullOrEmpty())
            {
                source = source.Where(x => x.Title.Contains(keyword));
            }
            return await PagedList<ActionPlan>.CreateAsync(source, page, pageSize);

        }
        public async Task<object> GetAll(int DataID, int CommentID, int userid)
        {
            var userModel = await _dbContext.Users.FirstOrDefaultAsync(x => x.ID == userid);
            var data = await _dbContext.ActionPlans
                .Where(x => x.DataID == DataID && x.CommentID == CommentID)
                .Select(x => new
                {
                    x.ID,
                    x.Title,
                    x.Description,
                    x.Tag,
                    x.ApprovedStatus,
                    x.Deadline,
                    x.UpdateSheduleDate,
                    x.ActualFinishDate,
                    x.Status,
                    x.UserID,
                    IsBoss = (int?)_dbContext.Roles.FirstOrDefault(a => a.ID == userModel.Role).ID < 2 ? true : false,
                    CreatedBy = x.UserID,
                    x.Auditor,
                    ApprovedByName = x.ApprovedBy,
                    x.CreateTime
                })
                .ToListAsync();
            var model = data
            .Select(x => new ActionPlanForChart
            {
                ID = x.ID,
                Title = x.Title,
                Description = x.Description,
                Tag = x.Tag,
                ApprovedStatus = x.ApprovedStatus,
                Deadline = x.Deadline.ToString("MM-dd-yyyy"),
                UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("MM/dd/yyyy") : "N/A",
                ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("MM/dd/yyyy") : "N/A",
                Status = x.Status,
                IsBoss = x.IsBoss,
                CreatedBy = x.UserID,
                ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                Auditor = x.Auditor,
                ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                ApprovedByNames = _dbContext.Users.Find(x.ApprovedByName).Alias ?? "#N/A",
                CreatedTime = x.CreateTime
            }).ToList();
            return new
            {
                status = true,
                data = model,

            };
        }
        public async Task<object> GetAll(int DataID, int CommentID, int userid, string keyword, int page, int pageSize)
        {
            var userModel = await _dbContext.Users.FirstOrDefaultAsync(x => x.ID == userid);
            var data = await _dbContext.ActionPlans
                .Where(x => x.DataID == DataID && x.CommentID == CommentID)
                .Select(x => new
                {
                    x.ID,
                    x.Title,
                    x.Description,
                    x.Tag,
                    x.ApprovedStatus,
                    x.Deadline,
                    x.UpdateSheduleDate,
                    x.ActualFinishDate,
                    x.Status,
                    x.UserID,
                    IsBoss = (int?)_dbContext.Roles.FirstOrDefault(a => a.ID == userModel.Permission).ID < 3 ? true : false,
                    CreatedBy = x.UserID,
                    x.Auditor,
                    x.ApprovedBy,
                    ApprovedByName = _dbContext.Users.FirstOrDefault(a => a.ID == x.ApprovedBy).Alias ?? "#N/A",
                    x.CreateTime,
                    Remark = x.Remark ?? "#N/A",
                    x.FileName,
                    RootCause = _dbContext.Comments.FirstOrDefault(a => a.ID == x.CommentID).CommentMsg

                })
                .ToListAsync();
            var model = data
            .Select(x => new ActionPlanForChart
            {
                ID = x.ID,
                Title = x.Title,
                Description = x.Description,
                Tag = x.Tag,
                ApprovedStatus = x.ApprovedStatus,
                ApprovedStatus2 = x.ApprovedStatus ? "Yes" : "No",
                Deadline = x.Deadline.ToString("dddd, MMMM d, yyyy"),
                UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                Status = x.Status,
                Status2 = x.Status ? "Yes" : "No",
                IsBoss = x.IsBoss,
                CreatedBy = x.UserID,
                ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                Auditor = x.Auditor,
                ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                Remark = x.Remark,
                CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                ApprovedByNames = x.ApprovedByName,
                CreatedTime = x.CreateTime,
                FileName = x.FileName,
                RootCause = x.RootCause

            }).ToList();

            int total = model.Count();
            if (!keyword.IsNullOrEmpty())
            {
                model = model.Where(x => x.Title.Contains(keyword)
                                        || x.Description.Contains(keyword)
                                        || x.CreatedByName.Contains(keyword)
                                        || x.Tag.Contains(keyword)).ToList();
            }
            model = model.OrderByDescending(x => x.CreatedTime)
             .Skip((page - 1) * pageSize)
             .Take(pageSize).ToList();

            return new
            {
                status = true,
                data = model,
                total = total,
                page,
                pageSize,
                totalPage = (int)Math.Ceiling((double)total / pageSize),
            };
        }
        public Task<ActionPlan> GetById(int Id)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> Remove(int Id)
        {
            var item = await _dbContext.ActionPlans.FindAsync(Id);
            _dbContext.ActionPlans.Remove(item);
            try
            {
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch
            {

                return false;

            }
        }
        public async Task<bool> UpdateActionPlan(ActionPlanForUpdateParams actionPlan)
        {
            try
            {
                var item = await _dbContext.ActionPlans.FindAsync(actionPlan.ID);
                if (actionPlan.Title.IsNullOrEmpty())
                {
                    item.Title = actionPlan.Title;
                }
                if (actionPlan.Description.IsNullOrEmpty())
                {
                    item.Description = actionPlan.Description;
                }
                if (actionPlan.Tag.IsNullOrEmpty())
                {
                    item.Tag = actionPlan.Tag;
                }
                if (actionPlan.DeadLine.IsNullOrEmpty())
                {
                    item.Deadline = Convert.ToDateTime(actionPlan.DeadLine);
                }

                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public Task<bool> Update(ActionPlan item)
        {
            throw new NotImplementedException();
        }

        public async Task<object> UpdateSheduleDate(string name, string value, string pk, int userid)
        {
            try
            {
                var listuserChecking = new List<int>();
                var listEmail = new List<string>();
                var listTags = new List<Tag>();

                var id = pk.ToSafetyString().ToInt();
                var listDetails = new List<NotificationDetail>();

                var item = await _dbContext.ActionPlans.FirstOrDefaultAsync(x => x.ID == id);
                //Auditor
                var userAuditors = _dbContext.ActionPlanDetails.Where(x => x.ActionPlanID == item.ID).Select(x => x.UserID);
                var pics = _dbContext.Tags.Where(x => x.ActionPlanID == item.ID).Select(x => x.UserID);
                listuserChecking.Add(item.UserID);
                listuserChecking.AddRange(userAuditors);
                listuserChecking.AddRange(pics);

                listuserChecking.ForEach(userid =>
                {
                    listEmail.Add(_dbContext.Users.FirstOrDefault(x => x.ID == userid)?.Email);

                });
                if (name.ToLower() == "remark")
                {
                    if (!listuserChecking.Contains(userid))
                    {
                        return new
                        {
                            message = "You are not assigned this task!",
                            status = false
                        };
                    }
                    item.Remark = value;
                    await _dbContext.SaveChangesAsync();
                    var notify = await CreateNotification(new Notification
                    {
                        ActionplanID = item.ID,
                        Content = item.Remark,
                        UserID = userid,//Nguoi update Status task
                        Title = item.Title,
                        Link = item.Link.Split('#').Last(),
                        KPIName = item.Name ?? item.Title.ToSafetyString().Split('-')[2],
                        TaskName = item.Title,
                        Action = "Remark"
                    });
                    var kpiLevel = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode);
                    foreach (var i in listuserChecking)
                    {
                        listDetails.Add(new NotificationDetail
                        {
                            UserID = i,
                            Seen = false,
                            URL = notify.Link,
                            NotificationID = notify.ID
                        });
                    }
                    _dbContext.NotificationDetails.AddRange(listDetails);
                    await _dbContext.SaveChangesAsync();

                    string content = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p>" +
                                    $"<p>The account <b>{_dbContext.Users.FirstOrDefault(x => x.ID == userid)?.Alias.ToTitleCase()}</b> remarked on the task name <b>'{item.Title} <span style='color:red'>(Task ID #{item.ID})</span>'</b></p>" +
                                    $"<p>Content: {item.Remark ?? "#N/A"}</p>" +
                                    $"<p>Link: <a href='{item.Link}'>Click Here</a></p>";
                    Thread thread = new Thread(async () =>
                   {
                      await _mailHelper.SendEmailRange(listEmail, "[KPI System-00] Action Plan (Remark on the task)", content);

                   });


                    return new
                    {

                        message = "Successfully!",
                        status = true
                    };
                }

                if (!listuserChecking.Contains(userid))
                {
                    return new
                    {
                        message = "You are not Owner or Auditor!",
                        status = false
                    };
                }
                if (item == null)
                {
                    return new
                    {
                        message = "Error! Please contact to administrator!",
                        status = false
                    };
                }
                if (name.ToLower() == "title")
                {
                    item.Title = value;
                }
                if (name.ToLower() == "description")
                {

                    if (value.IndexOf("/n") == -1)
                    {
                        item.Description = value;
                    }
                    else
                    {
                        var des = string.Empty;
                        value.Split('\n').ToList().ForEach(line =>
                        {
                            des += line + "&#13;&#10;";
                        });
                        item.Description = des;
                    }

                }
                if (name.ToLower() == "tag")
                {
                    item.Tag = value;
                }
                if (name.ToLower() == "deadline")
                {
                    item.Deadline = Convert.ToDateTime(value);
                }
                if (name.ToLower() == "updatesheduledate")
                {
                    var dt = Convert.ToDateTime(value);

                    item.UpdateSheduleDate = dt;
                    await _dbContext.SaveChangesAsync();
                    var notify = await CreateNotification(new Notification
                    {
                        ActionplanID = item.ID,
                        Content = item.Title,
                        UserID = userid,//Nguoi update Status task
                        Title = item.Title,
                        Link = item.Link.Split('#').Last(),
                        KPIName = item.Name ?? item.Title.ToSafetyString().Split('-')[2],
                        TaskName = item.Title,
                        Action = "UpdateSheduleDate"
                    });
                    var kpiLevel = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode);
                    foreach (var i in listuserChecking)
                    {
                        listDetails.Add(new NotificationDetail
                        {
                            UserID = i,
                            Seen = false,
                            URL = notify.Link,
                            NotificationID = notify.ID
                        });
                    }
                    _dbContext.NotificationDetails.AddRange(listDetails);
                    await _dbContext.SaveChangesAsync();


                    //string content = @"<p><b>*PLEASE DO NOT REPLY* this email was automatically sent from the KPI system.</b></p>" +
                    //                $"<p>The account <b>{_dbContext.Users.FirstOrDefault(x => x.ID == userid)?.Alias.ToTitleCase()}</b> Change on Sheduledate <b>'{item.Title} <span style='color:red'>(Task ID #{item.ID})</span>'</b></p>" +
                    //                $"<p>Content: {item.Title ?? "#N/A"}</p>" +
                    //                $"<p>Link: <a href='{item.Link}'>Click Here</a></p>";
                    //Thread thread = new Thread(async () =>
                    //{
                    //    await _mailHelper.SendEmailRange(listEmail, "[KPI System-00] Action Plan (Change Sheduledate on the task)", content);

                    //});

                    return new
                    {

                        message = "Successfully!",
                        status = true
                    };
                }

                await _dbContext.SaveChangesAsync();
                return new
                {
                    message = "Successfully!",
                    status = true
                };
            }
            catch (Exception ex)
            {
                return new
                {
                    message = ex.Message,
                    status = false
                };
            }
        }


        public async Task<Tuple<List<string[]>, bool, string>> UpdateSheduleDate2(string name, string value, string pk, int userid)
        {
            try
            {
                var listuserChecking = new List<int>();
                var listEmail = new List<string[]>();
                var listTags = new List<Tag>();

                var id = pk.ToSafetyString().ToInt();
                var listDetails = new List<NotificationDetail>();

                var item = await _dbContext.ActionPlans.FirstOrDefaultAsync(x => x.ID == id);
                //Auditor
                var userAuditors = _dbContext.ActionPlanDetails.Where(x => x.ActionPlanID == item.ID).Select(x => x.UserID);
                var pics = _dbContext.Tags.Where(x => x.ActionPlanID == item.ID).Select(x => x.UserID);
                listuserChecking.Add(item.UserID);
                listuserChecking.AddRange(userAuditors);
                listuserChecking.AddRange(pics);

                listuserChecking.ForEach(userid =>
                {
                    string[] arrayString = new string[5];
                    arrayString[0] = _dbContext.Users.Find(userid).Alias; //Bi danh
                    arrayString[1] = _dbContext.Users.FirstOrDefault(x => x.ID == userid)?.Email;
                    arrayString[2] = name;
                    arrayString[3] = item.Title;
                    listEmail.Add(arrayString);
                    //listEmail.Add(_dbContext.Users.FirstOrDefault(x => x.ID == userid)?.Email);

                });
                if (name.ToLower() == "remark")
                {
                    if (!listuserChecking.Contains(userid))
                    {
                        return Tuple.Create(new List<string[]>(), false, "");
                  
                    }
                    item.Remark = value;
                    await _dbContext.SaveChangesAsync();
                    var notify = await CreateNotification(new Notification
                    {
                        ActionplanID = item.ID,
                        Content = item.Remark,
                        UserID = userid,//Nguoi update Status task
                        Title = item.Title,
                        Link = item.Link.Split('#').Last(),
                        KPIName = item.Name ?? item.Title.ToSafetyString().Split('-')[2],
                        TaskName = item.Title,
                        Action = "Remark"
                    });
                    var kpiLevel = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode);
                    foreach (var i in listuserChecking)
                    {
                        listDetails.Add(new NotificationDetail
                        {
                            UserID = i,
                            Seen = false,
                            URL = notify.Link,
                            NotificationID = notify.ID
                        });
                    }
                    _dbContext.NotificationDetails.AddRange(listDetails);
                    await _dbContext.SaveChangesAsync();

                   

                    return Tuple.Create(listEmail, true, item.Link);
                  
                }

                if (!listuserChecking.Contains(userid))
                {
                    return Tuple.Create(new List<string[]>(), false, "");
             
                }
                if (item == null)
                {
                    return Tuple.Create(new List<string[]>(), false, "");
               
                }
                if (name.ToLower() == "title")
                {
                    item.Title = value;
                }
                if (name.ToLower() == "description")
                {

                    if (value.IndexOf("/n") == -1)
                    {
                        item.Description = value;
                    }
                    else
                    {
                        var des = string.Empty;
                        value.Split('\n').ToList().ForEach(line =>
                        {
                            des += line + "&#13;&#10;";
                        });
                        item.Description = des;
                    }

                }
                if (name.ToLower() == "tag")
                {
                    item.Tag = value;
                }
                if (name.ToLower() == "deadline")
                {
                    item.Deadline = Convert.ToDateTime(value);
                }
                if (name.ToLower() == "updatesheduledate")
                {
                    var dt = Convert.ToDateTime(value);

                    item.UpdateSheduleDate = dt;
                    item.Status = false;
                    item.ActualFinishDate = null;
                    item.ApprovedBy = 0;
                    await _dbContext.SaveChangesAsync();
                    var notify = await CreateNotification(new Notification
                    {
                        ActionplanID = item.ID,
                        Content = item.Title,
                        UserID = userid,//Nguoi update Status task
                        Title = item.Title,
                        Link = item.Link.Split('#').Last(),
                        KPIName = item.Name ?? item.Title.ToSafetyString().Split('-')[2],
                        TaskName = item.Title,
                        Action = "UpdateSheduleDate"
                    });
                    var kpiLevel = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode);
                    foreach (var i in listuserChecking)
                    {
                        listDetails.Add(new NotificationDetail
                        {
                            UserID = i,
                            Seen = false,
                            URL = notify.Link,
                            NotificationID = notify.ID
                        });
                    }
                    _dbContext.NotificationDetails.AddRange(listDetails);
                    await _dbContext.SaveChangesAsync();


          
                    return Tuple.Create(listEmail, true, item.Link);
                 
                }

                await _dbContext.SaveChangesAsync();
                return Tuple.Create(listEmail, true, item.Link);
          
            }
            catch (Exception ex)
            {
                return Tuple.Create(new List<string[]>(), true, "");
           
            }
        }

        private async Task<Notification> CreateNotification(Notification entity)
        {
            await _dbContext.Notifications.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }
        public async Task<Tuple<List<string[]>, bool, string>> Done(int id, int userid, string KPILevelCode, int CategoryID)
        {
            var listTags = new List<Tag>();
            var model = await _dbContext.ActionPlans.FindAsync(id);
            var userTags = _dbContext.Tags.Where(x => x.ActionPlanID == model.ID).Select(x => x.UserID);
            if (!userTags.Contains(userid))
            {
                return Tuple.Create(new List<string[]>(), false, "");
            }
            var listDetails = new List<NotificationDetail>();
            var listEmail = new List<string[]>();
            var user = _dbContext.Users;
            //Chua duyet thi moi cho update lai status
            if (!model.ApprovedStatus)
            {
                //var qrlink = model.Link.Split('#').Last();
                //B1: Update status xong thi thong bao den cac user lien quan va owner
                model.Status = !model.Status;
                if (userid == model.UserID)
                {
                    model.UpdateSheduleDate = DateTime.Now;
                }
                else
                {
                    model.ActualFinishDate = DateTime.Now;

                }
                //B2: Thong bao den owner va auditor khi hoan thanh
                var kpiLevel = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == KPILevelCode);
                var owners = await _dbContext.Owners.Where(x => x.CategoryID == CategoryID && x.KPILevelID == kpiLevel.ID).ToListAsync();
                var auditors = await _dbContext.ActionPlanDetails.Where(x => x.ActionPlanID == model.ID).ToListAsync();
                auditors.ForEach(item =>
                {
                    listTags.Add(new Tag { UserID = item.UserID, ActionPlanID = model.ID });
                });
                owners.ForEach(item =>
                {
                    listTags.Add(new Tag { UserID = item.UserID, ActionPlanID = model.ID });
                });

                try
                {
                    //_dbContext.Tags.AddRange(listTags);
                    var tags = await _dbContext.Tags.Where(x => x.ActionPlanID == model.ID).ToListAsync();
                    foreach (var tag in tags)
                    {
                        string[] arrayString = new string[5];
                        arrayString[0] = user.Find(userid).Alias; //Bi danh
                        arrayString[1] = user.Find(tag.UserID).Email;
                        arrayString[2] = "Update Status Task";
                        arrayString[3] = model.Title;
                        listEmail.Add(arrayString);
                    }
                    await _dbContext.SaveChangesAsync();
                    //Add vao Notification
                    //var qrlink2 = model.Link.Split('#').Last();
                    var notify = await CreateNotification(new Notification
                    {
                        ActionplanID = model.ID,
                        Content = model.Description,
                        UserID = userid,//Nguoi update Status task
                        Title = model.Title,
                        Link = model.Link.Split('#').Last(),
                        KPIName = model.Name ?? model.Title.ToSafetyString().Split('-')[2],
                        TaskName = model.Title,
                        Action = "Done"
                    });

                    foreach (var item in listTags)
                    {
                        listDetails.Add(new NotificationDetail
                        {
                            UserID = item.UserID,
                            Seen = false,
                            URL = notify.Link,
                            NotificationID = notify.ID
                        });
                    }
                    _dbContext.NotificationDetails.AddRange(listDetails);
                    await _dbContext.SaveChangesAsync();

                    return Tuple.Create(listEmail, true, model.Link);
                }
                catch (Exception ex)
                {
                    //logger
                    await _errorService.Add(new ErrorMessage { Name = ex.Message, Function = "Done" });
                    return Tuple.Create(new List<string[]>(), false, "");
                }
            }
            else
            {
                return Tuple.Create(new List<string[]>(), false, "");
            }
        }

        private bool disposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _dbContext.Dispose();
                }
            }
            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        public async Task<object> LoadActionPlan(string role ,bool status , int page, int pageSize, int userid)
        {
            var model = new List<ActionPlanViewModel>();
            switch (role.ToSafetyString().ToUpper())
            {
                case "MAN":
                    if (_dbContext.Managers.Any(x => x.UserID == userid))
                    {
                        model = (await (from d in _dbContext.Datas
                                        join ac in _dbContext.ActionPlans on d.ID equals ac.DataID
                                        join kpilevelcode in _dbContext.KPILevels on d.KPILevelCode equals kpilevelcode.KPILevelCode
                                        join own in _dbContext.Managers on kpilevelcode.ID equals own.KPILevelID where own.UserID == userid
                                        select new
                                        {
                                            ac.ID,
                                            TaskName = ac.Title,
                                            Description = ac.Description,
                                            DuaDate = ac.Deadline,
                                            UpdateSheuleDate = ac.UpdateSheduleDate,
                                            ActualFinishDate = ac.ActualFinishDate,
                                            Status = ac.Status,
                                            PIC = ac.Tag,
                                            Auditor = _dbContext.Users.FirstOrDefault(x => x.ID == ac.Auditor).Alias,
                                            ac.Remark,
                                            Code = ac.KPILevelCode,
                                            Approved = ac.ApprovedStatus,
                                            KPIID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == d.KPILevelCode).KPIID,
                                            KPILevelID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == d.KPILevelCode).ID
                                        }).Distinct().ToListAsync())
                     .Select(x => new ActionPlanViewModel
                     {
                         TaskName = x.TaskName,
                         Description = x.Description,
                         DueDate = x.DuaDate.ToString("dddd, dd MMMM yyyy"),
                         UpdateSheduleDate = x.UpdateSheuleDate?.ToString("dddd, dd MMMM yyyy"),
                         ActualFinishDate = x.ActualFinishDate?.ToString("dddd, dd MMMM yyyy"),
                         Status = x.Status,
                         Remark = x.Remark,
                         PIC = x.PIC,
                         Auditor = x.Auditor,
                         OC = _levelService.GetNode(x.Code),
                         Approved = x.Approved,
                         KPIName = _dbContext.KPIs.FirstOrDefault(a => a.ID == x.KPIID).Name,
                         URL = _dbContext.Notifications.FirstOrDefault(a => a.ActionplanID == x.ID)?.Link ?? "/"
                     }).ToList();
                        break;

                    }
                    break;

                case "OWN":
                    if (_dbContext.Owners.Any(x => x.UserID.Equals(userid)))
                    {
                        model = (await (from d in _dbContext.Datas
                                        join ac in _dbContext.ActionPlans on d.ID equals ac.DataID
                                        join kpilevelcode in _dbContext.KPILevels on d.KPILevelCode equals kpilevelcode.KPILevelCode
                                        join own in _dbContext.Owners on kpilevelcode.ID equals own.KPILevelID where own.UserID == userid
                                        select new 
                                        {
                                            ac.ID,
                                            TaskName = ac.Title,
                                            Description = ac.Description,
                                            DuaDate = ac.Deadline,
                                            UpdateSheuleDate = ac.UpdateSheduleDate,
                                            ActualFinishDate = ac.ActualFinishDate,
                                            Code = ac.KPILevelCode,
                                            Status = ac.Status,
                                            PIC = ac.Tag,
                                            Auditor = _dbContext.Users.FirstOrDefault(x => x.ID == ac.Auditor).Alias,
                                            Approved = ac.ApprovedStatus,
                                            KPIID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == d.KPILevelCode).KPIID,
                                            KPILevelID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == d.KPILevelCode).ID
                                        }).Distinct()
                     .ToListAsync())
                     .Select(x => new ActionPlanViewModel
                     {
                         TaskName = x.TaskName,
                         Description = x.Description,
                         DueDate = x.DuaDate.ToString("dddd, dd MMMM yyyy"),
                         UpdateSheduleDate = x.UpdateSheuleDate?.ToString("dddd, dd MMMM yyyy"),
                         ActualFinishDate = x.ActualFinishDate?.ToString("dddd, dd MMMM yyyy"),
                         Status = x.Status,
                         PIC = x.PIC,
                         Auditor = x.Auditor,
                         OC = _levelService.GetNode(x.Code),
                         Approved = x.Approved,
                         KPIName = _dbContext.KPIs.FirstOrDefault(a => a.ID == x.KPIID).Name
                         ,
                         URL = _dbContext.Notifications.FirstOrDefault(a => a.ActionplanID == x.ID)?.Link ?? "/"
                     }).ToList();
                        break;
                    }
                    break;

                case "AUD":
                    if (_dbContext.ActionPlans.Any(x => x.Auditor.Equals(userid)))
                    {
                        model = (await (from ac in _dbContext.ActionPlans.Where(x => x.Auditor == userid)
                                        //join ac in _dbContext.ActionPlans on d.ID equals ac.DataID
                                        join kpilevelcode in _dbContext.KPILevels on ac.KPILevelCode equals kpilevelcode.KPILevelCode
                                        join auditor in _dbContext.ActionPlans.Where(x => x.Auditor == userid) on kpilevelcode.ID equals auditor.KPILevelID
                                        //where auditor.Auditor == userid
                                        select new
                                        {
                                            ac.ID,
                                            TaskName = ac.Title,
                                            Description = ac.Description,
                                            DuaDate = ac.Deadline,
                                            UpdateSheuleDate = ac.UpdateSheduleDate,
                                            ActualFinishDate = ac.ActualFinishDate,
                                            Code = ac.KPILevelCode,
                                            Status = ac.Status,
                                            PIC = ac.Tag,
                                            Auditor = _dbContext.Users.FirstOrDefault(x => x.ID == ac.Auditor).Alias,
                                            Approved = ac.ApprovedStatus,
                                            KPIID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == ac.KPILevelCode).KPIID,
                                            KPILevelID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == ac.KPILevelCode).ID
                                        }).Distinct()
                     .ToListAsync())
                     .Select(x => new ActionPlanViewModel
                     {
                         TaskName = x.TaskName,
                         Description = x.Description,
                         DueDate = x.DuaDate.ToString("dddd, dd MMMM yyyy"),
                         UpdateSheduleDate = x.UpdateSheuleDate?.ToString("dddd, dd MMMM yyyy"),
                         ActualFinishDate = x.ActualFinishDate?.ToString("dddd, dd MMMM yyyy"),
                         Status = x.Status,
                         PIC = x.PIC,
                         Auditor = x.Auditor,
                         OC = _levelService.GetNode(x.Code),
                         Approved = x.Approved,
                         KPIName = _dbContext.KPIs.FirstOrDefault(a => a.ID == x.KPIID).Name
                         ,
                         URL = _dbContext.Notifications.FirstOrDefault(a => a.ActionplanID == x.ID)?.Link ?? "/"
                     }).ToList();
                        break;
                    }
                    break;

                case "PIC":
                    var asl = _dbContext.Users.Find(userid).Alias;
                    if (_dbContext.ActionPlans.Any(x => x.Tag.IndexOf(asl) != -1))
                    {
                        model = (await (from ac in _dbContext.ActionPlans.Where(x => x.Tag.IndexOf(asl) != -1)
                                            //join ac in _dbContext.ActionPlans on d.ID equals ac.DataID
                                        join kpilevelcode in _dbContext.KPILevels on ac.KPILevelCode equals kpilevelcode.KPILevelCode
                                        join own in _dbContext.ActionPlans on kpilevelcode.ID equals own.KPILevelID
                                        //where own.Tag.IndexOf(asl) != -1
                                        select new
                                        {
                                            ac.ID,
                                            TaskName = ac.Title,
                                            Description = ac.Description,
                                            DuaDate = ac.Deadline,
                                            UpdateSheuleDate = ac.UpdateSheduleDate,
                                            ActualFinishDate = ac.ActualFinishDate,
                                            Code = ac.KPILevelCode,
                                            Status = ac.Status,
                                            PIC = ac.Tag,
                                            Auditor = _dbContext.Users.FirstOrDefault(x => x.ID == ac.Auditor).Alias,
                                            Approved = ac.ApprovedStatus,
                                            KPIID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == ac.KPILevelCode).KPIID,
                                            KPILevelID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == ac.KPILevelCode).ID
                                        }).Distinct()
                     .ToListAsync())
                     .Select(x => new ActionPlanViewModel
                     {
                         TaskName = x.TaskName,
                         Description = x.Description,
                         DueDate = x.DuaDate.ToString("dddd, dd MMMM yyyy"),
                         UpdateSheduleDate = x.UpdateSheuleDate?.ToString("dddd, dd MMMM yyyy"),
                         ActualFinishDate = x.ActualFinishDate?.ToString("dddd, dd MMMM yyyy"),
                         Status = x.Status,
                         PIC = x.PIC,
                         Auditor = x.Auditor,
                         OC = _levelService.GetNode(x.Code),
                         Approved = x.Approved,
                         KPIName = _dbContext.KPIs.FirstOrDefault(a => a.ID == x.KPIID).Name
                         ,
                         URL = _dbContext.Notifications.FirstOrDefault(a => a.ActionplanID == x.ID)?.Link ?? "/"
                     }).ToList();
                        break;
                    }
                    break;

                case "UPD":
                    if (_dbContext.Uploaders.Any(x => x.UserID.Equals(userid)))
                    {
                        model = (await (from d in _dbContext.Datas
                                        join ac in _dbContext.ActionPlans on d.ID equals ac.DataID
                                        join kpilevelcode in _dbContext.KPILevels on d.KPILevelCode equals kpilevelcode.KPILevelCode
                                        join own in _dbContext.Uploaders on kpilevelcode.ID equals own.KPILevelID
                                        where own.UserID == userid
                                        select new
                                        {
                                            ac.ID,
                                            KPILevelCode = d.KPILevelCode,
                                            TaskName = ac.Title,
                                            Description = ac.Description,
                                            DuaDate = ac.Deadline,
                                            UpdateSheuleDate = ac.UpdateSheduleDate,
                                            ActualFinishDate = ac.ActualFinishDate,
                                            Code = ac.KPILevelCode,
                                            Status = ac.Status,
                                            PIC = ac.Tag,
                                            Auditor = _dbContext.Users.FirstOrDefault(x => x.ID == ac.Auditor).Alias,
                                            Approved = ac.ApprovedStatus,
                                            KPIID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == d.KPILevelCode).KPIID,
                                            KPILevelID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == d.KPILevelCode).ID
                                        }).Distinct()
                     .ToListAsync())
                     .Select(x => new ActionPlanViewModel
                     {
                         TaskName = x.TaskName,
                         Description = x.Description,
                         DueDate = x.DuaDate.ToString("dddd, dd MMMM yyyy"),
                         UpdateSheduleDate = x.UpdateSheuleDate?.ToString("dddd, dd MMMM yyyy"),
                         ActualFinishDate = x.ActualFinishDate?.ToString("dddd, dd MMMM yyyy"),
                         Status = x.Status,
                         OC = _levelService.GetNode(x.Code),
                         PIC = x.PIC,
                         Auditor = x.Auditor,
                         Approved = x.Approved,
                         KPIName = _dbContext.KPIs.FirstOrDefault(a => a.ID == x.KPIID).Name,
                         URL = _dbContext.Notifications.FirstOrDefault(a => a.ActionplanID == x.ID)?.Link ?? "/"

                     }).ToList();
                        break;
                    }
                    break;

                case "SPO":
                    if (_dbContext.Sponsors.Any(x => x.UserID.Equals(userid)))
                    {
                        model = (await (from d in _dbContext.Datas
                                        join ac in _dbContext.ActionPlans on d.ID equals ac.DataID
                                        join kpilevelcode in _dbContext.KPILevels on d.KPILevelCode equals kpilevelcode.KPILevelCode
                                        join own in _dbContext.Sponsors on kpilevelcode.ID equals own.KPILevelID
                                        where own.UserID == userid
                                        select new
                                        {
                                            ac.ID,
                                            TaskName = ac.Title,
                                            Description = ac.Description,
                                            DuaDate = ac.Deadline,
                                            UpdateSheuleDate = ac.UpdateSheduleDate,
                                            ActualFinishDate = ac.ActualFinishDate,
                                            Status = ac.Status,
                                            Code = ac.KPILevelCode,
                                            PIC = ac.Tag,
                                            Auditor = _dbContext.Users.FirstOrDefault(x => x.ID == ac.Auditor).Alias,
                                            Approved = ac.ApprovedStatus,
                                            KPIID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == d.KPILevelCode).KPIID,
                                            KPILevelID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == d.KPILevelCode).ID
                                        }).Distinct()
                    .ToListAsync())
                    .Select(x => new ActionPlanViewModel
                    {
                        TaskName = x.TaskName,
                        KPIName = _dbContext.KPIs.FirstOrDefault(a => a.ID == x.KPIID).Name,
                        Description = x.Description,
                        DueDate = x.DuaDate.ToString("dddd, dd MMMM yyyy"),
                        UpdateSheduleDate = x.UpdateSheuleDate?.ToString("dddd, dd MMMM yyyy"),
                        ActualFinishDate = x.ActualFinishDate?.ToString("dddd, dd MMMM yyyy"),
                        OC = _levelService.GetNode(x.Code),
                        Status = x.Status,
                        PIC = x.PIC,
                        Auditor = x.Auditor,
                        Approved = x.Approved,
                        URL = _dbContext.Notifications.FirstOrDefault(a => a.ActionplanID == x.ID)?.Link ?? "/"

                    }).ToList();
                        break;
                    }
                    break;

                case "PAR":
                    if (_dbContext.Participants.Any(x => x.UserID.Equals(userid)))
                    {
                        model = (await (from d in _dbContext.Datas
                                        join ac in _dbContext.ActionPlans on d.ID equals ac.DataID
                                        join kpilevelcode in _dbContext.KPILevels on d.KPILevelCode equals kpilevelcode.KPILevelCode
                                        join own in _dbContext.Participants on kpilevelcode.ID equals own.KPILevelID
                                        where own.UserID == userid
                                        select new
                                        {
                                            ac.ID,
                                            TaskName = ac.Title,
                                            Description = ac.Description,
                                            DuaDate = ac.Deadline,
                                            UpdateSheuleDate = ac.UpdateSheduleDate,
                                            ActualFinishDate = ac.ActualFinishDate,
                                            Code = ac.KPILevelCode,
                                            Status = ac.Status,
                                            PIC = ac.Tag,
                                            Auditor = _dbContext.Users.FirstOrDefault(x => x.ID == ac.Auditor).Alias,
                                            Approved = ac.ApprovedStatus,
                                            KPIID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == d.KPILevelCode).KPIID,
                                            KPILevelID = _dbContext.KPILevels.FirstOrDefault(a => a.KPILevelCode == d.KPILevelCode).ID
                                        }).Distinct()
                    .ToListAsync())
                    .Select(x => new ActionPlanViewModel
                    {
                        TaskName = x.TaskName,
                        Description = x.Description,
                        DueDate = x.DuaDate.ToString("dddd, dd MMMM yyyy"),
                        UpdateSheduleDate = x.UpdateSheuleDate?.ToString("dddd, dd MMMM yyyy"),
                        ActualFinishDate = x.ActualFinishDate?.ToString("dddd, dd MMMM yyyy"),
                        Status = x.Status,
                        OC = _levelService.GetNode(x.Code),
                        PIC = x.PIC,
                        Auditor = x.Auditor,
                        Approved = x.Approved,
                        KPIName = _dbContext.KPIs.FirstOrDefault(a => a.ID == x.KPIID).Name,
                        URL = _dbContext.Notifications.FirstOrDefault(a => a.ActionplanID == x.ID)?.Link ?? "/"

                    }).ToList();
                        break;
                    }
                    break;

                default:

                    break;
            }
            if (status == true)
            {
                model = model.Where(x => x.Status == true && x.Approved == true).ToList();
            }
            else
            {
                model = model.Where(x => x.Status == false && x.Approved == false || x.Status == true && x.Approved == false).ToList();

            }
            int totalRow = model.Count();
            model = model.OrderByDescending(x => x.KPIName)
              .Skip((page - 1) * pageSize)
              .Take(pageSize).ToList();

            return new
            {
                status = true,
                data = model,
                total = totalRow,
                page = page,
                totalPage = (int)Math.Ceiling((double)totalRow / pageSize),
                pageSize = pageSize
            };
        }
        public Tuple<List<object[]>, List<UserViewModel>> CheckLateOnUpdateData()
        {
            var listSendMail = new List<object[]>();
            var listSendMailDetail = new List<string[]>();
            var listNotify = new List<Notification>();
            var listNotifyDetail = new List<NotificationDetail>();
            var listTag = new List<Tag>();

            var dayOfWeek = DateTime.Today.DayOfWeek.ToSafetyString().ToUpper().ConvertStringDayOfWeekToNumber();
            var count = 0;
            var model2 = (from cat in _dbContext.CategoryKPILevels
                          join kpilevel in _dbContext.KPILevels on cat.KPILevelID equals kpilevel.ID
                          join kpi in _dbContext.KPIs on kpilevel.KPIID equals kpi.ID
                          join level in _dbContext.Levels on kpilevel.LevelID equals level.ID
                          where kpilevel.Checked == true && cat.Status == true
                          select new CheckActionPlanViewmodel
                          {
                              ID = kpilevel.ID,
                              Title = kpi.Name,
                              Area = level.Name,
                              KPILevelCode = kpilevel.KPILevelCode,
                              Weekly = kpilevel.Weekly ?? 1,
                              Monthly = kpilevel.Monthly ?? DateTime.MinValue,
                              Quarterly = kpilevel.Quarterly ?? DateTime.MinValue,
                              Yearly = kpilevel.Yearly ?? DateTime.MinValue,
                              WeeklyChecked = kpilevel.WeeklyChecked ?? false,
                              MonthlyChecked = kpilevel.MonthlyChecked ?? false,
                              QuarterlyChecked = kpilevel.QuarterlyChecked ?? false,
                              YearlyChecked = kpilevel.YearlyChecked ?? false,
                              UpdateDataStatusW = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevel.KPILevelCode && x.Period == (kpilevel.WeeklyChecked == true ? "W" : "")) != null ? true : false,
                              UpdateDataStatusM = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevel.KPILevelCode && x.Period == (kpilevel.MonthlyChecked == true ? "M" : "")) != null ? true : false,
                              UpdateDataStatusQ = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevel.KPILevelCode && x.Period == (kpilevel.QuarterlyChecked == true ? "Q" : "")) != null ? true : false,
                              UpdateDataStatusY = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevel.KPILevelCode && x.Period == (kpilevel.YearlyChecked == true ? "Y" : "")) != null ? true : false
                          }).ToList();

            //var count = 0;
            //model2 = model2.ToList();
            var uploaders = (from a in model2
                             join uploader in _dbContext.Uploaders on a.ID equals uploader.KPILevelID
                             join user in _dbContext.Users on uploader.UserID equals user.ID
                             select new UserViewModel
                             {
                                 ID = user.ID,
                                 Email = user.Email
                             }).ToList();
            var owners = (from a in model2
                          join owner in _dbContext.Owners on a.ID equals owner.KPILevelID
                          join user in _dbContext.Users on owner.UserID equals user.ID
                          select new UserViewModel
                          {
                              ID = user.ID,
                              Email = user.Email
                          }).ToList();

            var listEmails = uploaders.Concat(owners).DistinctBy(x => x.ID);

            foreach (var item in model2)
            {
                var oc = _levelService.GetNode(item.KPILevelCode);
                var time = new TimeSpan(00, 00, 00, 00);

                int month = DateTime.Compare(DateTime.Today.Add(new TimeSpan(00, 00, 00, 00)), item.Monthly);
                int quarter = DateTime.Compare(DateTime.Today.Add(new TimeSpan(00, 00, 00, 00)), item.Quarterly);
                int year = DateTime.Compare(DateTime.Today.Add(new TimeSpan(00, 00, 00, 00)), item.Yearly);
                //less than zero if ToDay is earlier than item.yearly 
                //greater than zero if ToDay is later than item.yearly

                if (month > 0 || quarter > 0 || year > 0 || item.Weekly > dayOfWeek)
                {
                    count++;
                    if (item.Weekly >= dayOfWeek && item.Weekly != 1 && item.UpdateDataStatusW == true && item.WeeklyChecked == true)
                    {
                        if (CheckExistsData(item.KPILevelCode, "W"))
                        {
                            var itemSendMail = new object[] {
                                item.Title, item.Weekly.ConvertNumberDayOfWeekToString().ToString(),item.KPILevelCode,oc,"Weekly "
                            };
                            listSendMail.Add(itemSendMail);
                        }
                    }
                    if (month >= 0 && item.Monthly != DateTime.MinValue && item.UpdateDataStatusM == true && item.MonthlyChecked == true)
                    {
                        //Kiem tra period hien tai trong bang data
                        if (CheckExistsData(item.KPILevelCode, "M"))
                        {
                            var itemSendMail = new object[] {
                                item.Title,item.Monthly.ToString("dddd, dd MMMM yyyy"),item.KPILevelCode,oc,"Monthly"
                            };
                            listSendMail.Add(itemSendMail);
                        }

                    }
                    if (quarter >= 0 && item.Quarterly != DateTime.MinValue && item.UpdateDataStatusQ == true && item.QuarterlyChecked == true)
                    {
                        if (CheckExistsData(item.KPILevelCode, "Q"))
                        {
                            var itemSendMail = new object[] {
                                item.Title,item.Quarterly.ToString("dddd, dd MMMM yyyy"),item.KPILevelCode,oc,"Quarterly"
                            };
                            listSendMail.Add(itemSendMail);
                        }
                    }
                    if (year >= 0 && item.Yearly != DateTime.MinValue && item.UpdateDataStatusY == true && item.YearlyChecked == true)
                    {
                        if (CheckExistsData(item.KPILevelCode, "Y"))
                        {
                            var itemSendMail = new object[] {
                                item.Title,item.Yearly.ToString("dddd, dd MMMM yyyy"),item.KPILevelCode,oc,"Yearly"
                            };
                            listSendMail.Add(itemSendMail);
                        }
                    }
                }
            }
            if (listSendMail.Count > 0)
            {
                var notify = new Notification();
                notify.Action = "LateOnUploadData";
                notify.UserID = 1;
                _dbContext.Notifications.Add(notify);
                _dbContext.SaveChanges();
                var listLateOnUploads = new List<LateOnUpLoad>();
                //var notify = new Notification();
                //notify.Action = "LateOnUploadData";
                //notify.UserID = 1;
                //_dbContext.Notifications.Add(notify);
                //_dbContext.SaveChanges();

                //foreach (var it in listEmails)
                //{
                //    var notifyDetail = new NotificationDetail();
                //    notifyDetail.NotificationID = notify.ID;
                //    notifyDetail.Seen = false;
                //    notifyDetail.UserID = it.ID;

                //    var tag = new Tag();
                //    tag.UserID = it.ID;
                //    tag.NotificationID = notify.ID;
                //    listTag.Add(tag);
                //    listNotifyDetail.Add(notifyDetail);
                //}
                foreach (var it in listEmails)
                {
                    var notifyDetail = new NotificationDetail();
                    notifyDetail.NotificationID = notify.ID;
                    notifyDetail.Seen = false;
                    notifyDetail.UserID = it.ID;

                    listSendMail.ForEach(x =>
                    {
                        listLateOnUploads.Add(new LateOnUpLoad
                        {
                            KPIName = x[0].ToString(),
                            Area = x[3].ToString(),
                            Code = x[2].ToString(),
                            Year = x[4].ToString(),
                            DeadLine = x[1].ToString(),
                            UserID = it.ID,
                            NotificationID = notify.ID

                        });
                    });
                }
                _dbContext.NotificationDetails.AddRange(listNotifyDetail);
                _dbContext.SaveChanges();
                _dataService.AddLateOnUploadAsync(listLateOnUploads).Wait();

            }
            //_dbContext.Tags.AddRange(listTag);
            return Tuple.Create(listSendMail, listEmails.ToList());
        }

        public bool CreateTagOwnerAndUpdater(List<UserViewModel> uploaders, int notifyID)
        {
            var tags = new List<Tag>();
            var notificationDetails = new List<NotificationDetail>();
            foreach (var item in uploaders)
            {
                var tag = new Tag();
                tag.UserID = item.ID;
                tag.NotificationID = notifyID;
                tags.Add(tag);
            }
            try
            {
                foreach (var value in tags)
                {
                    var itemNotifyDetail = new NotificationDetail();
                    itemNotifyDetail.UserID = value.UserID;
                    itemNotifyDetail.NotificationID = notifyID;
                    itemNotifyDetail.Seen = false;
                    notificationDetails.Add(itemNotifyDetail);
                }
                _dbContext.NotificationDetails.AddRange(notificationDetails);
                _dbContext.Tags.AddRange(tags);
                _dbContext.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
        public Tuple<List<object[]>, List<UserViewModel>> CheckDeadline()
        {
            #region 0) Biến toàn cục

            var listSendMail = new List<object[]>();
            var timeSpan = new TimeSpan(00, 00, 00, 00);
            var timeSpanOfDay = new TimeSpan(24, 00, 00, 00);

            var date = DateTime.Now.Date.Add(timeSpan);
            var listAcID = new List<int>();
            var count = 0;

            #endregion

            //Lấy danh sách action Plan chưa hoàn thành và chưa được owner duyệt
            var model = _dbContext.ActionPlans.Where(x => x.Status == false && x.ApprovedStatus == false).ToList();
            foreach (var item in model)
                listAcID.Add(item.ID);

            //Lấy ra danh sách user được tag trong danh sách actionplan ở trên
            var listUser = (from a in _dbContext.Tags.Where(x => listAcID.Contains(x.ActionPlanID))
                            join c in _dbContext.Users on a.UserID equals c.ID
                            select new UserViewModel
                            {
                                ID = c.ID,
                                Email = c.Email
                            }).ToList();

            //Lap danh sach action Plan chưa hoàn thành và chưa được owner duyệt, 
            //So sanh deadline nếu deadline trễ hơn ngày hiện tại thì thông báo đẩy, gủi mail
            foreach (var item in model)
            {
                var kpilevelModel = _dbContext.KPILevels.FirstOrDefault(x => x.KPILevelCode == item.KPILevelCode);
                var ocName = string.Empty;
                var kpiname = string.Empty;
                if (kpilevelModel != null)
                {
                    var oc = _dbContext.Levels.FirstOrDefault(x => x.ID == kpilevelModel.LevelID);
                    var kpi = _dbContext.KPIs.Find(kpilevelModel.KPIID);
                    kpiname = _dbContext.KPIs.FirstOrDefault(x => x.ID == kpilevelModel.KPIID).Name;
                    ocName = _levelService.GetNode(oc.ID);
                }
                //Cong them 1 ngay nua de so sanh
                var deadline = item.Deadline.AddDays(1).Date.Add(timeSpan);

                //< 0 trễ deadline,
                if (DateTime.Compare(item.Deadline, date) < 0)
                {
                    var name = Regex.Replace(item.Name.Split('-')[0].ToSafetyString(), @"\s+", "-");

                    count++;
                    var itemSendMail = new object[] {
                        item.Title,
                        item.Deadline.ToString("dddd, dd MMMM yyyy"),
                        item.Link+ $"task/{item.CommentID}/{item.DataID}/{name}",
                        ocName,
                        kpiname
                    };
                    listSendMail.Add(itemSendMail);
                }
            }
            if (count > 0)
            {
                //Luu vao thong bao
                var notificationDetails = new List<NotificationDetail>();
                var notify = new Notification();
                notify.Action = "LateOnTask";
                notify.UserID = 1;
                _dbContext.Notifications.Add(notify);
                _dbContext.SaveChanges();

                foreach (var item in listUser)
                {
                    notificationDetails.Add(new NotificationDetail { NotificationID = notify.ID, UserID = item.ID, Seen = false });

                }
                _dbContext.NotificationDetails.AddRange(notificationDetails);
                _dbContext.SaveChanges();
            }
            return Tuple.Create(listSendMail, listUser);
        }

        public bool CheckExistsData(string code, string period)
        {
            var currentYear = DateTime.Now.Year;
            var currentWeek = DateTime.Now.GetIso8601WeekOfYear();
            var currentMonth = DateTime.Now.Month;
            var currentQuarter = DateTime.Now.GetQuarter();
            //Kiem tra period hien tai trong bang data
            switch (period)
            {
                case "W":
                    var W = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == code && x.Period == period && x.Week == currentWeek)?.Value;

                    if (W == null || W == "" || W == "0")
                        return true;
                    return false;
                case "M":
                    var M = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == code && x.Period == period && x.Month == currentMonth)?.Value;

                    if (M == null || M == "" || M == "0")
                        return true;
                    return false;
                case "Q":
                    var Q = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == code && x.Period == period && x.Quarter == currentQuarter)?.Value;

                    if (Q == null || Q == "" || Q == "0")
                        return true;
                    return false;
                case "Y":
                    var Y = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == code && x.Period == period && x.Year == currentYear)?.Value;

                    if (Y == null || Y == "" || Y == "0")
                        return true;
                    return false;
            }
            return false;

        }
        public Tuple<List<object[]>, List<UserViewModel>> CheckLateOnUpdateData(int userid)
        {
            #region 0) Biến toàn cục

            var listSendMail = new List<object[]>();
            var listSendMailDetail = new List<string[]>();
            var listNotify = new List<Notification>();
            var listNotifyDetail = new List<NotificationDetail>();
            var listTag = new List<Tag>();
            var dayOfWeek = DateTime.Today.DayOfWeek.ToSafetyString().ToUpper().ConvertStringDayOfWeekToNumber();
            var count = 0;
            #endregion

            #region 1) Lấy dữ liệu
            var model2 = (from cat in _dbContext.CategoryKPILevels
                          join kpilevel in _dbContext.KPILevels on cat.KPILevelID equals kpilevel.ID
                          join kpi in _dbContext.KPIs on kpilevel.KPIID equals kpi.ID
                          join level in _dbContext.Levels on kpilevel.LevelID equals level.ID
                          where kpilevel.Checked == true && cat.Status == true
                          select new ListCheckTaskViewModel
                          {
                              ID = kpilevel.ID,
                              Title = kpi.Name,
                              Area = level.Name,
                              KPILevelCode = kpilevel.KPILevelCode,
                              Weekly = kpilevel.Weekly ?? 1,
                              Monthly = kpilevel.Monthly ?? DateTime.MinValue,
                              Quarterly = kpilevel.Quarterly ?? DateTime.MinValue,
                              Yearly = kpilevel.Yearly ?? DateTime.MinValue,
                              WeeklyChecked = kpilevel.WeeklyChecked ?? false,
                              MonthlyChecked = kpilevel.MonthlyChecked ?? false,
                              QuarterlyChecked = kpilevel.QuarterlyChecked ?? false,
                              YearlyChecked = kpilevel.YearlyChecked ?? false,
                              UpdateDataStatusW = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevel.KPILevelCode && x.Period == (kpilevel.WeeklyChecked == true ? "W" : "")) != null ? true : false,
                              UpdateDataStatusM = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevel.KPILevelCode && x.Period == (kpilevel.MonthlyChecked == true ? "M" : "")) != null ? true : false,
                              UpdateDataStatusQ = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevel.KPILevelCode && x.Period == (kpilevel.QuarterlyChecked == true ? "Q" : "")) != null ? true : false,
                              UpdateDataStatusY = _dbContext.Datas.FirstOrDefault(x => x.KPILevelCode == kpilevel.KPILevelCode && x.Period == (kpilevel.YearlyChecked == true ? "Y" : "")) != null ? true : false
                          }).ToList();
            #endregion

            #region 2) Lấy tất cả uploader và owner theo danh sách vừa lấy ở trên
            var uploaders = (from a in model2
                             join uploader in _dbContext.Uploaders on a.ID equals uploader.KPILevelID
                             join user in _dbContext.Users on uploader.UserID equals user.ID
                             select new UserViewModel
                             {
                                 ID = user.ID,
                                 Email = user.Email
                             }).ToList();
            var owners = (from a in model2
                          join owner in _dbContext.Owners on a.ID equals owner.KPILevelID
                          join user in _dbContext.Users on owner.UserID equals user.ID
                          select new UserViewModel
                          {
                              ID = user.ID,
                              Email = user.Email
                          }).ToList();

            var listEmails = uploaders.Concat(owners).DistinctBy(x => x.ID);
            #endregion

            #region 3) Lọc Dữ liệu để gửi mail
            foreach (var item in model2)
            {
                var oc = _levelService.GetNode(item.KPILevelCode);
                var time = new TimeSpan(00, 00, 00, 00);

                int month = DateTime.Compare(DateTime.Today.Add(new TimeSpan(00, 00, 00, 00)), item.Monthly);
                int quarter = DateTime.Compare(DateTime.Today.Add(new TimeSpan(00, 00, 00, 00)), item.Quarterly);
                int year = DateTime.Compare(DateTime.Today.Add(new TimeSpan(00, 00, 00, 00)), item.Yearly);
                //less than zero if ToDay is earlier than item.yearly 
                //greater than zero if ToDay is later than item.yearly

                if (month > 0 || quarter > 0 || year > 0 || item.Weekly > dayOfWeek)
                {
                    count++;
                    if (item.Weekly >= dayOfWeek && item.Weekly != 1 && item.UpdateDataStatusW == true && item.WeeklyChecked == true)
                    {
                        if (CheckExistsData(item.KPILevelCode, "W"))
                        {
                            var itemSendMail = new object[] {
                                item.Title, item.Weekly.ConvertNumberDayOfWeekToString().ToString(),item.KPILevelCode,oc,"Weekly "
                            };
                            listSendMail.Add(itemSendMail);
                        }
                    }
                    if (month >= 0 && item.Monthly != DateTime.MinValue && item.UpdateDataStatusM == true && item.MonthlyChecked == true)
                    {
                        //Kiem tra period hien tai trong bang data
                        if (CheckExistsData(item.KPILevelCode, "M"))
                        {
                            var itemSendMail = new object[] {
                                item.Title,item.Monthly.ToString("dddd, dd MMMM yyyy"),item.KPILevelCode,oc,"Monthly"
                            };
                            listSendMail.Add(itemSendMail);
                        }

                    }
                    if (quarter >= 0 && item.Quarterly != DateTime.MinValue && item.UpdateDataStatusQ == true && item.QuarterlyChecked == true)
                    {
                        if (CheckExistsData(item.KPILevelCode, "Q"))
                        {
                            var itemSendMail = new object[] {
                                item.Title,item.Quarterly.ToString("dddd, dd MMMM yyyy"),item.KPILevelCode,oc,"Quarterly"
                            };
                            listSendMail.Add(itemSendMail);
                        }
                    }
                    if (year >= 0 && item.Yearly != DateTime.MinValue && item.UpdateDataStatusY == true && item.YearlyChecked == true)
                    {
                        if (CheckExistsData(item.KPILevelCode, "Y"))
                        {
                            var itemSendMail = new object[] {
                                item.Title,item.Yearly.ToString("dddd, dd MMMM yyyy"),item.KPILevelCode,oc,"Yearly"
                            };
                            listSendMail.Add(itemSendMail);
                        }
                    }
                }
            }
            #endregion

            #region 4) Nếu có dữ liệu gửi mail thì lưu vào bảng tag để thông báo đẩy 
            if (listSendMail.Count > 0)
            {
                var notify = new Notification();
                notify.Action = "LateOnUploadData";
                notify.UserID = 1;
                _dbContext.Notifications.Add(notify);
                _dbContext.SaveChanges();
                var listLateOnUploads = new List<LateOnUpLoad>();

                foreach (var it in listEmails)
                {
                    listNotifyDetail.Add(new NotificationDetail
                    {
                        NotificationID = notify.ID,
                        Seen = false,
                        UserID = it.ID,
                    });

                    listSendMail.ForEach(x =>
                    {
                        listLateOnUploads.Add(new LateOnUpLoad
                        {
                            KPIName = x[0].ToString(),
                            Area = x[3].ToString(),
                            Code = x[2].ToString(),
                            Year = x[4].ToString(),
                            DeadLine = x[1].ToString(),
                            UserID = it.ID,
                            NotificationID = notify.ID

                        });
                    });
                }
                _dbContext.NotificationDetails.AddRange(listNotifyDetail);
                _dbContext.SaveChanges();
                _dataService.AddLateOnUploadAsync(listLateOnUploads).Wait();
            }
            #endregion

            return Tuple.Create(listSendMail, listEmails.ToList());
        }

        public Task<PagedList<ActionPlan>> GetAllPaging(string keyword, string lang, int page, int pageSize)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetAllPaging2(string keyword, string lang, int page, int pageSize)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetAllPaging3(string keyword, string lang, int page, int pageSize)
        {
            throw new NotImplementedException();
        }

        public Task<bool> AddAsync(CategoryVM entity)
        {
            throw new NotImplementedException();
        }

        public async Task<object> GetAllActionPlan(int kpilevelID , int userID)
        {
            try
            {
                var userModel = await _dbContext.Users.FirstOrDefaultAsync(x => x.ID == userID);
                var data = await _dbContext.ActionPlans
                    .Where(x => x.KPILevelID == kpilevelID)
                    .Select(x => new
                    {
                        x.ID,
                        x.Title,
                        x.Description,
                        x.Tag,
                        x.ApprovedStatus,
                        x.Deadline,
                        x.UpdateSheduleDate,
                        x.ActualFinishDate,
                        x.Status,
                        x.UserID,
                        x.CommentID,
                        IsBoss = (int?)_dbContext.Roles.FirstOrDefault(a => a.ID == userModel.Permission).ID < 3 ? true : false,
                        CreatedBy = x.UserID,
                        x.Auditor,
                        x.ApprovedBy,
                        ApprovedByName = _dbContext.Users.FirstOrDefault(a => a.ID == x.ApprovedBy).Alias ?? "#N/A",
                        x.CreateTime,
                        Remark = x.Remark ?? "#N/A"

                    })
                    .ToListAsync();
                int index = 1;
               
                var model = data
                .Select(x => new ActionPlanForChart
                {
                    ID = x.ID,
                    Title = x.Title,
                    Description = x.Description,
                    Tag = x.Tag,
                    ApprovedStatus = x.ApprovedStatus,
                    ApprovedStatus2 = x.ApprovedStatus ? "Yes" : "No",
                    Deadline = x.Deadline.ToString("dddd, MMMM d, yyyy"),
                    UpdateSheduleDate = x.UpdateSheduleDate.HasValue ? x.UpdateSheduleDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                    ActualFinishDate = x.ActualFinishDate.HasValue ? x.ActualFinishDate.Value.ToString("dddd, MMMM d, yyyy") : "#N/A",
                    Status = x.Status,
                    Status2 = x.Status ? "Yes" : "No",
                    IsBoss = x.IsBoss,
                    CreatedBy = x.UserID,
                    ListUserIDs = _dbContext.Tags.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                    Auditor = x.Auditor,
                    ListAuditorIDs = _dbContext.ActionPlanDetails.Where(a => a.ActionPlanID == x.ID).Select(a => a.UserID).ToList(),
                    Remark = x.Remark,
                    CreatedByName = _dbContext.Users.Find(x.CreatedBy).Alias ?? "#N/A",
                    ApprovedByNames = x.ApprovedByName,
                    CreatedTimed = x.CreateTime.ToString("MMMM"),
                    CommentID = x.CommentID,
                    Index = index.ToString(),
                    RootCause = _dbContext.Comments.Find(x.CommentID).CommentMsg.Replace("@", "") ?? "#N/A",
                }).ToList();
                model.ForEach(item =>
                {
                    item.Index = index.ToString();
                    index++;
                });
                return new
                {
                    status = true,
                    data = model
                };
            }
            catch (Exception ex)
            {

                return new
                {
                    status = false,
                    message = "No Data"
                };
            }
            
        }

        
    }
}
