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
import { ListHistoryNotificationService } from '../../../../_core/_services/list-history-notification.service';
import { DatePipe } from '@angular/common';
import { AlertifyService } from '../../../../_core/_services/alertify.service';

@Component({
  selector: 'app-list-history-notification',
  templateUrl: './list-history-notification.component.html',
  styleUrls: ['./list-history-notification.component.css'],
  providers: [
    DatePipe,
    ToolbarService,PageService,EditService,CommandColumnService,FilterService,ResizeService
  ]
})
export class ListHistoryNotificationComponent implements OnInit {

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
  constructor(
    private cookieService: CookieService,
    private router: Router,
    private route: ActivatedRoute,
    private http: HttpClient,
    private dataService: DataService,
    private listHistoryNotificationService: ListHistoryNotificationService,
  ) { }

  ngOnInit(): void {
    this.LoadAll()
  }
  gettask(Link) {
    this.dataService.changeMessage(Link)
    return this.router.navigate([Link])
  }
  LoadAll(){
    this.listHistoryNotificationService.LoadAll()
    .subscribe((res: any)=>{
      this.data = res
    })
  }
}
