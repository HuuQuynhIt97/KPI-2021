import { JwtHelperService } from '@auth0/angular-jwt';
import { Component, OnInit } from '@angular/core';
import { TreeGridComponent } from '@syncfusion/ej2-angular-treegrid';
import { FilterService } from '@syncfusion/ej2-angular-treegrid';
import { SortService,ToolbarService, PageService, EditService, ExcelExportService, PdfExportService, ContextMenuService } from '@syncfusion/ej2-angular-treegrid';
import { ResizeService } from '@syncfusion/ej2-angular-grids';
import {  NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import { CookieService } from 'ngx-cookie-service';
import { environment } from '../../../../../environments/environment';
import { UserlevelService } from '../../../../_core/_services/userlevel.service';
import { AlertifyService } from '../../../../_core/_services/alertify.service';
@Component({
  selector: 'app-add-user-to-level',
  templateUrl: './add-user-to-level.component.html',
  styleUrls: ['./add-user-to-level.component.css'],
  providers: [SortService,ResizeService, ToolbarService, PageService,
     EditService, ExcelExportService, PdfExportService, ContextMenuService,FilterService]
})
export class AddUserToLevelComponent implements OnInit {
  // tslint:disable-next-line: no-inferrable-types
  lines: string = 'Both'
  baseUrl: any = environment.apiUrl
  modalReference: NgbModalRef
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
  public pageSettings: any = { pageSize: 100 }
  public pageSettings2: any = { pageSize: 10 }
  expanded: any = {}
  data: any[] = []
  data2: any[] = []
  page: any = 1
  pageSize: any = 1000
  levelid: any = 0
  ocId: any = 0
  title: any
  code: any = ' '
  isHide: any = false
  locale: any = this.cookieService.get('Lang')
  jwtHelper = new JwtHelperService();
  userid: any = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid)
  constructor(
    private cookieService: CookieService,
    private userlevelService: UserlevelService,
    private alertify : AlertifyService
  ) { }

  ngOnInit(): void {
    setTimeout(() => {
      this.getOc()
    }, 500)
  }

  No(index) {
    return parseFloat(index) + 1
  }

  rowSelected(args){
    this.title = '- ' + args.data.title
    this.levelid = args.data.levelnumber
    this.ocId = args.data.key
    this.LoadDataUser()
    this.isHide = true
  }

  getOc(){
    this.userlevelService.getOc(this.userid)
    .subscribe((res: any)=>{
      this.data = res
    })
  }

  LoadDataUser(){
    this.userlevelService.LoadDataUser(this.ocId,this.code,this.page,this.pageSize)
    .subscribe((res: any)=>{
      this.data2 = res.data
    })
  }

  addUserToLevel(data){
    if(!data.Status === true){
      this.userlevelService.addUserToLevel(data.ID,this.ocId,localStorage.getItem('user'))
      .subscribe((res: any) => {
        this.alertify.success('Add User successfully')
        this.LoadDataUser()
      })
    }
    else{
      this.userlevelService.addUserToLevel(data.ID,this.ocId,localStorage.getItem('user'))
      .subscribe((res: any)=>{
        this.alertify.success('Uncheck User successfully')
        this.LoadDataUser()
      })
    }
  }

}
