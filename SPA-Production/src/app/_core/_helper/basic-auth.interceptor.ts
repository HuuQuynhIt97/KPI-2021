import { AlertifyService } from './../_services/alertify.service';
import { Injectable } from "@angular/core";
import {
  HttpRequest,
  HttpErrorResponse,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
} from "@angular/common/http";
import { Observable, throwError } from "rxjs";
import { catchError, retry } from "rxjs/operators";
import { DataService } from '../_services/data.service';
import { Router } from '@angular/router';
@Injectable()
export class BasicAuthInterceptor implements HttpInterceptor {
  constructor(
    private alertify: AlertifyService,
    private dataService: DataService,
    private router: Router
    ) {}

  intercept(
    request: HttpRequest<any>,
    next: HttpHandler
  ): Observable<HttpEvent<any>> {
    // add authorization header with basic auth credentials if available
    if (localStorage.getItem("token")) {
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
      });
    }

    return next.handle(request).pipe(
      retry(1),
      catchError((error: HttpErrorResponse) => {
        let errorMessage = "";
        if (error.error instanceof ErrorEvent) {
          // this.dataService.changeMessage(error)
          // client-side error
          errorMessage = `Error: ${error.error.message}`;
        } else {
          // server-side error
          errorMessage = `Error Status: ${error.status}\nMessage: ${error.message}`;
          if (error.status === 0) {
            this.alertify.error(
              `Lỗi máy chủ vui lòng tải lại trang (nhấn F5) và chờ trong ít phút! <br> Server error!`
            );
            return throwError(errorMessage);
          }
          if(error.status === 401) {
            this.alertify.error(
              `Username and password are incorrect, please try again!  <br> Server error!`
            );
            // this.router.navigate(['login'], {
            //   queryParams: { returnUrl: this.router.routerState.snapshot.url },
            // });
            // break;
          }
        }
        // const mes = `Lỗi máy chủ vui lòng tải lại trang (nhấn F5) và chờ trong ít phút! <br> Server error!<br>${errorMessage}`;
        // this.alertify.error(mes);
        return throwError(errorMessage);
      })
    );
  }
}
