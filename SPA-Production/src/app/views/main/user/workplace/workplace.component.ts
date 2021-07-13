import { Component, OnInit,ViewEncapsulation, ViewChild } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {Router } from '@angular/router';
import { NgbModal , NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import { FilterService } from '@syncfusion/ej2-angular-treegrid';
import { SortService,ToolbarService, EditService, ExcelExportService, PdfExportService, ContextMenuService } from '@syncfusion/ej2-angular-treegrid';
import { TreeGridComponent } from '@syncfusion/ej2-angular-treegrid';
import {  PageService ,ResizeService,VirtualScrollService, GridComponent   } from '@syncfusion/ej2-angular-grids';
import { CookieService } from 'ngx-cookie-service';
import { JwtHelperService } from '@auth0/angular-jwt';
import { NgxSpinnerService } from 'ngx-spinner';
import { saveAs } from 'file-saver';
import { TranslateService } from '@ngx-translate/core';
import { environment } from '../../../../../environments/environment';
import { WorkplaceService } from '../../../../_core/_services/workplace.service';
import { DataService } from '../../../../_core/_services/data.service';
import { AlertifyService } from '../../../../_core/_services/alertify.service';
@Component({
  selector: 'app-workplace',
  templateUrl: './workplace.component.html',
  styleUrls: ['./workplace.component.css'],
  encapsulation: ViewEncapsulation.None,
  providers: [SortService,VirtualScrollService,
    ResizeService, ToolbarService, PageService, EditService, ExcelExportService, PdfExportService, ContextMenuService,FilterService]
})
export class WorkplaceComponent implements OnInit {
  jwtHelper = new JwtHelperService();
  public data: object[];
  public dataToDoList: object[]
  dataOCC: any[] = []
  public dataPerformance: object[]
  public treegrid: TreeGridComponent
  searchSettings: any = { hierarchyMode: 'Parent' }
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
  editing: any = { allowDeleting: false, allowEditing: false, mode: 'Row' }
  public pageSettings: any = { pageSize: 6 }
  public pageSettings2: any = { pageSize: 6 }
  public pageSettings3: any = { pageSize: 10 }
  expanded: any = {}
  baseUrl: string = environment.apiUrl
  modalReference: NgbModalRef
  role: any
  status: boolean = false
  title: string
  userid: number = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid)
  levelid: any
  isHide: boolean = false
  page: any = 1
  pageSize: any = 1000
  file: File = null
  lines: string = 'Both'
  locale: any = this.cookieService.get('Lang')
  @ViewChild('grid') public grid: GridComponent;
  constructor(
    private cookieService: CookieService,
    private router: Router,
    private http: HttpClient,
    private modalService: NgbModal,
    private workplaceService: WorkplaceService,
    private spinner: NgxSpinnerService,
    private dataService: DataService,
    private translate: TranslateService,
    private alertify : AlertifyService
  ) {
      // translate.setDefaultLang(this.locale);
      // translate.addLangs([this.locale])
      // translate.use(this.locale);
  }

  ngOnInit(): void {
    setTimeout(() => {
      this.getOC()
    }, 500)
    this.dataService.currentSourceLang.subscribe((res: any)=>{
      this.locale = res
      this.translate.addLangs([res])
      this.translate.use(res)
    })
  }
  gettask(data) {
    this.dataService.changeMessage(data)
    return this.router.navigate([data.URL])
  }
  rowSelected(args){
    this.title = '- ' + args.data.title
    this.levelid = args.data.key
    this.TrackKPI()
    this.isHide = true
  }

  actionplan(event){
    this.role = event.target.value
    this.loadActionPlan()
  }
  kpiupload(event){
    this.listKPIUpload()
  }
  loadActionPlan(){
    this.workplaceService.loadActionPlan(this.role,this.page,this.pageSize,this.status)
    .subscribe((res: any)=>{
      this.data = res.data
    })
  }

  listKPIUpload(){
    this.workplaceService.listKPIUpload(this.page,this.pageSize)
    .subscribe((res: any)=>{
      this.dataToDoList = res.data
      if(!res.isUpdater){
        this.alertify.error('You are not an updater!!')
      }
    })
  }
  Finished(){
    this.status = true
    this.loadActionPlan()
  }
  Notfinished(){
    this.status = false
    this.loadActionPlan()
  }
  getOC(){
    this.workplaceService.getOC(this.userid)
    .subscribe((res: any)=>{
      this.dataOCC = res
    })
  }

  TrackKPI() {
    this.workplaceService.TrackKPI(this.levelid,this.page,this.pageSize)
    .subscribe((res: any)=>{
      this.dataPerformance = res.model
    })
  }

  downloadExcel() {
    this.spinner.show();
    const url = environment.apiExportExcel + this.userid + '/' + this.locale
    this.workplaceService.download(url)
    .subscribe(data =>{
      (saveAs(data,'DataUpload.xlsx'))
      this.alertify.success('Download successfully')
      this.modalReference.close()
      this.spinner.hide();
      // setTimeout(() => {
      // }, 2000);
    })
  }

  openUpoad(upload){
    this.modalReference = this.modalService.open(upload,{ size: 'lg' })
  }

  uploadFile(){
    const formData = new FormData()
    formData.append('UploadedFile', this.file)
    this.http.post(this.baseUrl + 'Workplace/Import',formData)
    .subscribe((res: any)=>{
      if(res){
        this.spinner.show();
        setTimeout(() => {
          this.spinner.hide();
          this.alertify.success('Upload successfully')
          this.modalReference.close()
        }, 2000);
      }
    })
  }

  fileProgress(event) {
    this.file = event.target.files[0];
  }

}
