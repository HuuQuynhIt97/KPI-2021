import { Component, OnInit } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import {Router, ActivatedRoute } from '@angular/router';
import { NgbModal , NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import  swal  from 'sweetalert2';
import { CookieService } from 'ngx-cookie-service';
import * as moment from 'moment-timezone';
import { Location } from '@angular/common';
import { JwtHelperService } from '@auth0/angular-jwt';
import {PlatformLocation } from '@angular/common';
import { FilterService ,ResizeService   } from '@syncfusion/ej2-angular-treegrid';
import { SortService , ExcelExportService, PdfExportService, ContextMenuService } from '@syncfusion/ej2-angular-treegrid';
import { EditService, PageService, CommandColumnService, CommandModel } from '@syncfusion/ej2-angular-grids';
import { ToolbarService } from '@syncfusion/ej2-angular-grids';
import { EditSettingsModel, IEditCell,CellEditArgs } from '@syncfusion/ej2-angular-grids';
import { DatePipe } from '@angular/common';
import { TemplateRef, ViewChild } from '@angular/core';
import { NgbModalConfig } from '@ng-bootstrap/ng-bootstrap';
import { Subscription } from 'rxjs';
import { environment } from '../../../../../environments/environment';
import { DataService } from '../../../../_core/_services/data.service';
import { AlertifyService } from '../../../../_core/_services/alertify.service';
const httpOptions = {
  headers: new HttpHeaders({
    Authorization: 'Bearer ' + localStorage.getItem('token'),
  })
}
const HttpUploadOptions = {
  headers: new HttpHeaders({ 'Accept': 'application/json' })
}
@Component({
  selector: 'app-dataset',
  templateUrl: './dataset.component.html',
  styleUrls: ['./dataset.component.css'],
  providers: [
    SortService,DatePipe, ToolbarService, PageService, EditService, ExcelExportService, PdfExportService, ContextMenuService,FilterService,
    NgbModalConfig,NgbModal
  ]
})
export class DatasetComponent implements OnInit {
  @ViewChild('comment', { static: true }) comment: TemplateRef<any>;
  @ViewChild('actionplan', { static: true }) actionplan: TemplateRef<any>;
  searchSettings: any = { hierarchyMode: 'Parent' }
  editparams: any = { params: { format: 'n' } }
  contextMenuItems: any = [
    {
      text: 'Add Detail OKR',
      iconCss: ' e-icons e-add',
      target: '.e-content',
      id: 'AddDetailOKR'
    }
  ]
  toolbar: any = [
    'Search',
  ]
  toolbarOptions = ['Search']
  editSettings: any = { allowEditing: true,mode: 'Normal',allowEditOnDblClick: true };
  editing: any = { allowDeconsting: true, allowEditing: true, mode: 'Row', allowEditOnDblClick: true }
  public pageSettings: any = { pageSize: 100 }
  expanded: any = {}
  jwtHelper = new JwtHelperService();
  baseUrl: any = environment.apiUrl
  modalReference1: NgbModalRef
  modalReference2: NgbModalRef
  locale: any = this.cookieService.get('Lang')
  chart: any = {}
  unit: ''
  label: any = ''
  labels: any = []
  targets: any = []
  datasets: any = {}
  period: any = ''
  name: ''
  kpiname: ''
  OwnerManagerment: ''
  Owner: ''
  PIC: ''
  Sponsor: ''
  Participant: ''
  dataremarks: []
  min: number = 1
  stepSize: number = 10
  demoNumber: 100
  counter = Array
  year: number
  start: any
  end: number
  kpilevelcode: number
  catid: any
  changeLog: string[] = [];
  demo: any
  isShow: any = false
  isHide: any = true
  remarkText: any
  actionPlanText: any
  dataUser: string[] = []
  userid: any = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid)
  dataComment: any [] = []
  content: any = null
  commentID: number
  dataID: number
  active: boolean = false
  data: any[] = []
  data2: any[] =[]
  page: any = 1
  pageSize: any = 1000
  keyword: any = ' '
  public dateValue: any = new Date();
  AssignPIC: any = null
  Auditor: any = null
  taskname: string = null
  taskID: any = ''
  description: string = null
  Duedate: any
  TitleEdited: any = ''
  tempTitleDefault: any;
  tempTitleChange: any;
  tempDescriptionDefault: any;
  tempDescriptionChange: any;
  tempRemarkDefault: any;
  tempRemarkChange: any;
  demoo: any = ''
  categoryname: any = ''
  title: any[] = []
  dataActionPlan: any [] = []
  defaultLink: any
  Listentask: any
  ListenCom: any
  constructor(
    private cookieService: CookieService,
    private router: Router,
    private route: ActivatedRoute,
    private http: HttpClient,
    config: NgbModalConfig,
    private modalService: NgbModal,
    private location: Location,
    private platformLocation: PlatformLocation,
    private datePipe: DatePipe,
    private dataService: DataService,
    public alertify : AlertifyService
  ) {
    config.backdrop = 'static';
    config.keyboard = false;
    this.router.routeReuseStrategy.shouldReuseRoute = () => false;
  }

  ngOnInit(): void {
    this.LoadDataset()
    this.ListenGettask();
    this.ListenGetComment();
    this.period = this.route.snapshot.params.period
    this.catid =  this.route.snapshot.params.catid
    this.start = this.route.snapshot.params.start
    this.end = this.route.snapshot.params.end
    this.year = this.route.snapshot.params.year
    this.defaultLink = `/Dataset/${this.route.snapshot.params.catid}/${this.route.snapshot.params.period}/${this.route.snapshot.params.start}/${this.route.snapshot.params.end}/${this.route.snapshot.params.year}`
  }
  ListenGettask(){
    this.Listentask = this.dataService.currentMessage.subscribe((res: any) => {
       let comID = this.route.snapshot.params.comID
       this.commentID = this.route.snapshot.params.comID
       this.dataID = this.route.snapshot.params.dataID
       let dataID = this.route.snapshot.params.dataID
       let title = this.route.snapshot.params.title
       let type = this.route.snapshot.params.type
       let period = this.route.snapshot.params.period;
       if (comID > 0 && dataID > 0 && title !== '' && type === 'task') {
         this.modalActionPlan(this.actionplan)
         this.loadDataComment(dataID)
         this.LoadDataActionPlan(dataID,comID)
         this.actionPlanText = title.replace(/-/g, ' ')  + ' - '
         + ' KPI Chart '
         + ' - ' + res.KPIName
         + ' - ' + this.convertPeriod(period, false)
         this.remarkText = this.actionPlanText.replace('Action Plan', 'Remark')
         this.remark(dataID)
       }
     })
  }
  ListenGetComment(){
  this.ListenCom = this.dataService.currentMessage.subscribe((data: any)=>{
      let comID = this.route.snapshot.params.comID
      this.commentID = this.route.snapshot.params.comID
      this.dataID = this.route.snapshot.params.dataID
      let dataID = this.route.snapshot.params.dataID
      let title = this.route.snapshot.params.title
      let type = this.route.snapshot.params.type
      let period = this.route.snapshot.params.period;
      if (comID > 0 && dataID > 0 && title !== '' && type === 'remark') {
        this.modalComment(this.comment)
        this.loadDataComment(dataID)
        this.LoadDataActionPlan(dataID,comID)
        this.remarkText = data.Title
        this.actionPlanText = this.remarkText.replace('Remark', 'Action Plan')
        this.remark(dataID)
      }
    })
  }
  convertPeriod(period, status = true) {
    if (status) {
      switch (period) {
        case 'm':
          return 'Months In Year';
        case 'w':
          return 'Weeks In Year';
        case 'q':
          return 'Quarters In Year';
        case 'y':
          return 'Years In Year';
      }
    } else {
      switch (period) {
        case 'm':
          return 'Monthly';
        case 'w':
          return 'Weekly';
        case 'q':
          return 'Quarterly';
        case 'y':
          return 'Yearly';
      }
    }

    return 'N/A';
  }
  LoadDataset(){
    this.http.get(this.baseUrl + `Dataset/getalldatabycategory/${this.route.snapshot.params.catid}/${this.route.snapshot.params.period}/${this.route.snapshot.params.start}/${this.route.snapshot.params.end}/${this.route.snapshot.params.year}`)
    .subscribe((res: any)=>{
      this.data = res
      this.data2 = res[0].Datasets
      this.datasets =res[0].Datasets
      this.categoryname = res[0].CategoryName
      this.kpiname = res[0].KPIName
      this.unit = res.Unit
      this.kpilevelcode = res[0].KPILevelCode
      this.PIC = res.PIC;
      this.Owner = res.Owner;
      this.OwnerManagerment = res.OwnerManagerment;
      this.Sponsor = res.Sponsor;
      this.Participant = res.Participant;
      this.LoadTitle()
    })
  }
  convertNumberMonthToText(period) {
    switch (period) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
    }
    return 'N/A';
  }
  LoadTitle() {
    switch (this.route.snapshot.params.period) {
      case 'w':
        this.title = this.data2.map(x => {
          return x.Week;
        });
        break;
      case 'm':
        this.title = this.data2.map(x => {
          return this.convertNumberMonthToText(x.Week);
        });
        break;
      case 'q':
        this.title = this.data2.map(x => {
          return 'Quarter ' + x.Week;
        });
        break;

      case 'y':
        this.title = this.data2.map(x => {
          return 'Year ' + x.Week;
        });
        break;
    }
  }
  vyear(event): void{
    const newYear = event.target.value
    this.router.navigate(['/Dataset',this.catid,this.period,this.start,this.end,newYear])
    this.LoadDataset();
  }
  vstart(event): void{
    let newStart = event.target.value
    this.router.navigate(['/Dataset',this.catid,this.period,newStart,this.end,this.year])
    this.LoadDataset();
  }
  vend(event): void{
    let newEnd = event.target.value
    this.router.navigate(['/Dataset',this.catid,this.period,this.start,newEnd,this.year])
    this.LoadDataset();
  }
  DeadlineChange(args){
    const deadline = this.datePipe.transform(args.value, 'MM/dd/yyyy')
    const formData = new FormData()
    formData.append('name', 'DeadLine')
    formData.append('value', deadline)
    formData.append('pk', this.taskID)
    formData.append('userid', this.userid)
    this.http.post(this.baseUrl + 'ChartPeriod/UpdateSheduleDate',formData,HttpUploadOptions).subscribe((res: any)=>{
      this.alertify.success('Update Deadline successfully')
      this.LoadDataActionPlan(this.dataID , this.commentID)
    })
  }
  DeadlineUpdateChange(args){
    const deadlineUpdate = this.datePipe.transform(args.value, 'MM/dd/yyyy')
    const formData = new FormData()
    formData.append('name', 'UpdateSheduleDate')
    formData.append('value', deadlineUpdate)
    formData.append('pk', this.taskID)
    formData.append('userid', this.userid)
    this.http.post(this.baseUrl + 'ChartPeriod/UpdateSheduleDate',formData,HttpUploadOptions).subscribe((res: any)=>{
      this.alertify.success('Update Deadline successfully')
      this.LoadDataActionPlan(this.dataID , this.commentID)
    })
  }
  backComment(comment){
    this.modalReference2.close()
    this.modalComment(comment)
  }
  DeleteComment(id){
    this.alertify.confirm('Delete comment' , "Are you sure? You won't be able to revert this!" , () => {
      this.http.get(this.baseUrl + `ChartPeriod/DeleteComment2/${id}`,httpOptions)
      .subscribe((res: any)=>{
        this.alertify.success('Comment has been deleted')
        this.loadDataComment(this.dataID)
      })
    })
  }
  deleteActionPlan(id){
    this.alertify.confirm('Delete Action Plan' , "Are you sure? You won't be able to revert this!" , () => {
      this.http.get(this.baseUrl + `ChartPeriod/Delete/${id}`,httpOptions)
      .subscribe((res: any)=>{
        this.alertify.success('ActionPlan has been deleted')
        this.LoadDataActionPlan(this.dataID,this.commentID)
      })
    })
  }
  done(data){
    let data2 = {
      id: data.ID,
      userid: this.userid,
      KPILevelCode: this.kpilevelcode,
      CategoryID: this.catid,
      url: location.origin + '/#' + this.router.url
    }
    if(!data.Status === true){
      this.http.post(this.baseUrl + 'ChartPeriod/Done',data2)
      .subscribe((res: any)=>{
        this.alertify.success('successfully')
        this.LoadDataActionPlan(this.dataID,this.commentID)
      })
    }
    else{
      this.http.post(this.baseUrl + 'ChartPeriod/Done',data2)
      .subscribe((res: any)=>{
        this.alertify.success('Cancel successfully')
        this.LoadDataActionPlan(this.dataID,this.commentID)
      })
    }
  }
  approval(data){
    let data2 = {
      id: data.ID,
      approveby: this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid,
      KPILevelCode: this.route.snapshot.params.kpilevelcode,
      CategoryID: Number(this.route.snapshot.params.catid)
    }
    if(!data.ApprovedStatus === true){
      this.http.post(this.baseUrl + 'ChartPeriod/Approval',data2)
      .subscribe((res: any)=>{
        this.alertify.success('Approved successfully')
        this.LoadDataActionPlan(this.dataID,this.commentID)
      })
    }
    else{
      this.http.post(this.baseUrl + 'ChartPeriod/Approval',data2)
      .subscribe((res: any)=>{
        this.alertify.success('Cancel Approval successfully')
        this.LoadDataActionPlan(this.dataID,this.commentID)
      })
    }
  }
  actionBegin(args){
    if (args.requestType === 'beginEdit') {
      this.tempTitleDefault = args.rowData.Title
      this.tempDescriptionDefault = args.rowData.Description
      this.tempRemarkDefault = args.rowData.Remark
    }
    if (args.requestType === 'save') {
      this.tempTitleChange = args.data.Title;
      this.tempDescriptionChange = args.data.Description
      this.tempRemarkChange = args.data.Remark
      let TitleChange = this.tempTitleDefault.length < this.tempTitleChange.length
      || this.tempTitleDefault.length > this.tempTitleChange.length;
      let DescriptionChange = this.tempDescriptionDefault.length < this.tempDescriptionChange.length
      || this.tempDescriptionDefault.length > this.tempDescriptionChange.length;
      let RemarkChange = this.tempRemarkDefault.length < this.tempRemarkChange.length
      || this.tempRemarkDefault.length > this.tempRemarkChange.length;

      if (TitleChange) {
        const formData = new FormData()
        formData.append('name', 'Title')
        formData.append('value', this.tempTitleChange)
        formData.append('pk', this.taskID)
        formData.append('userid', this.userid)
        this.http.post(this.baseUrl + 'ChartPeriod/UpdateSheduleDate',formData,HttpUploadOptions).subscribe((res: any)=>{
          this.alertify.success('Update Title successfully')
          this.LoadDataActionPlan(this.dataID , this.commentID)
        })
      }
      if (DescriptionChange) {
        const formData = new FormData()
        formData.append('name', 'Description')
        formData.append('value', this.tempDescriptionChange)
        formData.append('pk', this.taskID)
        formData.append('userid', this.userid)
        this.http.post(this.baseUrl + 'ChartPeriod/UpdateSheduleDate',formData,HttpUploadOptions).subscribe((res: any)=>{
          this.alertify.success('Update Description successfully')
          this.LoadDataActionPlan(this.dataID , this.commentID)
        })
      }
      if (RemarkChange) {
        const formData = new FormData()
        formData.append('name', 'Remark')
        formData.append('value', this.tempRemarkChange)
        formData.append('pk', this.taskID)
        formData.append('userid', this.userid)
        this.http.post(this.baseUrl + 'ChartPeriod/UpdateSheduleDate',formData,HttpUploadOptions).subscribe((res: any)=>{
          this.alertify.success('Update Remark successfully')
          this.LoadDataActionPlan(this.dataID , this.commentID)
        })
      }
    }
    if(args.requestType === 'refresh'){
      this.taskID = null
    }
    else{
      this.taskID = args.rowData.ID
    }
  }
  openComment(event,item,comment){
    if (event.toElement.classList[2] === 'active-td') {
      let number = Number(event.toElement.textContent),
      value = Number(event.toElement.cellIndex),
      period = this.route.snapshot.params.period;
      this.modalComment(comment)
      this.dataID = item.ID
      let id = item.ID;
      const monthNames = ['January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ];
      this.remarkText = 'Remark on '
      + monthNames[value - 1]
      + ' - ' + this.kpiname
      + ' - '
      + this.convertPeriod(this.period, false)
      this.remark(id)
      this.loadDataComment(id)
    }
  }
  modalComment(comment){
    this.modalReference1 = this.modalService.open(comment,{ size: 'xl' })
  }
  loadDataComment(id){
    this.http.get(this.baseUrl + `ChartPeriod/LoadDataComment/${id}/${this.userid}`)
    .subscribe((res: any)=>{
      this.dataComment = res.data
    })
  }
  LoadDataActionPlan(dataid, commentid){
    this.http.post(this.baseUrl + `ChartPeriod/getallpaging/${dataid}/${commentid}/${this.userid}/${this.keyword}/${this.page}/${this.pageSize}`,httpOptions)
    .subscribe((res: any)=>{
      this.dataActionPlan = res.data
    })
  }
  modalActionPlan(actionplan){
    this.modalReference2 = this.modalService.open(actionplan,{ size: 'xl' } )
  }
  modalclose(){
    this.modalReference1.close()
    this.LoadDataset()
    this.ListenCom.unsubscribe()
    this.router.navigate(['/Dataset',this.catid,this.period,this.start,this.end,this.year])
  }
  modalclose2(){
    this.modalReference2.close()
    this.LoadDataset()
    this.Listentask.unsubscribe()
    this.router.navigate(['/Dataset',this.catid,this.period,this.start,this.end,this.year])
  }
  openActionPlan(item,actionplan){
    this.commentID = item.CommentID
    this.actionPlanText = this.remarkText.replace('Remark', 'Action Plan')
    this.modalReference1.close()
    this.modalActionPlan(actionplan)
    this.LoadDataActionPlan(this.dataID,this.commentID)
    this.LoadDataset()
  }
  remark(id){
    this.http.get(this.baseUrl + `ChartPeriod/Remark/${id}`)
    .subscribe((res: any)=>{
      this.dataUser = res.users
    })
  }
  addcomment(){
    if (this.content === null) {
      this.alertify.error('Please enter message!!')
      return;
    }
    let list: any = [];
      for (let item of this.content.split(' ')) {
        let x = item.match(/\@.+/g)
        if (x !== null)
          list.push(x.toString().replace('@@', ' ').trim());
        }
      const Tags = [new Set(list.map(x => x))].join();
      const mObj = {
        DataID: this.dataID,
        CommentMsg: this.content,
        UserID: this.userid,
        Tag: Tags,
        Link: location.origin + '/#' + this.router.url,
        Title: this.remarkText,
        KPILevelCode: this.kpilevelcode,
        CategoryID: Number(this.route.snapshot.params.catid),
        DefaultLink: this.defaultLink
      }
      this.http.post(this.baseUrl + 'ChartPeriod/AddComment',mObj)
      .subscribe((res: any)=>{
        this.alertify.success('Add Comment Successfully')
        this.content = ''
        this.loadDataComment(this.dataID)
      })
  }
  onChange(args,dateValue){
    this.dateValue = this.datePipe.transform(args.value, 'MM-dd-yyyy')
  }
  addActionPlan(actionplan){
    this.dateValue = this.datePipe.transform(this.dateValue, 'MM-dd-yyyy')
    const Tag : any = []
    for (const item of this.AssignPIC.split(' ')) {
      const x = item.match(/\@.+/g)
      if(x !== null){
        Tag.push(x.toString().replace('@', ' ').trim());
      }
    }
    const Tags = [new Set(Tag.map(x => x))].join()

    const Auditors: any = []
    for (const item of this.Auditor.split(' ')) {
      const x = item.match(/\@.+/g)
      if(x !== null){
        Auditors.push(x.toString().replace('@', ' ').trim());
      }
    }
    const KPILevelCodeAndPeriods = this.kpilevelcode + this.route.snapshot.params.period
    const Auditorr = [new Set(Auditors.map(x => x))].join()
    const obj = {
      UserID: this.userid,
      DataID: this.dataID,
      CommentID: this.commentID,
      Title: this.taskname,
      Tag: Tags,
      KPILevelCodeAndPeriod: KPILevelCodeAndPeriods,
      Description: this.description,
      Deadline: this.dateValue,
      SubmitDate: this.datePipe.transform( new Date(), 'dd/MM/yyyy'),
      Link: location.origin + '/#' + this.router.url,
      Subject: this.actionPlanText,
      Auditor: Auditorr,
      CategoryID: Number(this.route.snapshot.params.catid),
      KPILevelCode: this.kpilevelcode,
      DefaultLink: this.defaultLink
    };
    this.http.post(this.baseUrl + 'ChartPeriod/Add' , obj)
    .subscribe((res: any)=>{
      if(res.status === true){
        this.LoadDataActionPlan(this.dataID,this.commentID)
        this.alertify.success('Add ActionPlan successfully')
        this.modalReference2.close()
        this.modalActionPlan(actionplan)
      }
      else {
        if (res.message !== '') {
          this.alertify.error('You are not Owner this KPI !')
       } else {
         this.alertify.error('You are not Owner this KPI !')
       }
      }
    })
  }
}
