import { AlertifyService } from './../../../../_core/_services/alertify.service';
import { JwtHelperService } from '@auth0/angular-jwt';
import { Component, OnInit ,ViewChild } from '@angular/core';
import { NgbModal , NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import { FilterService } from '@syncfusion/ej2-angular-treegrid';
import {
  EditService,
  PageService,
  FreezeService,
  SelectionService ,
  CommandColumnService,
  ResizeService,
  SortService ,
  ExcelExportService,
  ContextMenuService,
  GridComponent,
  DataStateChangeEventArgs} from '@syncfusion/ej2-angular-grids';
import { CookieService } from 'ngx-cookie-service';
import { ToolbarService } from '@syncfusion/ej2-angular-grids';
import { ToolbarItems } from '@syncfusion/ej2-angular-grids';
import { IEditCell } from '@syncfusion/ej2-angular-grids';
import { environment } from '../../../../../environments/environment';
import { Unit } from '../../../../_core/_models/Unit';
import { KpiModel } from '../../../../_core/_models/kpi-model';
import { KpiKindService } from '../../../../_core/_services/kpi-kind.service';
import { AdminKPIService } from '../../../../_core/_services/admin-kpi.service';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-admin-kpi',
  templateUrl: './admin-kpi.component.html',
  styleUrls: ['./admin-kpi.component.css'],
  providers: [
    FreezeService,SelectionService,
    SortService,ToolbarService,PageService ,ResizeService,EditService,
    CommandColumnService,ExcelExportService,ContextMenuService,FilterService]
})
export class AdminKPIComponent implements OnInit {
  public data: object[];
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
  unit: any [] = []
  locale: string = this.cookieService.get('Lang')
  name: string = ' '
  page: any = 1
  pageSettings = {pageCount: 5}
  pageSize: any = 1000
  toolbarOptions = ['Search']
  searchSettings: any = { hierarchyMode: 'Name' }
  baseUrl: string = environment.apiUrl
  modalReference: NgbModalRef
  modalTitle: string
  public country: Unit[] = [
    { Name: 'Percentage', ID: 1 },
    { Name: 'Numeric',  ID: 2 }
  ]
  NameVI: string = null
  NameEn: string = null
  NameTW: string = null
  NameVIEdit: string = null
  NameEnEdit: string = null
  NameTWEdit: string = null
  Unit: string = null
  UnitEdit: string = null
  ID: any
  over: any = 0
  overEdit: any = 0
  dataUnit: any [] = []

  edit: any = {
    key: 0,
    title: '',
  }

  kpi: KpiModel = {
    NameVI: null,
    NameEn: null,
    NameTW: null,
    Unit: 0,
    Description: null,
    KPI_Kind_ID: 0,
    Status: 0,
    UserID: 0
  }

  lines: string = 'Both';
  jwtHelper = new JwtHelperService();
  userid: any = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid)
  @ViewChild('grid', { static: true }) public grid: GridComponent;
  dataKind: object
  Kind: any
  KindEdit: any
  Description: string = null
  DescriptionEdit: string = null
  constructor(
    private cookieService: CookieService,
    private modalService: NgbModal,
    private kpiKindService: KpiKindService,
    private adminKPIService : AdminKPIService,
    private alertify : AlertifyService,
    private spinner: NgxSpinnerService,
  ) {
   }

  ngOnInit(): void {
    this.spinner.show()
    this.LoadData()
    this.getUnit()
  }
  public dataStateChange(state): void {
    console.log('dataStateChange', state);
  }
  getKpiKind() {
    this.kpiKindService.getAllKpiKindWithLang(this.locale).subscribe((res: object) => {
      this.dataKind = res ;
    })
  }

  LoadData() {
    this.adminKPIService.GetAllKPI(this.page, this.pageSize, this.name, this.locale)
    .subscribe((result: any) => {
      this.data = result.data
      this.spinner.hide();
    })
  }

  actionComplete(args){
    if (args.requestType === 'save') {
      this.edit.title = args.data.title;
    }
  }

  getUnit() {
    this.adminKPIService.getAllUnit().subscribe((res: any) =>{
      this.dataUnit = res
    })
  }

  openAddOC(addKPI){
    this.modalReference = this.modalService.open(addKPI,{ size: 'xl' })
    this.getKpiKind();
  }

  openEdit(Edit){
    this.modalReference = this.modalService.open(Edit,{ size: 'xl' })
    this.getKpiKind();
  }

  save(){
    this.kpi.UserID = this.userid
    if (this.kpi.NameVI == null) {
      this.kpi.NameVI = this.kpi.NameEn
    }
    // tslint:disable-next-line: radix
    this.kpi.Status = parseInt(this.over)
    this.adminKPIService.created(this.kpi).subscribe(() =>{
      this.alertify.success('Add KPI successfully');
      this.LoadData();
      this.resetForm();
      this.modalReference.close();
    })
  }

  resetForm() {
    return this.kpi = {
      NameVI: null,
      NameEn: null,
      NameTW: null,
      Unit: 0,
      Description: null,
      KPI_Kind_ID: 0,
      Status: 1,
      UserID: 0
    }
  }

  EditKPI(id,Edit){
    this.openEdit(Edit)
    this.adminKPIService.getbyID(id).subscribe((res: any) =>{
      this.ID = res.ID
      this.NameVIEdit = res.NameVI
      this.NameEnEdit = res.NameEn
      this.NameTWEdit = res.NameTW
      this.DescriptionEdit = res.Description
      this.KindEdit = res.KPI_Kind_ID
      this.UnitEdit = res.Unit
      this.overEdit = this.converStatus(res.Status)
    })
  }

  converStatus(status){
    if(status === true) {
      return 1
    }
    else {
      return 0
    }
  }

  update(){
    let entity = {
      ID: this.ID,
      NameVI: this.NameVIEdit,
      NameEn: this.NameEnEdit,
      NameTW: this.NameTWEdit,
      Description: this.DescriptionEdit,
      KPI_Kind_ID: this.KindEdit,
      // tslint:disable-next-line: radix
      Status: parseInt(this.overEdit),
      Unit: this.UnitEdit
    }
    this.adminKPIService.update(entity).subscribe(res => {
      this.alertify.success('Update KPI successfully')
      this.LoadData()
      this.modalReference.close()
    })
  }

  Delete(id){
    this.alertify.confirm('Delete KPI', "Are you sure? You won't be able to revert this!", () => {
      this.adminKPIService.delete(id)
      .subscribe(() => {
        this.alertify.success('KPI has been deleted')
        this.LoadData()
      })
    });
  }

}

