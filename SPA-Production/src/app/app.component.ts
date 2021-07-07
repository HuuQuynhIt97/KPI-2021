import { Component, OnInit } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';
import { TranslateService } from '@ngx-translate/core';
import { CookieService } from 'ngx-cookie-service';
import { AuthService } from './_core/_services/auth.service';

@Component({
  // tslint:disable-next-line
  selector: "body",
  template: "<router-outlet></router-outlet>"
})
export class AppComponent implements OnInit {
  jwtHelper = new JwtHelperService();

  constructor(private router: Router,private cookieService: CookieService, private authService: AuthService,public translate: TranslateService)
  {
    this.cookieService.set( 'Lang', 'en' );
    translate.addLangs(['en', 'vi', 'zh-TW' ]);
    const lang = this.cookieService.get('Lang');
    if (lang) {
      translate.setDefaultLang(lang);
    } else {
      translate.setDefaultLang('en');
    }
  }

  ngOnInit() {
    this.router.events.subscribe(evt => {
      if (!(evt instanceof NavigationEnd)) {
        return;
      }
      window.scrollTo(0, 0);
    });
    const token = localStorage.getItem("token");
    if (token) {
      this.authService.decodedToken = this.jwtHelper.decodeToken(token);
    }
  }
}
