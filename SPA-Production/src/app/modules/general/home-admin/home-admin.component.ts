import { Component, OnDestroy, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import { environment } from '../../../../environments/environment';
import { DataService } from '../../../_core/_services/data.service';
@Component({
  selector: 'app-home-admin',
  templateUrl: './home-admin.component.html',
  styleUrls: ['./home-admin.component.css']
})
export class HomeAdminComponent implements OnInit,OnDestroy {
  baseUrl: any = environment.apiUrl
  locale: any = this.cookieService.get('Lang')
  menuAdmin: any [] = []
  changeLocalHomeAdmin: any;
  constructor(
    private http: HttpClient,
    private dataService: DataService,
    private cookieService: CookieService
  ) { }

  ngOnInit(): void {
    // this.getMenuAdmin()
    this.changeLocalHomeAdmin = this.dataService.currentSourceLang.subscribe((res: any)=>{
      this.locale = res ;
      this.getMenuAdmin();
    })
  }
  ngOnDestroy() {
    this.changeLocalHomeAdmin.unsubscribe();
  }
  getMenuAdmin() {
    this.http.get(this.baseUrl + `Menus/GetMenuAdmin/${this.locale}`).subscribe((res: any) =>{
      this.menuAdmin = res
    })
  }
}
