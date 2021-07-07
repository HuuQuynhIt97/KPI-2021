import { AuthService } from "./../../_core/_services/auth.service";
import { Component, OnInit } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { AlertifyService } from "../../_core/_services/alertify.service";
import { NgxSpinnerService } from "ngx-spinner";
import { DataService } from "../../_core/_services/data.service";

@Component({
  selector: "app-dashboard",
  templateUrl: "login.component.html",
  styleUrls: ["./login.component.scss"],
})
export class LoginComponent implements OnInit {
  user: any = {};
  n: number = 234;
  type: string = 'password'
  fonticon: string = 'fa fa-eye-slash'
  status_code: any = 0
  constructor(
    private authService: AuthService,
    private alertify: AlertifyService,
    private router: Router,
    private route: ActivatedRoute,
    public spinner: NgxSpinnerService,
    private dataService: DataService
  ) {

  }

  ngOnInit() {
    console.log(window.history);
    // if (this.authService.loggedIn) this.router.navigate(["home"]);
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
  authentication() {
    return this.authService
      .login(this.user).toPromise();
  }
  async login(){
    // this.spinner.show();
    try {
      await this.authentication();
      const routerArrUser2: any = [
        '/KPITrendView/',
        '/Overview',
        '/ChartPeriod',
        '/CategoryKPILevel',
        '/Favourite',
        '/Workplace',
        '/Compare',
        '/Dataset',
        '/LateOnUpload',
        '/ListHistoryNotification',
        '/ChartPeriod/ListTasks'
      ]
      const routerArrUser: any = [
        '/KPITrendView/',
        '/Overview',
        '/AdminKPI',
        '/AdminUser',
        '/AdminCategory',
        '/AdminOC',
        '/AddUserToLevel',
        '/AdminLevel',
        '/OCCategories',
        '/CategoryKPILevel',
        '/CategoryKPILevelAdmin',
        '/ChartPeriod/ListTasks',
        '/Dataset',
        '/Workplace',
        '/Compare',
        '/LateOnUpload',
        '/ListHistoryNotification',
        '/ChartPeriod',
        '/Favourite',
        '/home',
        '/home/admin'
      ];
      const routerArrAdmin: any = [
        '/KPITrendView/',
        '/Overview',
        '/AdminKPI',
        '/AdminUser',
        '/KpiKind',
        '/AdminCategory',
        '/AdminOC',
        '/AddUserToLevel',
        '/AdminLevel',
        '/OCCategories',
        '/CategoryKPILevelAdmin',
        '/home'
      ];
      const uri = this.route.snapshot.queryParams.uri
      if(uri !== undefined && uri !== '' )
      {
        let cpr = routerArrUser2.includes(uri);
        routerArrUser2.forEach((item, index)=>{
          if(uri.includes(item)) cpr = true;
        });

        let roleUser = routerArrUser.includes(uri);
        routerArrUser.forEach((item, index)=>{
          if(uri.includes(item)) roleUser = true;
        });

        let roleAdmin = routerArrAdmin.includes(uri);
        routerArrAdmin.forEach((item, index) => {
          if(uri.includes(item)) roleAdmin = true;
        });

        if (Number(localStorage.getItem('role')) === 2 && roleUser && Number(localStorage.getItem('leveloc')) === 3 ) {
          this.router.navigate([uri])
        } else if (Number(localStorage.getItem('role')) === 2 && cpr && Number(localStorage.getItem('leveloc')) !== 3 ) {
          this.router.navigate([uri])
        } else if (Number(localStorage.getItem('role')) === 2 && roleUser && Number(localStorage.getItem('leveloc')) !== 3 ) {
          this.router.navigate(['/home'])
        } else if (Number(localStorage.getItem('role')) === 1 && roleAdmin === false) {
          this.router.navigate(['/home'])
        } else if (Number(localStorage.getItem('role')) === 2 && roleAdmin) {
          this.router.navigate(['/home'])
        } else if (Number(localStorage.getItem('role')) === 1 && roleAdmin) {
          this.router.navigate([uri])
        } else if (Number(localStorage.getItem('role')) === 1 && roleUser) {
          this.router.navigate(['/home'])
        }
        this.loading_spinner();
      }
      else {
        this.router.navigate(['/home'])
        this.loading_spinner();
      }

    } catch (error) {
      // this.alertify.error('Login Fail')
      this.spinner.hide()
    }
  }

  loading_spinner() {
    this.alertify.success('Login Success')
    this.spinner.hide()
  }

}
