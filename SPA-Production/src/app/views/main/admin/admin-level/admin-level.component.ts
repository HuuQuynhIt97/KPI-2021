import { Component, OnInit } from '@angular/core';
import { TreeGridComponent } from '@syncfusion/ej2-angular-treegrid';
import { FilterService } from '@syncfusion/ej2-angular-treegrid';
import { SortService,ToolbarService, PageService, EditService, ExcelExportService, PdfExportService, ContextMenuService } from '@syncfusion/ej2-angular-treegrid';
import { NgbModal , NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import { JwtHelperService } from '@auth0/angular-jwt';
import { environment } from '../../../../../environments/environment';
import { AdminLevelService } from '../../../../_core/_services/admin-level.service';
import { AlertifyService } from '../../../../_core/_services/alertify.service';

@Component({
  selector: 'app-admin-level',
  templateUrl: './admin-level.component.html',
  styleUrls: ['./admin-level.component.css'],
  providers: [SortService, ToolbarService, PageService, EditService, ExcelExportService, PdfExportService, ContextMenuService,FilterService]
})
export class AdminLevelComponent implements OnInit {
  role: number = Number(localStorage.getItem('role'))
  baseUrl = environment.apiUrl
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
    'Search',
    'ExpandAll',
    'CollapseAll',
  ]
  jwtHelper = new JwtHelperService();
  userid: number = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid)
  editing: any = { allowDeleting: true, allowEditing: true, mode: 'Row' }
  public pageSettings: any = { pageSize: 100 }
  expanded: any = {}
  data: object = []
  oc: any = { id: 0, Code: '', Name: '', LevelNumber: 1, ParentID: 0 }
  edit: any = {
    key: 0,
    title: '',
    code: ''
  }
  name: string
  modalTitle: string = 'Add OC'
  constructor(
    private modalService: NgbModal,
    private adminLevelService: AdminLevelService,
    private alertify : AlertifyService
  ) { }

  ngOnInit(): void {
    setTimeout(()=>{
      this.GetOcs()
    },300)
  }

  actionComplete(args){
    if (args.requestType === 'save') {
      this.edit.title = args.data.title;
      this.edit.code = args.data.code;
      let obj = {
        key: this.edit.key,
        title: this.edit.title,
        code: this.edit.code
      }
      this.adminLevelService.Rename(obj)
      .subscribe((res: any) => {
        if(res) {
          this.alertify.success('Edit Successfully')
          this.GetOcs()
        }else {
          this.alertify.error('Code already Exist')
          this.GetOcs()
        }
      });
    }
  }

  rowSelected(args){
    this.edit = {
      key: args.data.key,
      title: args.data.title,
      code: args.data.code
    };
    this.oc = {
      id: args.data.key,
      Name: args.data.title,
      LevelNumber: args.data.levelnumber,
      ParentID: args.data.parentid
    }
  }

  contextMenuClick(args,addSubOC){
    if (args.item.id === 'Add-Child-OC') {
      this.modalTitle = 'Add Sub OC'
      this.openLgAddSubOC(addSubOC)
      this.oc = { id: 0, Code: '', Name: '', LevelNumber: args.rowInfo.rowData.levelnumber + 1, ParentID: args.rowInfo.rowData.key }
    } else {
      this.delete(args.rowInfo.rowData.key)
    }
  }

  openAddOC(addOC){
    this.modalReference = this.modalService.open(addOC,{ size: 'xl' })
  }

  openLgAddSubOC(addSubOC){
    this.modalReference = this.modalService.open(addSubOC,{ size: 'xl' })
  }

  GetOcs(){
    this.adminLevelService.GetOcs(this.userid)
    .subscribe((res: object) => {
      this.data = res
    })
  }

  save(){
    if (this.oc.ParentID > 0) {
      this.adminLevelService.save(this.oc)
      .subscribe((res) => {
        if (res) {
          this.clearFrom();
          this.GetOcs();
          this.modalReference.close()
          this.alertify.success('Add SubOC successfully')
        } else {
          this.alertify.error('Add SubOC Fail')
        }
      })
    } else {
      this.adminLevelService.save(this.oc)
      .subscribe((res) => {
        if (res) {
          this.clearFrom();
          this.GetOcs();
          this.modalReference.close()
          this.alertify.success('Add OC successfully')
        } else {
          this.alertify.error('Add OC Fail')
        }
      });
    }
  }

  delete(id){
    this.alertify.confirm('Delete OC', "Are you sure? You won't be able to revert this!", () => {
      this.adminLevelService.delete(id)
      .subscribe(() =>{
        this.alertify.success('OC has been deleted')
        this.GetOcs()
      })
    })
  }

  clearFrom() {
    this.oc = { id: 0, name: '', level: 0 };
  }

}
