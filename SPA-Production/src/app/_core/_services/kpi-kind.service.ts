import { environment } from './../../../environments/environment';
import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders, HttpParams } from '@angular/common/http';
import { catchError, tap, map } from 'rxjs/operators';
import { Observable, of, throwError } from 'rxjs';
const httpOptions = {
  headers: new HttpHeaders({
    Authorization: 'Bearer ' + localStorage.getItem('token'),
  }),
};

@Injectable({
  providedIn: 'root'
})
export class KpiKindService {

  baseUrl = environment.apiUrl;
  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error);
      return of(result as T);
    }
  }
  constructor(
    private http: HttpClient
  ) { }

  getAll() {
    return this.http.get(this.baseUrl + 'AdminKPI/GetAllKpiKind', {});
  }
  getAllKpiKindWithLang(locale) {
    return this.http.get(this.baseUrl + `AdminKPI/GetAllKpiKindWithLang/${locale}`, {});
  }

  Add(entity) {
    return this.http.post(this.baseUrl + 'AdminKPI/AddKPIKIND' , entity);
  }

  Update(entity) {
    return this.http.post(this.baseUrl + 'AdminKPI/UpdateKPIKIND' , entity);
  }

  Delete(id) {
    return this.http.post(this.baseUrl + `AdminKPI/DeleteKpiKind/${id}`, {});
  }

}
