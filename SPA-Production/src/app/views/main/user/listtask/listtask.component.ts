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
const httpOptions = {
  headers: new HttpHeaders({
    Authorization: 'Bearer ' + localStorage.getItem('token'),
  }),
};
@Component({
  selector: 'app-listtask',
  templateUrl: './listtask.component.html',
  styleUrls: ['./listtask.component.css'],
  providers: [
  ToolbarService,PageService,EditService,CommandColumnService,FilterService,ResizeService
  ]
})
export class ListtaskComponent implements OnInit {
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
  ) { }

  ngOnInit(): void {
    this.loadTask()
  }
  rowSelected(args){

  }
  actionComplete(args){

  }
  loadTask(){
    this.http.post(this.baseUrl +
       `ChartPeriod/ListTasks/${this.route.snapshot.params.kpilevelcode}/${this.page}/${this.pageSize}`,httpOptions)
    .subscribe((res: any)=>{
      this.data = res.data
    })
  }
}
