import { Component, OnInit } from '@angular/core';
import  swal  from 'sweetalert2';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import {Router, ActivatedRoute } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { JwtHelperService } from '@auth0/angular-jwt';
import { FilterService ,ResizeService   } from '@syncfusion/ej2-angular-treegrid';
import { EditService, PageService, CommandColumnService, CommandModel } from '@syncfusion/ej2-angular-grids';
import { ToolbarService } from '@syncfusion/ej2-angular-grids';
import { environment } from '../../../../../environments/environment';
import { DataService } from '../../../../_core/_services/data.service';
import { LateOnUploadService } from '../../../../_core/_services/late-on-upload.service';
import { AlertifyService } from '../../../../_core/_services/alertify.service';

@Component({
  selector: 'app-late-on-upload',
  templateUrl: './late-on-upload.component.html',
  styleUrls: ['./late-on-upload.component.css'],
  providers: [
    ToolbarService,PageService,EditService,CommandColumnService,FilterService,ResizeService
  ]
})
export class LateOnUploadComponent implements OnInit {

  jwtHelper = new JwtHelperService();
  public data: object[];
  editSettings: any = { allowEditing: true, allowAdding: true, allowDeleting: true, mode: 'Normal', allowEditOnDblClick: false };
  pageSettings = {pageSize: 10}
  locale: any = this.cookieService.get('Lang')
  page: any = 1
  pageSize: any = 1000
  toolbarOptions = ['Search']
  searchSettings: any = { hierarchyMode: 'Name' }
  baseUrl: any = environment.apiUrl
  userid: any = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid)
  NotificationID: any
  getnoti: any
  constructor(
    private cookieService: CookieService,
    private router: Router,
    private route: ActivatedRoute,
    private http: HttpClient,
    private dataService: DataService,
    private lateOnUploadService: LateOnUploadService,
  ) { }

  ngOnInit(): void {

  }
  GetNotifi(){
    this.getnoti = this.dataService.currentMessage.subscribe((data: any)=>{
      this.NotificationID = data.NotificationID
      this.LoadAll()
    })
  }
  LoadAll(){
    this.lateOnUploadService.LoadAll(this.NotificationID,this.page,this.pageSize)
    .subscribe((res: any)=>{
      this.data = res.data
    })
  }
}
