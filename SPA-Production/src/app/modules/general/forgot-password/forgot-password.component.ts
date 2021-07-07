import { AlertifyService } from './../../../_core/_services/alertify.service';
import { environment } from './../../../../environments/environment';
import { Component, OnInit } from '@angular/core';
import { Router} from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-forgot-password',
  templateUrl: './forgot-password.component.html',
  styleUrls: ['./forgot-password.component.css']
})
export class ForgotPasswordComponent implements OnInit {
  baseUrl: any = environment.apiUrl
  email: string = null
  constructor(
    private router: Router,
    private http: HttpClient,
    private alertify : AlertifyService
  ) { }

  ngOnInit(): void {
  }
  resetPassW() {
    if (this.email !== null) {
      let mObj = {
        Email: this.email
      }
      this.http.post(this.baseUrl + 'AdminUser/RecoverPassword',mObj)
      .subscribe((result: any) =>{
        if(result){
          this.alertify.success('Recover successfully')
          this.router.navigate(['/recoverysuccess'])
        }
        else{
          this.alertify.error('Email not exist! Please try again')
        }
      })
    } else {
      this.alertify.error('Email Empty')
    }
  }
}
