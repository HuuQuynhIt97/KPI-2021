import { Component,OnInit,AfterViewInit,OnDestroy } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import {Router, ActivatedRoute } from '@angular/router';
import { NgbModal , NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import  swal  from 'sweetalert2';
import * as Chart from 'chart.js'
import { CookieService } from 'ngx-cookie-service';
import * as pluginDataLabels from 'chartjs-plugin-datalabels';
import { JwtHelperService } from '@auth0/angular-jwt';
import { FilterService    } from '@syncfusion/ej2-angular-treegrid';
import { EditService, PageService, GridComponent,ExcelExportService,ResizeService,SortService ,ContextMenuService } from '@syncfusion/ej2-angular-grids';
import { ToolbarService } from '@syncfusion/ej2-angular-grids';
import { DatePipe } from '@angular/common';
import { TemplateRef, ViewChild } from '@angular/core';
import { NgbModalConfig } from '@ng-bootstrap/ng-bootstrap';
import { Subscription } from 'rxjs';
import { ResizedEvent } from 'angular-resize-event';
import { saveAs } from 'file-saver';
import { NgxSpinnerService } from 'ngx-spinner';
import { environment } from '../../../../../environments/environment';
import { planetChartData } from '../../../../modules/Chartjs/chart';
import { DataService } from '../../../../_core/_services/data.service';
import { WorkplaceService } from '../../../../_core/_services/workplace.service';
import { ChartPeriodService } from '../../../../_core/_services/chart-period.service';
import { AlertifyService } from '../../../../_core/_services/alertify.service';
const HttpUploadOptions = {
  headers: new HttpHeaders({ 'Accept': 'application/json' })
}

@Component({
  selector: 'app-chart-period',
  templateUrl: './chart-period.component.html',
  styleUrls: ['./chart-period.component.css'],
  providers: [
    SortService,DatePipe, ToolbarService, PageService, EditService,
    ExcelExportService, ContextMenuService,FilterService,NgbModalConfig,NgbModal,
    ResizeService
  ]
})
export class ChartPeriodComponent implements OnInit,AfterViewInit,OnDestroy {
  @ViewChild('comment', { static: true }) comment: TemplateRef<any>;
  @ViewChild('actionplan', { static: true }) actionplan: TemplateRef<any>;
  searchSettings: any = { hierarchyMode: 'Parent' }
  freightrules =  { required: true }
  customeridrules = { required: true }
  orderidrules = { required: true }
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
  toolbarOptions = ['Search', 'Cancel','ExcelExport','Excel Export All']
  editSettings: any = { allowEditing: true,mode: 'Normal',allowEditOnDblClick: true };
  editing: any = { allowDeconsting: true, allowEditing: true, mode: 'Row', allowEditOnDblClick: true }
  public pageSettings: any = { pageSize: 100 }
  expanded: any = {}
  jwtHelper = new JwtHelperService();
  baseUrl: any = environment.apiUrl
  locale: string = this.cookieService.get('Lang')
  planetChartData: any = planetChartData
  public barChartPlugins = [pluginDataLabels];
  modalReference: NgbModalRef
  modalReference1: NgbModalRef
  modalReference2: NgbModalRef
  modalReferenceHistoryAc: NgbModalRef
  modalReferenceList: NgbModalRef
  modalReferenceUpload: NgbModalRef
  chart: any = {}
  unit: string = null;
  label: string = null
  labels: object = []
  targets: any = []
  datasets: any = {}
  period: string = null
  plugins: any = [pluginDataLabels]
  options: any = {
    responsive: true,
    maintainAspectRatio: false,
    showScale: false,
    plugins: {
      datalabels: {
        backgroundColor: function(context) {
          return context.dataset.backgroundColor;
        },
        borderRadius: 4,
        color: 'white',
        font: {
          weight: 'bold'
        },
        formatter: function(value, context) {
          return value
        }
      }
    },
    title: {
      display: true,
      text: '',
      fontSize: 14,
      fontColor: 'black'
    },
    elements: {
      point: {
        radius: 0
      },
      line: {
        tension: 0.2
      }
    },
    scales: {
      yAxes: [
        {
          stacked: true,
          display: true,
          position: 'left',
          ticks: {
            beginAtZero: true,
            padding: 10,
            fontSize: 12,
            stepSize: 10,
            min: -5
          },
          scaleLabel: {
            display: true,
            labelString: this.unit,
            fontSize: 12,
            fontStyle: 'normal'
          }
        }
      ],
      xAxes: [
        {
          gridLines: {
            display: true,
            tickMarkLength: 8
          },
          ticks: {
            fontSize: 12
          },
          scaleLabel: {
            display: true,
            labelString: this.period,
            fontSize: 12,
            fontStyle: 'normal'
          }
        }
      ]
    }
  }
  name: string;
  kpiname: string;
  OwnerManagerment: string;
  Owner: string = null
  PIC: string = null
  Sponsor: string = null
  Participant: string = null
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
  isShow: boolean = false
  isHide: boolean = true
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
  AllDataActionPlanByKPILevelID: any[] = []
  page: number = 1
  pageSize: number = 1000
  keyword: string = ' '
  public dateValue: any = new Date();
  AssignPIC: any = null
  Auditor: any = null
  taskname: string = null
  taskID: string = ''
  description: string = null
  Duedate: any
  TitleEdited: string = ''
  tempTitleDefault: string;
  tempTitleChange: string;
  tempDescriptionDefault: string;
  tempDescriptionChange: string;
  tempRemarkDefault: string;
  tempRemarkChange: string;
  demoo: string = ''
  modalDemo: NgbModalRef;
  item: any;
  mgs?:string;
  defaultLink: any
  subscription : Subscription;
  subscription1 : Subscription;
  Listentask: any;
  ListenCom: any;
  statusfavorite: boolean = true;
  contentworkplan: string;
  width: number;
  height: number;
  pins: [];
  isOwner: any ;
  rootcause: string;
  lines: string = 'Both';
  // @ViewChild('grid') public grid: GridComponent;
  @ViewChild('myPond') myPond: any;
  @ViewChild('myPondUpload') myPondUpload: any;
  dataHistoryAc: object[];
  titleHistoryAc: string;
  usid: number = 0;
  myFiles = [];
  pondOptions = {
    class: 'my-filepond',
    multiple: true,
    server: {
      process: environment.apiSaveFileUpload,
      revert: null
    }
  }
  file: any = [];
  filename: '';
  placeholder: any = 'Select User'
  public box : string = 'Box'
  public fields: Object = { text: 'Alias', value: 'Alias' };
  selectedAssignPIC: any;
  selectedAuditor: any;
  kpilevelID: number;
  @ViewChild('gridexport') public gridexport: GridComponent;
  @ViewChild('gridexportall') public gridexportall: GridComponent;
  loadchart: any
  titlechart: string
  pointBackgroundColors: any[] = []
  datacompare: any[] = []
  dataListFile: any[] = []
  actionPlanID: any ;
  public checkedwifi: boolean = true;
  tamp:any = []
  // @ViewChild('gridplann')
  constructor(
    private cookieService: CookieService,
    private router: Router,
    private route: ActivatedRoute,
    private http: HttpClient,
    config: NgbModalConfig,
    private modalService: NgbModal,
    private datePipe: DatePipe,
    private dataService: DataService,
    private spinner: NgxSpinnerService,
    private workplaceService: WorkplaceService,
    private chartPeriodService: ChartPeriodService,
    public alertify : AlertifyService
  ) {
    config.backdrop = 'static';
    config.keyboard = false;
    this.router.routeReuseStrategy.shouldReuseRoute = () => false;
  }

  ngOnInit(): void {
    // this.createChart('planet-chart', this.datasets, this.targets, this.labels,this.label,this.unit);
    this.GetItem()

    this.route.params.subscribe(params=>{
      this.period = params.period
      this.year = params.year
      this.start = this.route.snapshot.params.start
      this.end = params.end
      this.kpilevelcode = params.kpilevelcode
      this.catid = params.catid
      this.period = params.period
    })
    this.defaultLink = `/ChartPeriod/${this.route.snapshot.params.kpilevelcode}/${this.route.snapshot.params.catid}/${this.route.snapshot.params.period}/${this.route.snapshot.params.year}/${this.route.snapshot.params.start}/${this.route.snapshot.params.end}`
    this.loadchart = this.dataService.currentSourceLang.subscribe((res: any)=>{
      this.locale = res;
      this.Loadchart();
    })
    this.ListenGettask();
    this.ListenGetComment();
  }

  ngAfterViewInit(): void {
  }

  ngOnDestroy() {
    this.loadchart.unsubscribe();
  }

  Compare() {
    this.modalReference.close()
    return this.router.navigate([`Compare/${this.tamp.join('-')}`])
  }

  public getDataCompare(args,data) : void {
    if(args.checked === true) {
      this.tamp.push(data.KPILevelCode)
    }else{
      const array = this.tamp
      const index = array.indexOf(data.KPILevelCode);
      if (index > -1) {
        array.splice(index, 1);
      }
    }
  }

  clearSearch(period) {
    if (period) {
      switch (period) {
        case 'M':
          this.router.navigate(['/ChartPeriod',this.kpilevelcode,this.catid,this.period,this.year,1,12])
          this.Loadchart();
          break;
        case 'W':
          this.router.navigate(['/ChartPeriod',this.kpilevelcode,this.catid,this.period,this.year,1,54])
          this.Loadchart();
          break;
        case 'Q':
          this.router.navigate(['/ChartPeriod',this.kpilevelcode,this.catid,this.period,this.year,1,4])
          this.Loadchart();
          break;
        case 'H':
          this.router.navigate(['/ChartPeriod',this.kpilevelcode,this.catid,this.period,this.year,1,2])
          this.Loadchart();
          break;
        case 'Y':
          this.router.navigate(['/ChartPeriod',this.kpilevelcode,this.catid,this.period,this.year,2020,2020])
          this.Loadchart();
          break;
      }
    }
  }

  LoadAllDataActionPlanByKPILevelID(id) {
    this.chartPeriodService.LoadAllDataActionPlanByKPILevelID(id,this.userid)
    .subscribe((result: any) =>{
      this.AllDataActionPlanByKPILevelID = result.data
    })
  }

  handleFileProcess(event: any){
    let arr = [];
    this.file.push(event.file.file) ;
  }
  pondHandleAddFile(event: any) {

  }

  pondHandleRemoveFile(event: any) {
    this.chartPeriodService.pondHandleRemoveFile(event.file.file.name)
    .subscribe((res: any)=>{
      for(var i = 0; i < this.file.length; i++) {
        if(this.file[i].name == event.file.file.name) {
          this.file.splice(i, 1);
          break;
        }
      }
    })
  }

  DownloadExcel(data) {
    const url = this.baseUrl + `ChartPeriod/DownloadExcelActionPlan/${data.Name}`
    let file = data.Name;
    this.workplaceService.downloadExcel(url).subscribe(data =>{
      (saveAs(data,file))
      this.spinner.show();
      setTimeout(() => {
        this.spinner.hide();
        this.alertify.success('Download successfully')
      }, 2000);
    })
  }

  closeHistoryModal(){
    this.modalReferenceHistoryAc.close();
  }

  modalHistoryAc(History){
    this.modalReferenceHistoryAc = this.modalService.open(History,{ size: 'lg' })
  }

  modalLisFileDownload(DownloadFileActionPlan){
    this.modalReferenceList = this.modalService.open(DownloadFileActionPlan,{ size: 'lg' })
  }

  modalUploadFile(UploadFileActionPlan){
    this.modalReferenceUpload = this.modalService.open(UploadFileActionPlan,{ size: 'lg' })
  }
  modaluploadFileclose() {
    this.modalReferenceUpload.close();
  }
  modalListFileclose() {
    this.modalReferenceList.close();
  }
  viewHistoryActionPlan(data,History){
    this.modalHistoryAc(History)
    this.chartPeriodService.viewHistoryActionPlan(data.ID)
    .subscribe((res: any)=>{
      this.dataHistoryAc = res.data;
      this.titleHistoryAc = res.title
    })
  }

  ViewAllFile(data,DownloadFileActionPlan){
    this.modalLisFileDownload(DownloadFileActionPlan)
    this.chartPeriodService.GetFileUpload(data.ID)
    .subscribe((res: any)=>{
      this.dataListFile = res;
    })
  }

  UploadFile(data,UploadFileActionPlan){
    this.actionPlanID = data.ID;
    this.modalUploadFile(UploadFileActionPlan)
  }
  uploadFileAc() {
    const formData = new FormData();
    formData.append("actionPlanID", this.actionPlanID);
    formData.append("uploadBy", this.userid);
    for (let item of this.file) {
      formData.append('UploadedFile', item);
    }
    if(this.file) {
      this.http.post(this.baseUrl + 'ActionPlan/UploadFile' , formData).subscribe((res: any) => {
        this.alertify.success('Upload successfully')
        this.modalReferenceUpload.close()
      })
    } else {
      this.alertify.error('Not File Upload!')
    }
  }

  toolbarClick(args) {
    if (args.item.text === 'Excel Export') {
      this.gridexport.excelExport()
    }
    if (args.item.text === 'Excel Export All') {
      this.gridexportall.excelExport()
    }
  }

  unpin(id) {
    this.alertify.confirm('Unpin', 'Unpin this root cause?' , () => {
      this.chartPeriodService.unpin(id)
      .subscribe((res: any)=>{
        this.alertify.success('Unpin root cause success!')
        this.loadDataComment(this.dataID)
      })
    })
  }
  pin(id) {
    this.alertify.confirm('Pin', 'Pin this root cause?' , () => {
      this.chartPeriodService.pin(id)
      .subscribe((res: any) => {
        this.alertify.success('Pin root cause success!')
        this.loadDataComment(this.dataID)
      })
    })
  }
  onResized(event: ResizedEvent) {
    // this.Loadchart();
  }
  pushListTask(){
    this.router.navigate(['/ChartPeriod/ListTasks',this.kpilevelcode])
  }
  DeleteComment(id){
    this.alertify.confirm('Delete Comment', "You won't be able to revert this!" , () => {
      this.chartPeriodService.DeleteComment(id)
      .subscribe((res: any)=>{
        this.alertify.success('Comment has been deleted')
        this.loadDataComment(this.dataID)
      })
    })
  }
  deleteActionPlan(id){
    this.alertify.confirm('Delete ActionPlan', "Are you sure? You won't be able to revert this!" , () => {
      this.chartPeriodService.deleteActionPlan(id)
      .subscribe((res: any)=>{
        this.alertify.success('ActionPlan has been deleted')
        this.LoadDataActionPlan(this.dataID,this.commentID)
        this.Loadchart()
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
      this.chartPeriodService.done(data2)
      .subscribe((res: any)=>{
        this.alertify.success('successfully')
        this.LoadDataActionPlan(this.dataID,this.commentID)
      })
    }
    else{
      this.chartPeriodService.done(data2)
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
      this.chartPeriodService.approval(data2)
      .subscribe((res: any) => {
        this.alertify.success('Approved successfully')
        this.LoadDataActionPlan(this.dataID,this.commentID)
      })
    }
    else{
      this.chartPeriodService.approval(data2)
      .subscribe((res: any)=>{
        this.alertify.success('Cancel Approval successfully')
        this.LoadDataActionPlan(this.dataID,this.commentID)
      })
    }
  }
  selectCell($event) {
  }
  rowSelected(args){
  }
  batchSave(args){
  }
  TitleEdit(){
    const formData = new FormData()
    formData.append('name', 'Title')
    formData.append('pk', this.taskID)
    formData.append('userid', this.userid)
  }
  cellSelected(args){
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
    this.http.post(this.baseUrl + 'ChartPeriod/UpdateSheduleDate',formData,HttpUploadOptions).subscribe((res: any) => {
      this.alertify.success('Update Deadline successfully')
      this.LoadDataActionPlan(this.dataID , this.commentID)
    })
  }
  backComment(comment){
    this.modalReference2.close()
    this.modalComment(comment)
  }
  rowDataBound(args){

  }
  actionComplete(args){

  }
  cellEdit(args){

  }
  contextMenuClick(args){
  }
  beforeBatchSave(args){
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
  showData() {
    this.chart.options = this.options;
    this.chart.update();
    this.isShow = false
    this.isHide = true
  }
  hiddenData() {
    this.chart.options.plugins.datalabels = {
      backgroundColor: function(context) {
        return context.dataset.backgroundColor;
      },
      borderRadius: 4,
      color: 'white',
      font: {
        weight: 'bold',
        size: 12
      },
      formatter: function(value, context) {
        return false;
      },
      display: function(context) {
        return false;
      }
    };
    this.chart.update();
    this.isShow = true
    this.isHide = false
  }
  createChart(chartId, datasets, targets, labels, label, unit) {
    let pluginsDatasets = {
      datalabels: {
        backgroundColor: function(context) {
          return context.dataset.backgroundColor;
        },
        borderRadius: 4,
        color: 'white',
        font: {
          weight: 'bold',
          size: 12
        },
        formatter: function(value, context) {
          if(unit === 'Percentage'){
            return value + '%';
          }else {
            return value
          }
        },
        display: function(context) {
        },
        id: 'p1'
      }
    };
    const ctx = document.getElementById(chartId) as HTMLCanvasElement;
    let optionss: any = {
      plugins: {
        datalabels: {
          backgroundColor: function(context) {
            return context.dataset.backgroundColor;
          },
          borderRadius: 4,
          color: 'white',
          font: {
            weight: 'bold'
          },
          formatter: function(value, context) {
            if(unit === 'Percentage'){
              return value + '%';
            }else {
              return value
            }
          }
        }
      },
      scales: {
        yAxes: [
          {
            display: true,
            stacked: false,
            position: 'left',
            ticks: {
              beginAtZero: true,
              padding: 10,
              fontSize: 12,
              stepSize: 10,
              min: -5
            },
            scaleLabel: {
              display: true,
              labelString: this.unit,
              fontSize: 12,
              fontStyle: 'normal'
            }
          }
        ],
        xAxes: [
          {
            gridLines: {
              display: true,
              tickMarkLength: 8
            },
            ticks: {
              fontSize: 12
            },
            scaleLabel: {
              display: true,
              labelString: this.options.scales.xAxes[0].scaleLabel.labelString,
              fontSize: 12,
              fontStyle: 'normal'
            }
          }
        ]
      },
      title: {
        display: true,
        text: this.options.title.text,
        fontSize: 14,
        fontColor: 'black'
      },
      elements: {
        point: {
          radius: 0
        },
        line: {
          tension: 0.2
        }
      },
    }
    const myChart = new Chart(ctx, {
      type: 'line',
      data:{
        // tslint:disable-next-line: object-literal-shorthand
        labels: labels,
        datasets: [
          {
            // tslint:disable-next-line: object-literal-shorthand
            label: label,
            spanGaps: true,
            backgroundColor: this.pointBackgroundColors,
            borderColor: '#e7263b',
            fill: false,
            data: this.datasets,
          },
          {
            label: 'Targets',
            data: this.targets,
            backgroundColor: '#3c8d8a',
            borderColor: '#3c8d8a',
            borderWidth: 3,
            fill: false,
          }
        ]
      },
      options: optionss
    })
    this.chart = myChart
  }
  Loadchart(){
    this.http.get(this.baseUrl + `ChartPeriod/ListDatas2/${this.route.snapshot.params.kpilevelcode}/${this.route.snapshot.params.catid}/${this.route.snapshot.params.period}/${this.locale}/
    ${this.route.snapshot.params.year}/${this.route.snapshot.params.start}/${this.route.snapshot.params.end}`).subscribe((res: any)=>{
      this.targets = res.targets,
      this.unit = res.Unit,
      this.statusfavorite = res.statusfavorite
      this.datasets = res.datasets,
      this.labels = res.labels,
      this.label = res.label,
      this.kpiname = res.kpiname,
      this.name = res.kpiname,
      this.PIC = res.PIC,
      this.kpilevelID = res.kpilevelID
      this.Owner = res.Owner,
      this.OwnerManagerment = res.OwnerManagerment,
      this.Sponsor = res.Sponsor,
      this.Participant = res.Participant,
      this.dataremarks = res.Dataremarks,

      (this.options.label = res.label),
      (this.options.title.text ='KPI Chart - ' + res.label + ' - ' + res.kpiname),
      (this.options.scales.yAxes[0].scaleLabel.labelString = res.Unit);
      this.options.scales.xAxes[0].scaleLabel.labelString = this.convertPeriod(res.period,true);
      this.titlechart = 'KPI Chart - ' + res.label + ' - ' + res.kpiname
      this.createChart(
        'planet-chart',
        this.datasets,
        this.targets,
        this.labels,
        this.label,
        this.unit
      )
      let lastDataset = this.datasets[this.datasets.length - 1],
        lastTarget = this.targets[this.targets.length - 1]
        // if (lastDataset <= lastTarget) {
        //   this.chart.data.datasets[0].backgroundColor = '#e7263b';
        //   this.chart.data.datasets[0].borderColor = '#e7263b';
        //   this.chart.data.datasets[0].pointBorderColor = '#e7263b';
        //   this.chart.update();
        // } else {
        //   this.chart.data.datasets[0].borderColor = 'green';
        //   this.chart.data.datasets[0].pointBorderColor = 'green';
        //   this.chart.data.datasets[0].backgroundColor = 'green';
        //   this.chart.update();
        // }
        if(res.Status === false) {
          let i = 0
          for (i = 0; i < this.chart.data.datasets[0].data.length; i++) {
            if (this.chart.data.datasets[0].data[i] > lastTarget) {
              this.pointBackgroundColors.push('green');
              this.chart.data.datasets[0].borderColor = '#e7263b';
            } else {
              this.pointBackgroundColors.push('red');
              this.chart.data.datasets[0].borderColor = '#e7263b';
            }
            this.chart.update();
          }
        }else{
          let i = 0
          for (i = 0; i < this.chart.data.datasets[0].data.length; i++) {
            if (this.chart.data.datasets[0].data[i] > lastTarget) {
              this.pointBackgroundColors.push('red');
              this.chart.data.datasets[0].borderColor = 'green';
            } else {
              this.pointBackgroundColors.push('green');
              this.chart.data.datasets[0].borderColor = 'green';
            }
            this.chart.update();
          }
        }
    })
  }

  checktarget(status,value,target){
    if(status === false) {
      return parseFloat(value) <= (target || 0) ? 'text-center active-td' : 'active-td2 text-center'
    }else{
      return parseFloat(value) <= (target || 0) ? 'active-td2 text-center' : 'text-center active-td'
    }
  }

  convertPeriod(period, status = true) {
    if (status) {
      switch (period) {
        case 'M':
          return 'Months In Year';
        case 'W':
          return 'Weeks In Year';
        case 'Q':
          return 'Quarters In Year';
        case 'H':
          return 'Halfs In Year';
        case 'Y':
          return 'Years In Year';
      }
    } else {
      switch (period) {
        case 'M':
          return 'Monthly';
        case 'W':
          return 'Weekly';
        case 'Q':
          return 'Quarterly';
        case 'H':
          return 'Half Year';
        case 'Y':
          return 'Yearly';
      }
    }

    return 'N/A';
  }

  numberReturn(length){
    return new Array(length);
  }
  vyear(event): void{
    const newYear = event.target.value
    this.router.navigate(['/ChartPeriod',this.kpilevelcode,this.catid,this.period,newYear,this.start,this.end])
    this.Loadchart();
  }
  vstart(event): void{
    let newStart = event.target.value
    this.router.navigate(['/ChartPeriod',this.kpilevelcode,this.catid,this.period,this.year,newStart,this.end])
    this.Loadchart();
  }
  vend(event: any): void{
    let newEnd = event.target.value
    this.router.navigate(['/ChartPeriod',this.kpilevelcode,this.catid,this.period,this.year,this.start,newEnd])
    this.Loadchart();
  }
  stepChart() {
    this.options.scales.yAxes[0].ticks.stepSize = this.stepSize;
    this.chart.options = this.options;
    this.chart.update();
  }
  minChart() {
    this.options.scales.yAxes[0].ticks.min = Number(this.min);
    this.chart.options = this.options;
    this.chart.update();
  }

  openComment(event,item,comment){
    if (event.toElement.classList[1] === 'active-td') {
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
      + ' - '
      + ' KPI Chart '
      + ' - ' + this.kpiname
      + ' - '
      + this.convertPeriod(this.period, false)
      this.remark(id)
      this.loadDataComment(id)
    }
  }
  modalComment(comment){
    this.modalReference1 = this.modalService.open(comment,{ size: 'lg' })
  }
  loadDataComment(id){
    this.http.get(this.baseUrl + `ChartPeriod/LoadDataComment/${id}/${this.userid}/${this.kpilevelID}`)
    .subscribe((res: any)=>{

      this.dataComment = res.data
      this.isOwner = res.IsOwner
      this.pins = res.data.filter(item => {
        return item.Pin === true;
      });
      // console.log('Data comment',this.dataComment);
      // console.log('user comment',this.userid);

    })
  }
  LoadDataActionPlan(dataid, commentid){
    this.chartPeriodService.LoadDataActionPlan(dataid,commentid,this.userid,this.keyword,this.page,this.pageSize)
    .subscribe((res: any)=>{
      this.data = res.data
    })
  }
  modalActionPlan(actionplan){
    this.modalReference2 = this.modalService.open(actionplan,{ size: 'lg' } )
  }
  modalclose(){
    this.modalReference1.close()
    this.ListenCom.unsubscribe()
    this.router.navigate(['/ChartPeriod',this.kpilevelcode,this.catid,this.period,this.year,this.start,this.end])
    this.Loadchart()
  }
  modalclose2(){
    this.modalReference2.close()
    this.Listentask.unsubscribe()
    this.router.navigate(['/ChartPeriod',this.kpilevelcode,this.catid,this.period,this.year,this.start,this.end])
    this.Loadchart()
  }
  modalCompareclose(){
    this.modalReference.close()
  }
  openActionPlan(item,actionplan){
    this.commentID = item.CommentID
    this.rootcause = item.CommentMsg
    this.usid = item.UserID
    this.actionPlanText = this.remarkText.replace('Remark', 'Action Plan')
    this.modalReference1.close()
    this.modalActionPlan(actionplan)
    this.LoadDataActionPlan(this.dataID,this.commentID)
    this.Loadchart()
    this.LoadAllDataActionPlanByKPILevelID(this.kpilevelID)
  }
  remark(id){
    this.chartPeriodService.remark(id)
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
          list.push(x.toString().replace('@', ' ').trim());
        }
      // const Tags = [...new Set(list.map(x => x))].join();
      const Tags = Array.from(new Set(list.map(x => x))).join();
      const mObj = {
        DataID: this.dataID,
        CommentMsg: this.content,
        UserID: this.userid,
        Tag: Tags,
        Link: location.origin + '/#' + this.router.url,
        Title: this.remarkText,
        KPILevelCode: this.route.snapshot.params.kpilevelcode,
        CategoryID: Number(this.route.snapshot.params.catid),
        DefaultLink: this.defaultLink
      }
      this.chartPeriodService.addcomment(mObj)
      .subscribe((res: any)=>{
        this.alertify.success('Successfully')
        this.content = ''
        this.loadDataComment(this.dataID)
      })
  }
  onChange(args,dateValue){
    this.dateValue = this.datePipe.transform(args.value, 'MM-dd-yyyy')
  }
  addActionPlan(actionplan){
    this.dateValue = this.datePipe.transform(this.dateValue, 'MM-dd-yyyy')
    const KPILevelCodeAndPeriods = this.route.snapshot.params.kpilevelcode + this.route.snapshot.params.period
    const selectedAssignPIC = this.selectedAssignPIC.map(item=>{
      return item
    }).join(',')
    const selectedAuditor = this.selectedAuditor.map(item=>{
      return item
    }).join(',')
    const formData = new FormData();
    formData.append('UserID', this.userid);
    formData.append('DataID', this.dataID.toString());
    formData.append('CommentID', this.commentID.toString());
    formData.append('Title', this.taskname);
    formData.append('Tag', this.selectedAssignPIC);
    formData.append('KPILevelCodeAndPeriod', KPILevelCodeAndPeriods);
    formData.append('Description', this.description);
    formData.append('Deadline', this.dateValue);
    formData.append('SubmitDate', this.datePipe.transform( new Date(), 'MM/dd/yyyy'));
    formData.append('Link', location.origin + '/#' + this.router.url);
    formData.append('Subject', this.actionPlanText);
    formData.append('Auditor', this.selectedAuditor);
    formData.append('CategoryID', Number(this.route.snapshot.params.catid).toString());
    formData.append('KPILevelCode', this.route.snapshot.params.kpilevelcode);
    formData.append('DefaultLink', this.defaultLink);
    formData.append('KPILevelID', this.kpilevelID.toString());
    formData.append('UploadedFile', this.file);
    this.http.post(this.baseUrl + 'ChartPeriod/AddActionPlanFormData' , formData)
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
        setTimeout(() => {
          this.loadDataComment(dataID)
        }, 300)
        this.LoadDataActionPlan(dataID,comID)
        this.remarkText = data.Title
        this.actionPlanText = this.remarkText.replace('Remark', 'Action Plan')
        this.remark(dataID)
      }
    })
  }
  compare(compareModal){
    this.modalReference = this.modalService.open(compareModal,{size: 'xl'})
    this.loadDataCompare()
  }
  loadDataCompare() {
    let obj = this.route.snapshot.params.kpilevelcode + ',' + this.route.snapshot.params.period ;
    this.http.get(this.baseUrl + `ChartPeriod/LoadDataProvide/${obj}/1/1000`)
    .subscribe((result: any) =>{
      this.datacompare = result.listCompare
    })
  }
  addFv(){
    const  mObj = {
      KPILevelCode: this.route.snapshot.params.kpilevelcode,
      Period: this.route.snapshot.params.period,
      UserID: this.userid,
    }
    this.chartPeriodService.addFv(mObj)
    .subscribe((res: any)=>{
      this.alertify.success('Add Favourite Successfully')
      this.Loadchart()
    })
  }
  GetItem() {
    this.http.get(this.baseUrl + `ChartPeriod/GetItemInListOfWorkingPlan/${this.route.snapshot.params.kpilevelcode}/${this.route.snapshot.params.period}`)
    .subscribe((res: any)=>{
      if(res.data !== null)
        this.contentworkplan = res.data.Content
    })
  }
}
