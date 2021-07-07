import { JwtHelperService } from '@auth0/angular-jwt';
import { Component, OnInit } from '@angular/core';
import { TreeGridComponent } from '@syncfusion/ej2-angular-treegrid';
import { FilterService } from '@syncfusion/ej2-angular-treegrid';
import { SortService,ToolbarService, PageService, EditService, ExcelExportService, PdfExportService, ContextMenuService } from '@syncfusion/ej2-angular-treegrid';
import { ResizeService } from '@syncfusion/ej2-angular-grids';
import { NgbModal , NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import { CookieService } from 'ngx-cookie-service';
import { AutoCompleteComponent, CheckBoxSelectionService } from '@syncfusion/ej2-angular-dropdowns';
import { environment } from '../../../../../environments/environment';
import { DataService } from '../../../../_core/_services/data.service';
import { AdminCatKpilevelService } from '../../../../_core/_services/admin-cat-kpilevel.service';
import { AlertifyService } from '../../../../_core/_services/alertify.service';
@Component({
  selector: 'app-category-kpilevel-admin',
  templateUrl: './category-kpilevel-admin.component.html',
  styleUrls: ['./category-kpilevel-admin.component.css'],
  providers: [
    CheckBoxSelectionService,
    ResizeService,SortService, ToolbarService, PageService, EditService,
    ExcelExportService, PdfExportService, ContextMenuService,FilterService]
})
export class CategoryKPILevelAdminComponent implements OnInit {
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
  public pageSettings2: any = { pageSize: 5 }
  expanded: any = {}
  data: any[] = []
  data2: any[] = []
  data3: any[] = []
  page: any = 1
  pageSize: any = 1000
  locale: any = this.cookieService.get('Lang')
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
  lines: string = 'Both'
  public box : string = 'Box'
  jwtHelper = new JwtHelperService();
  userid: any = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid)
  constructor(
    private cookieService: CookieService,
    private modalService: NgbModal,
    private dataService: DataService,
    private adminCatKpilevelService: AdminCatKpilevelService,
    private alertify : AlertifyService
  ) { }

  ngOnInit(): void {
    setTimeout(() => {
      this.getOc()
    }, 500)
  }

  NO(data){
    return Number(data.index) + 1
  }
  rowSelected(args){
    this.title = '- ' + args.data.title
    this.levelid = args.data.levelnumber
    this.ocId = args.data.key
    this.dataService.currentSourceLang.subscribe((res: any) => {
      this.locale = res
      this.getCategoryByOC()
    })
    this.isHide = true
    this.ocHide = false
  }

  rowSelected2(args){
    this.category = args.data.ID
    this.titleoc ='- ' + args.data.Name
    this.ocHide = true
    this.dataService.currentSourceLang.subscribe((res: any) => {
      this.locale = res
      this.loadDataKPILevel()
    })
  }

  getOc(){
    this.adminCatKpilevelService.getOc(this.userid)
    .subscribe((res: any)=>{
      this.data = res
    })
  }
  getCategoryByOC(){
    this.adminCatKpilevelService.getCategoryByOC(this.levelid,this.locale,this.ocId,this.page,this.pageSize)
    .subscribe((res: any)=>{
      this.data2 = res.data
    })
  }
  loadDataKPILevel(){
    this.adminCatKpilevelService.loadDataKPILevel(this.ocId,this.category,this.locale,this.page,this.pageSize)
    .subscribe((res: any)=>{
      this.data3 = res.data
    })
  }
  addOCCategory(data){
    if(data.Status === true){
      this.adminCatKpilevelService.addOCCategory(this.ocId,data.ID)
      .subscribe((res: any)=>{
        this.alertify.success('Uncheck successfully')
        this.getCategoryByOC()
      })
    }
    else{
    this.adminCatKpilevelService.addOCCategory(this.ocId,data.ID)
    .subscribe((res: any)=>{
      this.alertify.success('Add successfully')
      this.getCategoryByOC()
    })
    }
  }
  addMember(data,member){
    this.kpilevelid = data.ID
    const entity = {
      KPILevelID: data.ID,
      CategoryID: this.category,
    }
    if(!data.CheckCategory === true){
      this.adminCatKpilevelService.addMember(entity)
      .subscribe((res: any)=>{
        this.alertify.success('Add successfully')
        this.modelAddMember(member)
        this.getAllUser()
        this.getUserByCategoryIDAndKPILevelID()
        this.loadDataKPILevel()
      })
    }
    else{
      this.adminCatKpilevelService.addMember(entity)
      .subscribe((res: any)=>{
        this.alertify.success('Uncheck successfully')
        this.loadDataKPILevel()
      })
    }
  }
  modelAddMember(member){
    this.modalReference = this.modalService.open(member,{size: 'xl'})
  }
  modelshowdata(showdata){
    this.modalReference = this.modalService.open(showdata,{size: 'xl'})
  }
  saveMember(){
    const managers = this.manager.map(item=>{
      return item
    }).join(',')
    const owners = this.owner.map(item=>{
      return item
    }).join(',')
    const updaters = this.updater.map(item=>{
      return item
    }).join(',')
    const sponsors = this.sponsor.map(item=>{
      return item
    }).join(',')
    const participants = this.participant.map(item=>{
      return item
    }).join(',')
    let entity = {
      kpilevel: this.kpilevelid,
      category: this.category,
      pic: updaters,
      owner: owners,
      manager: managers,
      sponsor: sponsors,
      participant: participants
    }
    this.adminCatKpilevelService.saveMember(entity)
    .subscribe((res: any)=>{
      this.alertify.success('Add successfully')
      this.modalReference.close()
      this.loadDataKPILevel()
    })
  }
  getAllUser() {
    this.adminCatKpilevelService.getAllUser()
    .subscribe((res: any)=>{
      this.dataUser = res
    })
  }
  onChange(args: any): void{
  }
  modify(data,showdata){
    this.modelshowdata(showdata)
    this.kpilevelid = data.ID
    this.getUserByCategoryIDAndKPILevelID()
    this.getAllUser()
  }
  getUserByCategoryIDAndKPILevelID(){
    this.adminCatKpilevelService.getUserByCategoryIDAndKPILevelID(this.kpilevelid,this.category)
    .subscribe((res: any)=>{
      this.manager = res.manager.map(item=>{
        return item.Username
      })
      this.owner = res.owner.map(item=>{
        return item.Username
      })
      this.updater = res.updater.map(item=>{
        return item.Username
      })
      this.sponsor = res.sponsor.map(item=>{
        return item.Username
      })
      this.participant = res.participant.map(item=>{
        return item.Username
      })
    })
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
