import { environment } from './../../../environments/environment';
import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders, HttpParams } from '@angular/common/http';
import { catchError, tap, map } from 'rxjs/operators';
import { Observable, of, throwError } from 'rxjs';
import { Unit } from '../_models/Unit';
import { IAdminKpi } from '../_models/admin-kpi';
const httpOptions = {
  headers: new HttpHeaders({
    Authorization: 'Bearer ' + localStorage.getItem('token'),
  }),
};
const baseUrl: any = environment.apiUrl
@Injectable({
  providedIn: 'root'
})
export class AdminKPIService {
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

  getAllUnit(): Observable<Unit[]> {
    return this.http.get<Unit[]>(`${baseUrl}AdminKPI/getallunit`,httpOptions)
    .pipe(
      tap(cases => console.log(cases)),
      catchError(this.handleError('getCases', []))
    )
  }

  GetAllKPI(page? ,pagesize?,name?,locale?) {
    return this.http.post<IAdminKpi[]>(this.baseUrl + `AdminKPI/LoadData/${page}/${pagesize}/${name}/${locale}`, {});
  }

  created(kpi) {
    return this.http.post(this.baseUrl + 'AdminKPI/add2', kpi);
  }

  getbyID(id) {
    return this.http.get(this.baseUrl + `AdminKPI/GetbyID/${id}`)
  }

  update(entity) {
    return this.http.post(this.baseUrl + 'AdminKPI/Update',entity)
  }

  delete(id) {
    return this.http.get(this.baseUrl + `AdminKPI/delete/${id}`)
  }
}
