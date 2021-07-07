import { environment } from './../../../environments/environment';
import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { Observable, of, throwError } from 'rxjs';
import { JwtHelperService } from '@auth0/angular-jwt';
import { CookieService } from 'ngx-cookie-service';
import { User } from '../_models/user';
const httpOptions = {
  headers: new HttpHeaders(
    {
      'Content-Type': 'application/json',
    }
  )
}
@Injectable({
  providedIn: 'root'
})
export class AuthService {
  jwtHelper = new JwtHelperService();
  baseUrl: any = environment.apiUrl;
  baseCookie: any = environment.ipCookie;
  jwtTokenDefault: any;
  currentDate: any = Date.now() ;
  currentUser: User;
  decodedToken: any;
  userid: any;
  roleAs: string;
  lvOcAs: string;
  userRoles: string[] = [];
  constructor(private http: HttpClient , private cookieService: CookieService,) { }
  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error);
      return of(result as T);
    };
  }
  setRoles(Roles: string[]){
    this.userRoles = Roles.slice(0);
  }

  isAuthorized(allowedRoles: string[]): boolean {
    if (allowedRoles == null || allowedRoles.length === 0) {
      return true;
    }
    // const token = this.cookieService.get('token');
    const token = localStorage.getItem('token');

    const decodeToken = this.jwtHelper.decodeToken(token);

    if (!decodeToken) {
      return false;
    }
    return allowedRoles.includes(decodeToken['RoleName']);
  }

  getRoles(){
    return this.userRoles;
  }

  login(model: any){
    return this.http.post(this.baseUrl + 'api/Auth/login',model)
      .pipe(map((response: any) =>{
        const user = response ;
        if (user) {
          localStorage.setItem('token', user.token) ;
          // this.cookieService.set('token', user.token ,this.currentDate + 14400000,'/',this.baseCookie, false , 'Lax') ;
          localStorage.setItem('user', user.user.User.Alias) ;
          localStorage.setItem('username', user.user.User.Username) ;
          localStorage.setItem('leveloc', user.user.User.LevelOC) ;
          localStorage.setItem('listocs', user.user.User.ListOCs) ;
          localStorage.setItem('role', user.user.User.Role) ;
          // localStorage.setItem('Lang', 'en') ;
          // if (user.user.User.Role === 1 ) {
          //   localStorage.setItem('roles', "Admin") ;
          // } else if (user.user.User.Role === 2 && user.user.User.LevelOC === 3 || user.user.User.LevelOC === 2) {
          //   localStorage.setItem('roles', "Admin") ;
          // } else {
          //   localStorage.setItem('roles', "User") ;
          // }

          localStorage.setItem('authTokenExpiration', this.currentDate + 14400000) ;
          this.decodedToken = this.jwtHelper.decodeToken(user.token.nameid) ;
          this.userid = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid) ;
          this.currentUser = user.user ;
        }
      }))
  }

  loggedIn() {
    const token = localStorage.getItem('token') ;
    const user = localStorage.getItem('user') ;
    const expiration = localStorage.getItem('authTokenExpiration') ;
    if (!token || !expiration || !user) return null ;
    if (Date.now() > parseInt(expiration,10)) {
      this.destroyToken() ;
      return null ;
    } else {
      return !this.jwtHelper.isTokenExpired(token) ;
    }
  }

  logout(){
    this.destroyToken()
  }

  destroyToken(){
    localStorage.removeItem('token');
    this.cookieService.delete('token')
    localStorage.removeItem('user');
    localStorage.removeItem('username');
    localStorage.removeItem('role');
    // localStorage.removeItem('Lang');
    localStorage.removeItem('leveloc');
    localStorage.removeItem('listocs');
    localStorage.removeItem('roles');
    localStorage.removeItem('authTokenExpiration');
  }

  updateIsOnline(id?) {
    return this.http.post(this.baseUrl + `api/Auth/UpdateIsOnline/${id}`,httpOptions)
  }

  public getToken(): string {
    return localStorage.getItem('token');
    // return this.cookieService.get('token');
  }

  getRole() {
    this.roleAs = localStorage.getItem('role');
    return this.roleAs;
  }

  getLevelOC() {
    this.lvOcAs = localStorage.getItem('leveloc');
    return this.lvOcAs;
  }
}
