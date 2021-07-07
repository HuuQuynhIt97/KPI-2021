import { Component, OnInit  } from '@angular/core';
import { NgbModal , NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import { SortService , ExcelExportService, ContextMenuService } from '@syncfusion/ej2-angular-treegrid';
import { FilterService    } from '@syncfusion/ej2-angular-treegrid';
import { EditService, PageService, CommandColumnService, ResizeService } from '@syncfusion/ej2-angular-grids';
import { ToolbarService } from '@syncfusion/ej2-angular-grids';
import { ToolbarItems } from '@syncfusion/ej2-angular-grids';
import { CookieService } from 'ngx-cookie-service';
import {  IEditCell } from '@syncfusion/ej2-angular-grids';

import { JwtHelperService } from '@auth0/angular-jwt';
import { environment } from '../../../../../environments/environment';
import { Unit } from '../../../../_core/_models/Unit';
import { AdminUserService } from '../../../../_core/_services/admin-user.service';
import { AlertifyService } from '../../../../_core/_services/alertify.service';

@Component({
  selector: 'app-admin-user',
  templateUrl: './admin-user.component.html',
  styleUrls: ['./admin-user.component.css'],
  providers: [
  SortService,ToolbarService,PageService,EditService,CommandColumnService,ExcelExportService,ContextMenuService,FilterService,ResizeService
  ]
})
export class AdminUserComponent implements OnInit {
  jwtHelper = new JwtHelperService();
  userid: any = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid)
  role = localStorage.getItem('role')
  lines: string = 'Both'
  public unitParams: IEditCell;
  public toolbar: ToolbarItems[];
  commands = [
    { type: 'Edit', buttonOption: { iconCss: ' e-icons e-edit', cssClass: 'e-flat' } },
    { type: 'Delete', buttonOption: { iconCss: 'e-icons e-delete', cssClass: 'e-flat' } },
    { type: 'Save', buttonOption: { iconCss: 'e-icons e-update', cssClass: 'e-flat' } },
    { type: 'Cancel', buttonOption: { iconCss: 'e-icons e-cancel-icon', cssClass: 'e-flat' } }
  ]
  freightrules =  { required: true }
  customeridrules = { required: true }
  orderidrules = { required: true }
  public data: object[];
  editSettings: any = { allowEditing: true, allowAdding: true, allowDeleting: true, mode: 'Normal', allowEditOnDblClick: false };
  pageSettings = {pageCount: 5}
  locale: any = this.cookieService.get('Lang')
  page: any = 1
  pageSize: any = 1000
  toolbarOptions = ['Search']
  searchSettings: any = { hierarchyMode: 'Name' }
  baseUrl = environment.apiUrl
  modalReference: NgbModalRef
  name: string = ' '
  unit: any [] = []
  modalTitle: any
  public country: Unit[] = [
    { Name: 'Percentage', ID: 1 },
    { Name: 'Numeric',  ID: 2 }
  ]
  username: string = null
  password: string = null
  email: string = null
  permission: null
  fullname: string = null
  displayname: string = null
  skype: string = null
  code: string = null
  usernameEdit: string = null
  emailEdit: string = null
  fullnameEdit: string =  null
  displaynameEdit: string = null
  skypeEdit: string = null
  codeEdit: string = null
  permissionEdit: ''
  ID: any
  dataUnit: any [] = []
  edit: any = {
    key: 0,
    title: '',
  }
  constructor(
    private cookieService: CookieService,
    private modalService: NgbModal,
    private adminUserService : AdminUserService,
    private alertify : AlertifyService
  ) {
   }

  ngOnInit(): void {
    this.LoadData()
    this.getUnit()
  }

  ResetPass(data) {
    this.alertify.confirm('Reset Password', 'Are you sure you want to reset the password for user ' + data.FullName + '?' , () => {
      const mObj = {
        Email: data.Email,
        Username: data.Username
      }
      this.adminUserService.ResetPass(mObj)
      .subscribe(() => {
        this.alertify.success('Password has been reset for user'+ ' ' + data.FullName)
      })
    })
  }

  LoadData() {
    this.adminUserService.LoadData(this.page, this.pageSize, this.name)
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
    this.adminUserService.getUnit()
    .subscribe((res: any)=>{
      this.dataUnit = res
    })
  }

  openAddUser(addUser){
    this.modalReference = this.modalService.open(addUser,{ size: 'lg' })
  }

  openEdit(Edit){
    this.modalReference = this.modalService.open(Edit,{ size: 'lg' })
  }

  save(){
    let entity = {
      Username: this.username,
      Password: this.password,
      Email: this.email,
      Alias: this.displayname,
      FullName: this.fullname,
      Skype: this.skype,
      Code: this.code,
      Permission: this.permission,
      Role: this.permission
    }
    this.adminUserService.save(entity)
    .subscribe(()=>{
      this.alertify.success('Add User successfully')
      this.LoadData()
      this.modalReference.close()
    })
  }

  EditUser(id,Edit){
    this.openEdit(Edit)
    this.adminUserService.getUserByID(id)
    .subscribe((res: any)=>{
      this.ID = res.ID
      this.usernameEdit = res.Username
      this.emailEdit = res.Email
      this.displaynameEdit = res.Alias
      this.fullnameEdit = res.FullName
      this.skypeEdit = res.Skype
      this.codeEdit = res.Code
      this.permissionEdit = res.Permission
    })
  }

  update(){
    let entity = {
      ID: this.ID,
      Username: this.usernameEdit,
      Email: this.emailEdit,
      Alias: this.displaynameEdit,
      FullName: this.fullnameEdit,
      Skype: this.skypeEdit,
      Code: this.codeEdit,
      Permission: this.permissionEdit,
      Role: this.permissionEdit
    }
    this.adminUserService.update(entity)
    .subscribe(() => {
      this.alertify.success('Update User successfully')
      this.LoadData()
      this.modalReference.close()
    })
  }

  Delete(id){
    this.alertify.confirm('Delete', "You won't be able to revert this!" , () => {
      this.adminUserService.delete(id)
      .subscribe(() =>{
        this.alertify.success('User has been deleted')
        this.LoadData()
      })
    })
  }

  updateState(data){
    if(!data.IsActive === true){
      this.adminUserService.updateState(data.ID)
      .subscribe(() => {
        this.alertify.success('Unlock User successfully')
      })
    }
    else{
      this.adminUserService.updateState(data.ID)
      .subscribe(() => {
        this.alertify.success('Locked User successfully')
      })
    }
  }
}
