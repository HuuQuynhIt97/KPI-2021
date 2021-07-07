import { AuthService } from './../_services/auth.service';
import { Injectable } from '@angular/core';
import { CanActivate, Router ,ActivatedRoute,ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree  } from '@angular/router';
import { Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  jwtTokenDefault = localStorage.getItem('roles')
  constructor(private authService: AuthService, private router: Router ,private route: ActivatedRoute) {
    // if (localStorage.getItem('role') === 2)
  }
  canActivate(route: ActivatedRouteSnapshot , state: RouterStateSnapshot): boolean {
    if (this.authService.loggedIn()) {
      const allowedRoles = route.data.role;
      // let role: any = localStorage.getItem('roles');
      const isAuthorized = this.authService.isAuthorized(allowedRoles)
      if (!isAuthorized) {
        this.router.navigate(['/403']);
      }
      return isAuthorized;
    }
    this.router.navigate(['login'], { queryParams: { uri: state.url }});
    return false;
  }

  // canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
  //   if (this.authService.loggedIn()) {
  //     return true;
  //   }
  //   this.router.navigate(['login'], { queryParams: { uri: state.url }});
  //   return false;
  // }

  checkRouteRole(role , roleRouter) {
    let flag = false;
    roleRouter.forEach(element => {
      if (role.includes(element)) {
        flag = true;
      }
    });
    return flag;
  }
}
