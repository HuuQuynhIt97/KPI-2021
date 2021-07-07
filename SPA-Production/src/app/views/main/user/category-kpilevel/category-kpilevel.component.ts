import { Component, OnInit ,ViewEncapsulation, OnDestroy } from '@angular/core';
import { TreeGridComponent } from '@syncfusion/ej2-angular-treegrid';
import { FilterService } from '@syncfusion/ej2-angular-treegrid';
import { SortService,ToolbarService, PageService, EditService, ExcelExportService, PdfExportService, ContextMenuService } from '@syncfusion/ej2-angular-treegrid';
import {Router } from '@angular/router';
import {  NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import { CookieService } from 'ngx-cookie-service';
import { AutoCompleteComponent } from '@syncfusion/ej2-angular-dropdowns';
import { ResizeService } from '@syncfusion/ej2-angular-grids';
import { environment } from '../../../../../environments/environment';
import { DataService } from '../../../../_core/_services/data.service';
import { CategoryKpilevelService } from '../../../../_core/_services/category-kpilevel.service';
import { AlertifyService } from '../../../../_core/_services/alertify.service';
@Component({
  selector: 'app-category-kpilevel',
  templateUrl: './category-kpilevel.component.html',
  styleUrls: ['./category-kpilevel.component.css'],
  encapsulation: ViewEncapsulation.None,
  providers: [
    SortService, ToolbarService,
    PageService, EditService,
    ExcelExportService, PdfExportService,
    ContextMenuService,FilterService,
    ResizeService
    ]
})
export class CategoryKPILevelComponent implements OnInit,OnDestroy {
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
  editing: any = { allowDeleting: false, allowEditing: false, mode: 'Row' }
  public pageSettings: any = { pageSize: 100 }
  public pageSettings2: any = { pageSize: 5 }
  expanded: any = {}
  data: any[] = []
  data2: any[] = []
  data3: any[] = []
  page: any = 1
  pageSize: any = 1000
  locale: string = this.cookieService.get('Lang')
  levelid: any = 0
  ocId: any = 0
  category: any
  title: string
  titleoc: string
  isHide: any = false
  ocHide: any = false
  placeholder: any = 'Select User'
  public AutoCompleteObj: AutoCompleteComponent;
  public  dataUser: { [key: string]: Object; }[] = []
  public fields: Object = { text: 'FullName', value: 'Username' };
  value: any
  manager: any
  owner: any
  updater: any
  sponsor: any
  participant: any
  kpilevelid: any
  categoryid: any
  public box : string = 'Box'
  ListID: any = []
  changeLocaleCategory: any
  changeLocaleDataKPILevel: any
  constructor(
    private cookieService: CookieService,
    private router: Router,
    private dataService: DataService,
    private categoryKpilevelService: CategoryKpilevelService,
    public alertify : AlertifyService
  ) {
   }

  ngOnInit(): void {
    setTimeout(() => {
      this.getOc()
     }, 300)
    this.isHide = false
    // window.onpopstate = function() {
    //   alert('browser-back');
    // };
  }

  ngOnDestroy() {

  }
  No(data) {
    return parseFloat(data) + 1
  }
  switchChartPriod(period, kpilevelcode) {
    let year = new Date().getFullYear();
    switch (period) {
      case 'W':
        window.open(`#/ChartPeriod/${kpilevelcode}/${this.category}/${period}/${year}/1/53`,'_blank')
        // this.router.navigate([`/ChartPeriod/${kpilevelcode}/${this.category}/${period}/${year}/1/53`])
        break;
      case 'M':
        window.open(`#/ChartPeriod/${kpilevelcode}/${this.category}/${period}/${year}/1/12`,'_blank')
        // this.router.navigate([`/ChartPeriod/${kpilevelcode}/${this.category}/${period}/${year}/1/12`])
        break;
      case 'H':
        window.open(`#/ChartPeriod/${kpilevelcode}/${this.category}/${period}/${year}/1/2`,'_blank')
        // this.router.navigate([`/ChartPeriod/${kpilevelcode}/${this.category}/${period}/${year}/1/2`])
        break;
      case 'Q':
        window.open(`#/ChartPeriod/${kpilevelcode}/${this.category}/${period}/${year}/1/4`,'_blank')
        // this.router.navigate([`/ChartPeriod/${kpilevelcode}/${this.category}/${period}/${year}/1/4`])
        break;
      case 'Y':
        window.open(`#/ChartPeriod/${kpilevelcode}/${this.category}/${period}/${year}/${year}/${year}`,'_blank')
        // this.router.navigate([`/ChartPeriod/${kpilevelcode}/${this.category}/${period}/${year}/${year}/${year}`])
        break;
    }
  }

  switchDataset(period) {
    let year = new Date().getFullYear();
    let startYear = year - 5;
    switch (period) {
      case 'w':
        this.router.navigate([`/Dataset/${this.category}/w/1/53/${year}`])
        break;
      case 'm':
        this.router.navigate([`/Dataset/${this.category}/m/1/12/${year}`])
        break;
      case 'h':
        this.router.navigate([`/Dataset/${this.category}/h/1/2/${year}`])
        break;
      case 'q':
        this.router.navigate([`/Dataset/${this.category}/q/1/4/${year}`])
        break;
      case 'y':
        this.router.navigate([`/Dataset/${this.category}/y/${startYear}/${year}/${year}`])
        break;
    }
  }

  showOC(item){
    this.category = item.ID
    this.titleoc ='- ' + item.Name
    this.ocHide = true
    this.changeLocaleDataKPILevel = this.dataService.currentSourceLang.subscribe((res: any) => {
      this.locale  = res
      this.loadDataKPILevel()
    })
  }

  GetListID(){
    this.categoryKpilevelService.GetListID()
    .subscribe((res: any)=>{
      this.ListID = res
    })
  }

  actionComplete(args){
  }

  rowSelected(args){
    this.title = '- ' + args.data.title
    this.levelid = args.data.levelnumber
    this.ocId = args.data.key
    this.GetListID()
    this.ocHide = false
    this.changeLocaleCategory = this.dataService.currentSourceLang.subscribe((res: any) => {
      this.locale  = res
      this.getCategoryByOC()
    })
  }

  rowSelected2(args){
    this.category = args.data.ID
    this.titleoc ='- ' + args.data.Name
    this.ocHide = true
    this.loadDataKPILevel()
  }

  rowSelected3(args){

  }

  contextMenuClick(args){
  }

  getOc(){
    this.categoryKpilevelService.getOc()
    .subscribe((res: any)=>{
      this.data = res
    })
  }

  getCategoryByOC(){
    // tslint:disable-next-line: prefer-const
    let listocs = localStorage.getItem('listocs').split(',') || [];
    // tslint:disable-next-line: prefer-const
    let arr = listocs
    // tslint:disable-next-line: one-variable-per-declaration
    let index, value, result;
    for (index = 0; index < arr.length; index++) {
      // tslint:disable-next-line: radix
      value = parseInt(arr[index]);
      if (value === this.ocId) {
        result = value;
          break;
      }
    }
    if(this.ocId === result)
    {
      this.categoryKpilevelService.getCategoryByOC(this.ocId,this.locale,this.levelid,this.page,this.pageSize)
      .subscribe((res: any)=>{
        this.data2 = res.data
        this.isHide = true
      })
    }
    else{
      this.isHide = false
      this.alertify.error('Your do not have access')
    }
  }

  loadDataKPILevel(){
    this.categoryKpilevelService.loadDataKPILevel(this.category,this.ocId,this.locale,this.page,this.pageSize)
    .subscribe((res: any)=>{
      this.data3 = res.data
    })
  }

  onChange(args: any): void{
  }

  auditPeriodClass(
    checked = false,
    periodChecked = false,
    statusUploadData = false,
    statusEmptyData = false
    ) {
    let className;
    if (checked === true) {
      if (periodChecked === true) {
        if (statusUploadData === true && statusEmptyData === false) {
          className = 'btn btn-sm month btn-success';
        } else
          className = 'btn btn-sm month btn-warning';
      } else
        className = 'btn btn-sm month bg-navy';
    } else
      className = 'btn btn-sm month bg-navy';
    return className;
  }

  auditPeriodAttr(checked= false, periodChecked= false, statusUploadData= false, statusEmptyData= false) {
    let attr;
    if (checked === true) {
      if (periodChecked === true) {
        if (statusUploadData === true && statusEmptyData === false) {
          attr = false;
        } else
          attr = false;
      } else
        attr = true;
    } else
      attr = true;
    return attr;
  }
}
