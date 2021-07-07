import {AfterViewInit, Component, OnInit } from '@angular/core';
import { navItems } from './../../_nav';
import { navItemsAdmin } from './../../_nav_admin';
import { navItemsUser } from '../../_nav_user';
import { AlertifyService } from '../../_core/_services/alertify.service';
import { Router } from '@angular/router';
import { DomSanitizer } from '@angular/platform-browser';
import * as moment from 'moment';
import { AuthService } from '../../_core/_services/auth.service';
import { TranslateService } from '@ngx-translate/core';
import { CookieService } from 'ngx-cookie-service';
import { DataService } from '../../_core/_services/data.service';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { SignalRService } from '../../_core/_services/signal-r.service';
import { NgbModal, NgbModalRef } from '@ng-bootstrap/ng-bootstrap';
const httpOptions = {
  headers: new HttpHeaders({
    Authorization: 'Bearer ' + localStorage.getItem('token'),
  }),
};
@Component({
  selector: "app-dashboard",
  templateUrl: "./default-layout.component.html"
})

export class DefaultLayoutComponent implements OnInit, AfterViewInit {
  public sidebarMinimized = false ;
  public navItems = navItems ;
  public navItemsAdmin = navItemsAdmin ;
  public navItemsUser = navItemsUser ;
  role: any
  levelOC: any
  isAdmin: boolean = true ;
  lang  = this.cookieService.get('Lang') ;
  currentUser: string;
  avatar: any;
  currentTime: any;
  listdata: any
  baseUrl: string = environment.apiUrl
  arrayID: any [] = []
  data: any [] = []
  languages: any = [
    { flag: 'tw', language: 'zh-TW', title: '中文' },
    { flag: 'us', language: 'en', title: 'English' },
    { flag: 'vn', language: 'vi', title: 'Local language' }
  ]
  type: string = 'password'
  fonticon: string = 'fa fa-eye-slash'
  modalReference: NgbModalRef
  user: string
  password : string = null
  value: string = "en";
  constructor(
    private sanitizer: DomSanitizer,
    private authService: AuthService,
    private alertify: AlertifyService,
    public translate: TranslateService,
    private cookieService: CookieService,
    private dataService: DataService,
    private http: HttpClient,
    public signalRService: SignalRService,
    private modalService: NgbModal,
    private router: Router)
  {

  }
  OpenModelPassWord(changePassWord) {
    this.modalReference = this.modalService.open(changePassWord,{ size: 'md' })
  }
  showPassword(){
    if(this.type === 'password') {
      this.type = 'text'
      this.fonticon = 'fa fa-eye'
     } else {
      this.type = 'password'
      this.fonticon = 'fa fa-eye-slash'
     }
  }

  changepassword(){
    let mObj = {
      Username: this.user ,
      Password: this.password,
    }
    this.http.post(this.baseUrl + 'AdminUser/ChangePassword', mObj)
    .subscribe(() =>{
      this.alertify.success('ChangePass successfully! Please Login again')
      this.modalReference.close()
      this.authService.logout()
      const uri = this.router.url;
      this.router.navigate(['login'],{queryParams:{uri}})
    })
  }

  toggleMinimize(e) {
    this.sidebarMinimized = e;
  }

  changeLocale(locale: string) {
    this.translate.use(locale);
    this.cookieService.set('Lang',locale)
    this.dataService.changeLang(locale)
  }

  ngOnInit(): void {
    this.role = localStorage.getItem('role')
    this.user = localStorage.getItem('username')
    this.levelOC = localStorage.getItem('leveloc')
    this.getAvatar();
    this.signalRService.startConnection();
    this.signalRService.Notification();
    this.startHttpRequest();
    this.currentTime = moment().format('LTS');
    if (localStorage.getItem('user') !== null) {
      this.currentUser = localStorage.getItem('user');
    }
    setInterval(() => this.updateCurrentTime(), 1 * 1000);

    // if (this.authenticationService.accountValue.roleCode === Role.MEMBER) {
    // }
    //this.navItems = this.navItems.filter(x => x.url.includes('search-invoice'));
    const lang = this.cookieService.get('Lang');
    if (lang) {
      this.translate.use(lang);
      this.navItems = navItems.map(items => { this.translates(items); return items; });
    }
  }
  private startHttpRequest = () => {
    this.getAllNotifications()
  }
  getAllNotifications() {
    this.http.get(this.baseUrl + 'Home/GetNotifications')
    .subscribe((res: any) => {
      this.arrayID = res.arrayID
      this.data = res.data
      this.listdata = res.total
    })
  }

