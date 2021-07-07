import { JwtHelperService } from '@auth0/angular-jwt';
import { Component, OnInit } from '@angular/core';
import { FilterService } from '@syncfusion/ej2-angular-treegrid';
import { SortService,ToolbarService, PageService, EditService, ExcelExportService, PdfExportService, ContextMenuService } from '@syncfusion/ej2-angular-treegrid';
import { TreeGridComponent } from '@syncfusion/ej2-angular-treegrid';
import { HttpClient } from '@angular/common/http';
import {  NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import { CookieService } from 'ngx-cookie-service';
import { ResizeService } from '@syncfusion/ej2-angular-grids';
import { environment } from '../../../../../environments/environment';
import { DataService } from '../../../../_core/_services/data.service';
import { AdminOccategoriesService } from '../../../../_core/_services/admin-occategories.service';
import { AlertifyService } from '../../../../_core/_services/alertify.service';
@Component({
  selector: 'app-admin-occategories',
  templateUrl: './admin-occategories.component.html',
  styleUrls: ['./admin-occategories.component.css'],
  providers: [
    SortService, ToolbarService,
    PageService, EditService,
    ExcelExportService, PdfExportService,
    ContextMenuService,FilterService,
    ResizeService
  ]
})
export class AdminOCCategoriesComponent implements OnInit {
  baseUrl: any = environment.apiUrl
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
  public pageSettings2: any = { pageSize: 10 }
  expanded: any = {}
  data: any[] = []
  data2: any[] = []
  page: any = 1
  pageSize: any = 1000
  locale: any = this.cookieService.get('Lang')
  levelid: any = 0
  ocId: any = 0
  title: string
  isHide: any = false
  jwtHelper = new JwtHelperService();
  userid: number = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid)
  constructor(
    private cookieService: CookieService,
    private http: HttpClient,
    private dataService: DataService,
    private adminOccategoriesService: AdminOccategoriesService,
    private alertify : AlertifyService
  ) { }

  ngOnInit(): void {
    setTimeout(()=> {
      this.getOc()
    },300)
    this.dataService.currentSourceLang.subscribe((res: any) => {
      this.locale = res
      this.getCategoryByOC()
    })
  }

  No(index) {
    return parseFloat(index) + 1
  }

  rowSelected(args) {
    this.title = '- ' + args.data.title
    this.levelid = args.data.levelnumber
    this.ocId = args.data.key
    this.getCategoryByOC()
    this.isHide = true
  }

  getOc(){
    this.adminOccategoriesService.getOc(this.userid)
    .subscribe((res: any)=>{
      this.data = res
    })
  }

  getCategoryByOC(){
    this.http.get(this.baseUrl + `OCCategories/GetCategoryByOC2/${this.levelid}/${this.locale}/${this.ocId}/${this.page}/${this.pageSize}`)
    .subscribe((res: any) => {
      this.data2 = res.data
    })
  }

  addOCCategory(data){
    if(data.Status === true){
      this.adminOccategoriesService.addOCCategory(this.ocId,data.ID)
      .subscribe(()=>{
        this.alertify.success('Uncheck successfully')
        this.getCategoryByOC()
      })
    }
    else{
      this.adminOccategoriesService.addOCCategory(this.ocId,data.ID)
      .subscribe(()=>{
        this.alertify.success('Add successfully')
        this.getCategoryByOC()
      })
    }
  }

}
