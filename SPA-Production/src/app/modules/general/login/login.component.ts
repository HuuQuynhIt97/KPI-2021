import { AlertifyService } from './../../../_core/_services/alertify.service';
import { AuthService } from './../../../_core/_services/auth.service';
import { Component, OnInit } from '@angular/core';
import { Router , ActivatedRoute  } from '@angular/router';
import { FormControl, FormGroupDirective, NgForm } from '@angular/forms';
import { ErrorStateMatcher } from '@angular/material/core';
export class MyErrorStateMatcher implements ErrorStateMatcher {
  isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
    const isSubmitted = form && form.submitted;
    return !!(control && control.invalid && (control.dirty || control.touched || isSubmitted));
  }
}
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  user: any = {};
  returnUrl: any;
  constructor(
    private authService: AuthService,
    private router: Router,
    private route: ActivatedRoute,
    private alertify : AlertifyService
  ) {

  }

  ngOnInit(): void {

  }
  login(){
    this.authService.login(this.user)
      .subscribe(next =>{
        const routerArrUser2: any = [
          '/KPITrendView/',
          '/Overview/',
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
          '/Overview/',
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
          '/Overview/',
          '/AdminKPI',
          '/AdminUser',
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

            routerArrAdmin.forEach((item, index)=>{
              if(uri.includes(item)) roleAdmin = true;
            });
            if (Number(localStorage.getItem('role')) === 2 && roleUser && Number(localStorage.getItem('leveloc')) === 3 ) {
              this.router.navigate([uri])
            } else if (Number(localStorage.getItem('role'))  === 2 && cpr && Number(localStorage.getItem('leveloc')) !== 3 ) {
              this.router.navigate([uri])
            } else if (Number(localStorage.getItem('role'))  === 2 && roleUser && Number(localStorage.getItem('leveloc')) !== 3 ) {
              this.router.navigate(['/home'])
            } else if (Number(localStorage.getItem('role'))  === 1 && roleAdmin === false) {
              this.router.navigate(['/home'])
            } else if (Number(localStorage.getItem('role'))  === 2 && roleAdmin) {
              this.router.navigate(['/home'])
            } else if (Number(localStorage.getItem('role')) === 1 && roleAdmin) {
              this.router.navigate([uri])
            } else if (Number(localStorage.getItem('role')) === 1 && roleUser) {
              this.router.navigate(['/home'])
            }
            this.alertify.success('Login Success')
        }
        else{
          this.router.navigate(['/home'])
          this.alertify.success('Login Success')
        }
      },error =>{
        this.alertify.error('Login Fail')
      })
  }
  recover() {
    return this.router.navigate(['/ForgotPassword'])
  }
}
