import { DataService } from './../../../_core/_services/data.service';
import { HomeService } from './../../../_core/_services/home.service';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { environment } from '../../../../environments/environment';
import {Router, ActivatedRoute } from '@angular/router';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import { NgbModal , NgbModalRef  } from '@ng-bootstrap/ng-bootstrap';
import { TreeGridComponent } from '@syncfusion/ej2-angular-treegrid';

import { FilterService } from '@syncfusion/ej2-angular-treegrid';
import { ClipboardService } from 'ngx-clipboard'
import { CookieService } from 'ngx-cookie-service';
import  swal  from 'sweetalert2';
import { SortService,ToolbarService, PageService, EditService, ExcelExportService, PdfExportService, ContextMenuService } from '@syncfusion/ej2-angular-treegrid';
const httpOptions = {
  headers: new HttpHeaders({
    Authorization: 'Bearer ' + localStorage.getItem('token'),
  }),
};
@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
  providers: [SortService, ToolbarService, PageService, EditService, ExcelExportService, PdfExportService, ContextMenuService,FilterService]
})
export class HomeComponent implements OnInit,OnDestroy {
  baseUrl: any = environment.apiUrl
  menus: any [] = []
  menuAdmin: object [] = []
  menuUser: object [] = []
  locale: any = this.cookieService.get('Lang')
  role: any = ''
  tabsAdmin: boolean = false
  tabsUser: boolean = true
  changeLocalHome: any
  moderator: boolean = false
  User: boolean = true
  constructor(
    private cookieService: CookieService,
    private clipboardService: ClipboardService,
    private modalService: NgbModal,
    private router: Router,
    private route: ActivatedRoute,
    private http: HttpClient,
    private dataService: DataService,
    private homeService: HomeService
  ) {
      this.changeLocalHome = this.dataService.currentSourceLang.subscribe((res: any)=>{
        this.locale = res
        this.getMenuUser();
        this.getMenuAdmin();
      })
  }

  ngOnInit() {
    // this.Getmenu()
    // this.getMenuAdmin()
    // this.getMenuUser()
    this.role = localStorage.getItem('role')
    // this.dataService.currentMessage.subscribe((result: any) =>{
    //   if (result === 'classAdmin') {
    //     this.moderator = true
    //     this.User = false
    //   }else {
    //     this.moderator = false
    //     this.User = true
    //   }
    // })
  }

  ngOnDestroy() {
    this.changeLocalHome.unsubscribe();
  }

  Getmenu(){
    this.http.get(this.baseUrl + `Menus/Getall2/${this.locale}`).subscribe((res: any)=>{
      this.menus = res
    })
  }

  getMenuAdmin() {
    this.http.get(this.baseUrl + `Menus/GetMenuAdmin/${this.locale}`).subscribe((res: any) =>{
      this.menuAdmin = res
    })
  }

  getMenuUser() {
    this.http.get(this.baseUrl + `Menus/GetMenuUser/${this.locale}`).subscribe((res: any) =>{
      this.menuUser = res
    })
  }

}
