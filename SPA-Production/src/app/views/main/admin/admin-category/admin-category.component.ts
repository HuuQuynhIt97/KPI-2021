import { JwtHelperService } from '@auth0/angular-jwt';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgbModal , NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import { FilterService } from '@syncfusion/ej2-angular-treegrid';
import { SortService , ExcelExportService, ContextMenuService } from '@syncfusion/ej2-angular-treegrid';
import { EditService, PageService, CommandColumnService, ResizeService } from '@syncfusion/ej2-angular-grids';
import { CookieService } from 'ngx-cookie-service';
import { ToolbarService } from '@syncfusion/ej2-angular-grids';
import { ToolbarItems } from '@syncfusion/ej2-angular-grids';
import {  IEditCell } from '@syncfusion/ej2-angular-grids';
import { DropDownTreeComponent } from '@syncfusion/ej2-angular-dropdowns';
import { environment } from '../../../../../environments/environment';
import { KpiKindService } from '../../../../_core/_services/kpi-kind.service';
import { AdminCategoryService } from '../../../../_core/_services/admin-category.service';
import { AlertifyService } from '../../../../_core/_services/alertify.service';

@Component({
  selector: 'app-admin-category',
  templateUrl: './admin-category.component.html',
  styleUrls: ['./admin-category.component.css'],
  providers: [
    SortService,ToolbarService,PageService,EditService,ResizeService,
    CommandColumnService,ExcelExportService,ContextMenuService,FilterService]
})
export class AdminCategoryComponent implements OnInit {
  lines: string = 'Both'
  jwtHelper = new JwtHelperService();
  userid: any = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid)
  public data: object[];
  // public editSettings: EditSettingsModel;
  public unitParams: IEditCell;
  public toolbar: ToolbarItems[];
  editSettings: any = { allowEditing: true, allowAdding: true, allowDeleting: true, mode: 'Normal', allowEditOnDblClick: false };
  commands = [
    { type: 'Edit', buttonOption: { iconCss: ' e-icons e-edit', cssClass: 'e-flat' } },
    { type: 'Delete', buttonOption: { iconCss: 'e-icons e-delete', cssClass: 'e-flat' } },
    { type: 'Save', buttonOption: { iconCss: 'e-icons e-update', cssClass: 'e-flat' } },
    { type: 'Cancel', buttonOption: { iconCss: 'e-icons e-cancel-icon', cssClass: 'e-flat' } }
  ]
  freightrules =  { required: true }
  customeridrules = { required: true }
  orderidrules = { required: true }
  pageSettings = {pageCount: 5}
  // data: any [] = []
  unit: any [] = []
  locale: any = this.cookieService.get('Lang')
  name: any = ' '
  page: any = 1
  pageSize: any = 1000
  toolbarOptions = ['Search']
  searchSettings: any = { hierarchyMode: 'Name' }
  baseUrl = environment.apiUrl
  modalReference: NgbModalRef
  modalTitle: string = null
  NameVI: string = null
  NameEn: string = null
  NameTW: string = null
  NameVIEdit: string = null
  NameEnEdit: string = null
  NameTWEdit: string = null
  Unit: string = null
  UnitEdit: string = null
  ID: any
  Level: 0
  Code: string = null
  CodeEdit: string = null
  LevelEdit: any
  LevelEditDefault: any
  dataUnit: any [] = []
  Kind: null
  KindEdit: null
  dataKind: object = []
  edit: any = {
    key: 0,
    title: '',
  }
  public dataOC: { [key: string]: Object }[] = [
    { id: 1, name: '1'},
    { id: 2, name: '2'},
    { id: 3, name: '3'},
    { id: 4, name: '4'},
    { id: 5, name: '5'},
  ];
  public fields:Object = { dataSource: this.dataOC, value: 'id', text: 'name', parentValue:"pid", hasChildren: 'hasChild'  };
  @ViewChild('dropdownTree')
  public ddTree: DropDownTreeComponent;
  @ViewChild('dropdownTreeEdit')
  public ddTreeEdit: DropDownTreeComponent;
  ListLevel: object = [];
  value: object = []
  constructor(
    private cookieService: CookieService,
    private modalService: NgbModal,
    private kpiKindService: KpiKindService,
    private adminCategoryService: AdminCategoryService,
    private alertify : AlertifyService
  ) {
   }

  ngOnInit(): void {
    this.LoadData()
    this.getUnit()
  }

  public onChange(args: any): void {
    if (args !== undefined) {
      if(args.isInteracted) {
        const defaultObj = args.element.ej2_instances;
        this.ListLevel = defaultObj[0].selectedData;
      }
    }
  }

  public onChangeEdit(args: any): void {
    if (args !== undefined) {
      if(args.isInteracted) {
        const defaultObj = args.element.ej2_instances;
        this.LevelEdit = defaultObj[0].selectedData;
      }
    }
  }

  ngAfterViewInit(e: any): void {
    // call the change event's function after initialized the component.
    setTimeout(() => {
      this.onChange(e);
    })
  }

  Levels(data){
    return data.Level.join(',')
  }

  getKpiKind() {
    this.kpiKindService.getAllKpiKindWithLang(this.locale).subscribe((res: object) => {
      this.dataKind = res ;
    })
  }

  LoadData() {
    this.adminCategoryService.GetAllCategory(this.page, this.pageSize, this.name,this.locale)
    .subscribe((res: any) =>{
      this.data = res.data
    })
  }

  actionComplete(args){
    if (args.requestType === 'save') {
      this.edit.title = args.data.title;
    }
  }

  getUnit() {
    this.adminCategoryService.getAllUnit()
    .subscribe((res: any)=>{
      this.dataUnit = res
    })
  }

  openAddOC(addCategory){
    this.modalReference = this.modalService.open(addCategory,{ size: 'xl' })
    this.getKpiKind();
  }

  openEdit(Edit){
    this.modalReference = this.modalService.open(Edit,{ size: 'xl' })
    this.getKpiKind();
  }

  save(){
    let categoryModel = {
      NameVI: this.NameVI,
      NameEn: this.NameEn,
      NameTW: this.NameTW,
      Code: this.Code,
      LevelID: this.Level,
      Cate_Kind_ID: this.Kind,
      LevelID2: this.ListLevel,
      UserID: this.userid
    }
    this.adminCategoryService.created(categoryModel).subscribe((res: any)=>{
      this.alertify.success('Add Category successfully')
      this.LoadData()
      this.modalReference.close()
      this.ListLevel = [] ;
    })
  }

  EditCategory(id,Edit){
    this.openEdit(Edit)
    this.adminCategoryService.getbyID(id).subscribe((res: any)=>{
      this.ID = res.ID
      this.NameVIEdit = res.NameVI
      this.NameEnEdit = res.NameEn
      this.NameTWEdit = res.NameTW
      this.KindEdit = res.Cate_Kind_ID
      this.CodeEdit = res.Code
      this.LevelEdit = res.List_Level
      this.value = res.List_Level
      this.LevelEditDefault = res.List_Level.length
    })
  }

  update(){
    let entity = {
      ID: this.ID,
      NameVI: this.NameVIEdit,
      NameEn: this.NameEnEdit,
      NameTW: this.NameTWEdit,
      LevelID: this.Level,
      LevelID2: this.LevelEdit,
      Cate_Kind_ID: this.KindEdit,
      Code: this.CodeEdit
    }
    if((this.LevelEdit.length)/2 !== this.LevelEditDefault) {
      this.alertify.confirm('Change Level', 'Are you sure? If your change the level number! you may lose data from OC Category and OC Category KPI' , () => {
        this.adminCategoryService.update(entity)
        .subscribe((res: any) => {
          this.alertify.success('Update Category successfully')
          this.LoadData()
          this.modalReference.close()
        })
      })

    }else{
      this.adminCategoryService.update(entity)
      .subscribe((res: any) => {
        this.alertify.success('Update Category successfully')
        this.LoadData()
        this.modalReference.close()
      })
    }
  }

  Delete(id){
    this.alertify.confirm('Delete Category', "Are you sure? You won't be able to revert this!" , ()=>{
      this.adminCategoryService.delete(id)
      .subscribe((res: any)=>{
        this.alertify.success('Category has been deleted')
        this.LoadData()
      })
    })
  }
}
