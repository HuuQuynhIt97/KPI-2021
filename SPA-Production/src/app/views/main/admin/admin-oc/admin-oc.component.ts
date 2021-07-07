import { Component, OnInit,ViewChild } from '@angular/core';
import { TreeGridComponent } from '@syncfusion/ej2-angular-treegrid';
import { FilterService } from '@syncfusion/ej2-angular-treegrid';
import { SortService, EditService, ExcelExportService, PdfExportService, ContextMenuService } from '@syncfusion/ej2-angular-treegrid';
import { NgbModal , NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import { CookieService } from 'ngx-cookie-service';
import { QueryCellInfoEventArgs,ToolbarService, PageService, ResizeService } from '@syncfusion/ej2-angular-grids';
import { Tooltip } from '@syncfusion/ej2-popups';
import { JwtHelperService } from '@auth0/angular-jwt';
import { SwitchComponent } from '@syncfusion/ej2-angular-buttons';
import { DatePipe } from '@angular/common';
import { environment } from '../../../../../environments/environment';
import { DataService } from '../../../../_core/_services/data.service';
import { AdminOcService } from '../../../../_core/_services/admin-oc.service';
import { AlertifyService } from '../../../../_core/_services/alertify.service';

@Component({
  selector: 'app-admin-oc',
  templateUrl: './admin-oc.component.html',
  styleUrls: ['./admin-oc.component.css'],
  providers:[
    ResizeService,
    SortService,ToolbarService,DatePipe,PageService,EditService,ExcelExportService,PdfExportService,ContextMenuService,FilterService
  ]
})
export class AdminOCComponent implements OnInit {
  @ViewChild('switch')
  public switch: SwitchComponent;
  jwtHelper = new JwtHelperService();
  baseUrl: string = environment.apiUrl
  modalReference: NgbModalRef
  searchSettings: any = { hierarchyMode: 'Parent' }
  public treegrid: TreeGridComponent
  editparams: any = { params: { format: 'n' } }
  contextMenuItems: any = [
    {
      text: 'Add Sub OC',
      iconCss: ' e-icons e-edit',
      target: '.e-content',
      id: 'Add-Child-OC'
    },
    {
      text: 'Delete',
      iconCss: ' e-icons e-delete',
      target: '.e-content',
      id: 'DeleteOC'
    }
  ]
  toolbar: any = [
    'ExpandAll',
    'CollapseAll',
  ]
  toolbarOptions = ['Search']
  toolbarScoreOptions = ['Add','Cancel','Search']
  editing: any = { allowDeleting: false, allowEditing: false, mode: 'Row' }
  public pageSettings: any = { pageSize: 100 }
  public pageSettings2: any = { pageSize: 10 }
  expanded: any = {}
  data: any[] = []
  data2: any[] = []
  page: number = 1
  pageSize: number = 1000
  locale: string = this.cookieService.get('Lang')
  levelid: number = 0
  ocId: number = 0
  category: number = 0
  title: string
  isHide: boolean = false
  workweekly: any
  workmonthly: any
  workquaterly: any
  workhalfyear: any
  workyearly: any
  weekpublic: boolean = true
  monthpublic: boolean = true
  halfpublic: boolean = true
  quaterpublic: boolean = true
  yearpublic: boolean = true
  weekprivate: any
  monthprivate: any
  halfprivate: any
  quaterprivate: any
  yearprivate: any
  ID: number
  KPIID: any
  LevelID: any
  dayweekly: any
  public dateValue: any
  public dayquater: any
  public dateHalf: any
  public dayyear: any
  userid: number = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid)
  lines: string = 'Both'
  dataConversion: object
  editSettings: any =  { allowAdding: true, allowDeleting: false, allowEditing: true, mode: 'Normal',allowEditOnDblClick: true }
  KPILevel_Code: any;
  KPILevel_ID: any;
  constructor(
    private datePipe: DatePipe,
    private cookieService: CookieService,
    private modalService: NgbModal,
    private dataService: DataService,
    private adminOcService: AdminOcService,
    public alertify : AlertifyService
  ) { }

  ngOnInit(): void {
    setTimeout(()=>{
      this.getOc()
    },300)
  }

  No(index){
    return parseFloat(index) + 1
  }

  actionBeginScore(args){
    if (args.requestType === "save") {
      if (args.action === "edit") {
         const mObj = {
          ID : args.data.ID,
          Score: args.data.Score,
          Min: args.data.Min,
          Max: args.data.Max,
          KPILevel_Code: args.data.KPILevel_Code
        }
        this.adminOcService.UpdateScorePerfomanceData(mObj).subscribe(res => {
          if(res) {
            this.alertify.success('successfully')
          }
        })
      }
      if (args.action === "add") {
        const mObj = {
          Score: args.data.Score,
          Min: args.data.Min,
          Max: args.data.Max,
          KPILevel_Code: this.KPILevel_Code,
          KPILevel_ID: this.KPILevel_ID
        }
        this.adminOcService.AddScorePerfomance(mObj).subscribe((res: any) => {
          if(res) {
            this.alertify.success('successfully')
            this.dataConversion = res.data
          }
        })
      }
    }
  }

  conversions(data, modal){
    this.modalReference = this.modalService.open(modal,{size: 'xl'})
    this.KPILevel_Code = data.KPILevelCode
    this.KPILevel_ID = data.ID
    this.LoadDataPerfomance(data);
  }
  LoadDataPerfomance(data) {
    this.adminOcService.LoadDataPerfomance(data.KPILevelCode).subscribe((res: any) => {
      this.dataConversion = res.data;
    })
  }
  modify(data,showdata){
    this.modalModify(showdata)
    this.loadDetail(data.ID)
  }

  rowSelected(args){
    this.title = '- ' + args.data.title
    this.levelid = args.data.key
    this.ocId = args.data.key
    this.dataService.currentSourceLang.subscribe((res: any) =>{
      this.locale = res
      this.loadDataKPILevel()
    })
    this.isHide = true
  }

  getOc(){
    this.adminOcService.getOc(this.userid)
    .subscribe((res: any)=>{
      this.data = res
    })
  }
  loadDataKPILevel(){
    this.adminOcService.loadDataKPILevel(this.levelid,this.category,this.locale,this.page,this.pageSize)
      .subscribe((res: any)=>{
        this.data2 = res.data
    })
  }
  addOCCategory(data){
    if(data.Status === true){
      this.adminOcService.addOCCategory(this.ocId,data.ID)
      .subscribe((res: any)=>{
        this.alertify.success('Uncheck successfully')
        this.loadDataKPILevel()
      })
    }
    else{
      this.adminOcService.addOCCategory(this.ocId,data.ID)
      .subscribe((res: any)=>{
      this.alertify.success('Add successfully')
      this.loadDataKPILevel()
    })
    }
  }
  tooltip(args: QueryCellInfoEventArgs) {
    const tooltip: Tooltip = new Tooltip({
        content: args.data[args.column.field].toString()
    }, args.cell as HTMLTableCellElement);
  }
  // update
  update(data){
    const mObj = {
      ID : data.ID,
      KPIID: data.KPIID,
      KPILevelCode: '',
      UserCheck: Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid),
      Checked: !data.Checked,
      WeeklyChecked: null,
      MonthlyChecked: null,
      HalfYearChecked: null,
      QuarterlyChecked: null,
      YearlyChecked: null,
      Weekly: null,
      Monthly: null,
      HalfYear: null,
      Quarterly: null,
      Yearly: null,
      TimeCheck: null,
      LevelID: data.LevelID,
      WeeklyPublic: null,
      MonthlyPublic: null,
      HalfYearPublic: null,
      QuarterlyPublic: null,
      YearlyPublic: null,
      Target: '',
      Period:'',
      ModifyBy: localStorage.getItem('user')
    }
    if(mObj.Checked === true){
      this.adminOcService.update(mObj)
      .subscribe((res: any) => {
        this.alertify.success('Add successfully')
        this.loadDataKPILevel()
      })
    }
    else{
      this.adminOcService.update(mObj)
      .subscribe((res: any) => {
        this.alertify.success('Uncheck successfully')
        this.loadDataKPILevel()
      })
    }
  }

  updateweekly(data,weekly){
    const mObj = {
      ID : data.ID,
      KPIID: data.KPIID,
      KPILevelCode: '',
      UserCheck: Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid),
      Checked: null,
      WeeklyChecked: !data.WeeklyChecked,
      MonthlyChecked: null,
      HalfYearChecked: null,
      QuarterlyChecked: null,
      YearlyChecked: null,
      Weekly: null,
      Monthly: null,
      HalfYear: null,
      Quarterly: null,
      Yearly: null,
      TimeCheck: new Date(),
      LevelID: data.LevelID,
      WeeklyPublic: null,
      MonthlyPublic: null,
      HalfYearPublic: null,
      QuarterlyPublic: null,
      YearlyPublic: null,
      Target: '',
      Period:''
    }
    if(mObj.WeeklyChecked === true){
      this.modalWeekly(weekly)
      this.loadDetail(mObj.ID)
    }
    if(mObj.WeeklyChecked === true){
      this.adminOcService.update(mObj)
      .subscribe((res: any)=>{
        this.alertify.success('Add successfully')
        this.loadDataKPILevel()
      })
    }
    else{
      this.adminOcService.update(mObj)
      .subscribe((res: any)=>{
        this.alertify.success('Uncheck successfully')
        this.loadDataKPILevel()
      })
    }
  }

  updatemonthly(data,monthly){
    const mObj = {
      ID : data.ID,
      KPIID: data.KPIID,
      KPILevelCode: '',
      UserCheck: Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid),
      Checked: null,
      WeeklyChecked: null,
      MonthlyChecked: !data.MonthlyChecked,
      HalfYearChecked: null,
      QuarterlyChecked: null,
      YearlyChecked: null,
      Weekly: null,
      Monthly: null,
      HalfYear: null,
      Quarterly: null,
      Yearly: null,
      TimeCheck: new Date(),
      LevelID: data.LevelID,
      WeeklyPublic: null,
      MonthlyPublic: null,
      HalfYearPublic: null,
      QuarterlyPublic: null,
      YearlyPublic: null,
      Target: '',
      Period:''
    }
    if(mObj.MonthlyChecked === true){
      this.modalMonthly(monthly)
      this.loadDetail(mObj.ID)
    }
    if(mObj.MonthlyChecked === true){
      this.adminOcService.update(mObj)
      .subscribe(()=>{
        this.alertify.success('Add successfully')
        this.loadDataKPILevel()
      })
    }
    else{
      this.adminOcService.update(mObj)
      .subscribe(()=>{
        this.alertify.success('Uncheck successfully')
        this.loadDataKPILevel()
      })
    }
  }

  updatehalfyear(data,halfyear){
    const mObj = {
      ID : data.ID,
      KPIID: data.KPIID,
      KPILevelCode: '',
      UserCheck: Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid),
      Checked: null,
      WeeklyChecked: null,
      MonthlyChecked: null,
      HalfYearChecked: !data.HalfYearChecked,
      QuarterlyChecked: null,
      YearlyChecked: null,
      Weekly: null,
      Monthly: null,
      HalfYear: null,
      Quarterly: null,
      Yearly: null,
      TimeCheck: new Date(),
      LevelID: data.LevelID,
      WeeklyPublic: null,
      MonthlyPublic: null,
      HalfYearPublic: null,
      QuarterlyPublic: null,
      YearlyPublic: null,
      Target: '',
      Period:''
    }
    if(mObj.HalfYearChecked === true){
      this.modalHalfyear(halfyear)
      this.loadDetail(mObj.ID)
    }
    if(mObj.HalfYearChecked === true){
      this.adminOcService.update(mObj)
      .subscribe(()=>{
        this.alertify.success('Add successfully')
        this.loadDataKPILevel()
      })
    }
    else{
      this.adminOcService.update(mObj)
      .subscribe(()=>{
        this.alertify.success('Uncheck successfully')
        this.loadDataKPILevel()
      })
    }
  }

  updatequaterly(data,quaterly){
    const mObj = {
      ID : data.ID,
      KPIID: data.KPIID,
      KPILevelCode: '',
      UserCheck: Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid),
      Checked: null,
      WeeklyChecked: null,
      MonthlyChecked: null,
      HalfYearChecked: null,
      QuarterlyChecked: !data.QuarterlyChecked,
      YearlyChecked: null,
      Weekly: null,
      Monthly: null,
      HalfYear: null,
      Quarterly: null,
      Yearly: null,
      TimeCheck: new Date(),
      LevelID: data.LevelID,
      WeeklyPublic: null,
      MonthlyPublic: null,
      HalfYearPublic: null,
      QuarterlyPublic: null,
      YearlyPublic: null,
      Target: '',
      Period:''
    }
    if(mObj.QuarterlyChecked === true){
      this.modalQuaterly(quaterly)
      this.loadDetail(mObj.ID)
    }
    if(mObj.QuarterlyChecked === true){
      this.adminOcService.update(mObj)
      .subscribe(()=>{
        this.alertify.success('Add successfully')
        this.loadDataKPILevel()
      })
    }
    else{
      this.adminOcService.update(mObj)
      .subscribe(()=>{
        this.alertify.success('Uncheck successfully')
        this.loadDataKPILevel()
      })
    }
  }

  updateyearly(data,yearly){
    const mObj = {
      ID : data.ID,
      KPIID: data.KPIID,
      KPILevelCode: '',
      UserCheck: Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid),
      Checked: null,
      WeeklyChecked: null,
      MonthlyChecked: null,
      HalfYearChecked: null,
      QuarterlyChecked: null,
      YearlyChecked: !data.YearlyChecked,
      Weekly: null,
      Monthly: null,
      HalfYear: null,
      Quarterly: null,
      Yearly: null,
      TimeCheck: new Date(),
      LevelID: data.LevelID,
      WeeklyPublic: null,
      MonthlyPublic: null,
      HalfYearPublic: null,
      QuarterlyPublic: null,
      YearlyPublic: null,
      Target: '',
      Period:''
    }
    if(mObj.YearlyChecked === true){
      this.modalYearly(yearly)
      this.loadDetail(mObj.ID)
    }
    if(mObj.YearlyChecked === true){
      this.adminOcService.update(mObj)
      .subscribe(()=>{
        this.alertify.success('Add successfully')
        this.loadDataKPILevel()
      })
    }
    else{
      this.adminOcService.update(mObj)
      .subscribe(()=>{
        this.alertify.success('Uncheck successfully')
        this.loadDataKPILevel()
      })
    }
  }

  // save
  saveWeekly(){
    const mObj = {
      ID : this.ID,
      KPIID: this.KPIID,
      KPILevelCode: '',
      UserCheck: Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid),
      Checked: null,
      WeeklyChecked: null,
      MonthlyChecked: null,
      HalfYearChecked: null,
      QuarterlyChecked: null,
      YearlyChecked: null,
      Weekly: this.dayweekly,
      Monthly: null,
      HalfYear: null,
      Quarterly: null,
      Yearly: null,
      TimeCheck: new Date(),
      LevelID: this.LevelID,
      WeeklyPublic: this.weekpublic,
      MonthlyPublic: null,
      HalfYearPublic: null,
      QuarterlyPublic: null,
      YearlyPublic: null,
      Target: this.workweekly,
      Period:'W'
    }
    this.adminOcService.update(mObj)
    .subscribe(()=>{
      this.alertify.success('Add Weekly successfully')
      this.modalReference.close()
    })
  }

  saveMonthly(){
    const mObj = {
      ID : this.ID,
      KPIID: this.KPIID,
      KPILevelCode: '',
      UserCheck: Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid),
      Checked: null,
      WeeklyChecked: null,
      MonthlyChecked: null,
      HalfYearChecked: null,
      QuarterlyChecked: null,
      YearlyChecked: null,
      Weekly: null,
      Monthly: this.dateValue,
      HalfYear: null,
      Quarterly: null,
      Yearly: null,
      TimeCheck: new Date(),
      LevelID: this.LevelID,
      WeeklyPublic: null,
      MonthlyPublic: this.monthpublic,
      HalfYearPublic: null,
      QuarterlyPublic: null,
      YearlyPublic: null,
      Target: this.workmonthly,
      Period:'M'
    }
    this.adminOcService.update(mObj)
    .subscribe(()=>{
      this.alertify.success('Add Monthly successfully')
      this.modalReference.close()
    })
  }

  saveHalfYear(){
    const mObj = {
      ID : this.ID,
      KPIID: this.KPIID,
      KPILevelCode: '',
      UserCheck: Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid),
      Checked: null,
      WeeklyChecked: null,
      MonthlyChecked: null,
      HalfYearChecked: null,
      QuarterlyChecked: null,
      YearlyChecked: null,
      Weekly: null,
      Monthly: null,
      HalfYear: this.dateHalf,
      Quarterly: null,
      Yearly: null,
      TimeCheck: new Date(),
      LevelID: this.LevelID,
      WeeklyPublic: null,
      MonthlyPublic: null,
      HalfYearPublic: this.halfpublic,
      QuarterlyPublic: null,
      YearlyPublic: null,
      Target: this.workhalfyear,
      Period:'M'
    }
    this.adminOcService.update(mObj)
    .subscribe(()=>{
      this.alertify.success('Add Monthly successfully')
      this.modalReference.close()
    })
  }

  saveQuaterly(){
    const mObj = {
      ID : this.ID,
      KPIID: this.KPIID,
      KPILevelCode: '',
      UserCheck: Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid),
      Checked: null,
      WeeklyChecked: null,
      MonthlyChecked: null,
      HalfYearChecked: null,
      QuarterlyChecked: null,
      YearlyChecked: null,
      Weekly: null,
      Monthly: null,
      HalfYear: null,
      Quarterly: this.dayquater,
      Yearly: null,
      TimeCheck: new Date(),
      LevelID: this.LevelID,
      WeeklyPublic: null,
      MonthlyPublic: null,
      HalfYearPublic: null,
      QuarterlyPublic: this.quaterpublic,
      YearlyPublic: null,
      Target: this.workquaterly,
      Period:'Q'
    }
    this.adminOcService.update(mObj)
    .subscribe(()=>{
      this.alertify.success('Add Quaterly successfully')
      this.modalReference.close()
    })
  }

  saveYearly(){
    const mObj = {
      ID : this.ID,
      KPIID: this.KPIID,
      KPILevelCode: '',
      UserCheck: Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid),
      Checked: null,
      WeeklyChecked: null,
      MonthlyChecked: null,
      HalfYearChecked: null,
      QuarterlyChecked: null,
      YearlyChecked: null,
      Weekly: null,
      Monthly: null,
      HalfYear: null,
      Quarterly: null,
      Yearly: this.dayyear,
      TimeCheck: new Date(),
      LevelID: this.LevelID,
      WeeklyPublic: null,
      MonthlyPublic: null,
      HalfYearPublic: null,
      QuarterlyPublic: null,
      YearlyPublic: this.yearpublic,
      Target: this.workyearly,
      Period:'Y'
    }
    this.adminOcService.update(mObj)
    .subscribe(()=>{
      this.alertify.success('Add Yearly successfully')
      this.modalReference.close()
    })
  }

  loadDetail(id){
    this.adminOcService.loadDetail(id)
    .subscribe((res: any) => {
      this.ID = res.data.ID
      this.KPIID = res.data.KPIID
      this.LevelID = res.data.LevelID

      this.weekpublic = res.data.WeeklyPublic
      this.monthpublic = res.data.MonthlyPublic
      this.halfpublic = res.data.HalfYearPublic
      this.quaterpublic = res.data.QuarterlyPublic
      this.yearpublic = res.data.YearlyPublic

      this.dayweekly = res.data.Weekly
      this.dateValue = this.convertDateJson(res.data.Monthly)
      this.dateHalf = this.convertDateJson(res.data.HalfYear)
      this.dayquater = this.convertDateJson(res.data.Quarterly)
      this.dayyear = this.convertDateJson(res.data.Yearly)

      this.workweekly = res.WorkingPlanOfWeekly
      this.workmonthly = res.WorkingPlanOfMonthly
      this.workhalfyear = res.WorkingPlanOfHalfYear
      this.workquaterly = res.WorkingPlanOfQuarterly
      this.workyearly = res.WorkingPlanOfYearly
    })
  }

  convertDateJson(d) {
    const date = new Date(d|| new Date());
    const dd = String(date.getDate()).padStart(2, '0');
    const mm = String(date.getMonth() + 1).padStart(2, '0');
    const yyyy = date.getFullYear();
    return mm + '/' + dd + '/' + yyyy;
  }

  // checkPublic
  CheckWeekPublic($event){
    this.weekpublic = $event.event.isTrusted
    this.weekprivate = !$event.event.isTrusted
  }

  CheckMonthPublic($event){
    this.monthpublic= $event.event.isTrusted
    this.monthprivate = !$event.event.isTrusted
  }

  CheckHalfPublic($event){
    this.halfpublic= $event.event.isTrusted
    this.halfprivate = !$event.event.isTrusted
  }

  CheckQuaterPublic($event){
    this.quaterpublic= $event.event.isTrusted
    this.quaterprivate = !$event.event.isTrusted
  }

  CheckYearPublic($event){
    this.yearpublic= $event.event.isTrusted
    this.yearprivate = !$event.event.isTrusted
  }

  // checkPrivate
  CheckPrivateW($event){
    this.weekpublic = !$event.event.isTrusted
    this.weekprivate = $event.event.isTrusted

  }

  CheckPrivateM($event){
    this.monthpublic = !$event.event.isTrusted
    this.monthprivate = $event.event.isTrusted
  }

  CheckPrivateH($event){
    this.halfpublic = !$event.event.isTrusted
    this.halfprivate = $event.event.isTrusted
  }

  CheckPrivateQ($event){
    this.quaterpublic = !$event.event.isTrusted
    this.quaterprivate = $event.event.isTrusted
  }

  CheckPrivateY($event){
    this.yearpublic = !$event.event.isTrusted
    this.yearprivate = $event.event.isTrusted
  }

  // modal
  modalWeekly(weekly){
    this.modalReference = this.modalService.open(weekly,{size: 'xl'})
  }
  modalMonthly(monthly){
    this.modalReference = this.modalService.open(monthly,{size: 'xl'})
  }
  modalHalfyear(halfyear){
    this.modalReference = this.modalService.open(halfyear,{size: 'xl'})
  }
  modalQuaterly(quaterly){
    this.modalReference = this.modalService.open(quaterly,{size: 'xl'})
  }
  modalYearly(yearly){
    this.modalReference = this.modalService.open(yearly,{size: 'xl'})
  }
  modalModify(showdata){
    this.modalReference = this.modalService.open(showdata,{size: 'xl'})
  }

  public created(event) {
    this.switch.toggle();
  }
  onChange(args){
    this.dateValue = this.datePipe.transform(args.value, 'MM-dd-yyyy')
    this.dateHalf = this.datePipe.transform(args.value, 'MM-dd-yyyy')
    this.dayquater = this.datePipe.transform(args.value, 'MM-dd-yyyy')
    this.dayyear = this.datePipe.transform(args.value, 'MM-dd-yyyy')
  }
}