  gettask(item){
   this.dataService.changeMessage(item)
   this.http.post(this.baseUrl + `Notification/Update/${item.ID}`,httpOptions)
    .subscribe(() => {
      this.getAllNotifications()
    })
   return this.router.navigate([item.URL])
  }

  getcomment(data){
    this.dataService.changeMessage(data)
    this.http.post(this.baseUrl + `Notification/Update/${data.ID}`,httpOptions)
    .subscribe(() => {
      this.getAllNotifications()
    })
    return this.router.navigate([data.Link])
  }

  getnotifi(item){
    this.dataService.changeMessage(item)
    this.http.post(this.baseUrl + `Notification/Update/${item.ID}`,httpOptions)
    .subscribe(() => {
      this.getAllNotifications()
    })
    return this.router.navigate([`/LateOnUpload/${item.NotificationID}`])
  }

  translates(item): void {
    if ('name' in item) {
      const trans = this.translate.instant(`${item.name}`);
      if (trans !== `${item.name}`) {
        item.name = trans;
      }
    }
    if (item.children && item.children.length > 0) {
      item.children.map((child: any) => this.translates(child));
    }
  }

  ngAfterViewInit() {
    const img = localStorage.getItem('avatar');
    if (img === 'null') {
      this.avatar = this.defaultImage();
    } else {
      this.avatar = this.sanitizer.bypassSecurityTrustResourceUrl('data:image/png;base64, ' + img);
    }
  }

  updateCurrentTime() {
    this.currentTime = moment().format('LTS');
  }

  defaultImage() {
    return this.sanitizer.bypassSecurityTrustResourceUrl(`data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJYAA
      ACWBAMAAADOL2zRAAAAG1BMVEVsdX3////Hy86jqK1+ho2Ql521ur7a3N7s7e5Yhi
      PTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAABAElEQVRoge3SMW+DMBiE4YsxJqMJtH
      OTITPeOsLQnaodGImEUMZEkZhRUqn92f0MaTubtfeMh/QGHANEREREREREREREtIJ
      J0xbH299kp8l8FaGtLdTQ19HjofxZlJ0m1+eBKZcikd9PWtXC5DoDotRO04B9YOvF
      IXmXLy2jEbiqE6Df7DTleA5socLqvEFVxtJyrpZFWz/pHM2CVte0lS8g2eDe6prOy
      qPglhzROL+Xye4tmT4WvRcQ2/m81p+/rdguOi8Hc5L/8Qk4vhZzy08DduGt9eVQyP
      2qoTM1zi0/uf4hvBWf5c77e69Gf798y08L7j0RERERERERERH9P99ZpSVRivB/rgAAAABJRU5ErkJggg==`);
  }

  getAvatar() {
    const img = localStorage.getItem('avatar');
    if (img === 'null') {
      this.avatar = this.defaultImage();
    } else {
      this.avatar = this.sanitizer.bypassSecurityTrustResourceUrl('data:image/png;base64, ' + img);
    }
  }

  logout() {
    // localStorage.removeItem("token");
    // localStorage.removeItem("user");
    // localStorage.removeItem("username");
    // localStorage.removeItem("leveloc");
    // localStorage.removeItem("listocs");
    // localStorage.removeItem("role");
    // localStorage.removeItem("authTokenExpiration");
    localStorage.clear();
    this.authService.decodedToken = null;
    this.authService.currentUser = null;
    const uri = this.router.url;
    this.router.navigate(['login'], {queryParams:{uri}} )
    this.alertify.message("Logged out");
  }

}
