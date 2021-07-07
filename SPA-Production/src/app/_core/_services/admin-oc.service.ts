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
export class AdminOcService {

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

  getOc(userid) {
    return this.http.get(this.baseUrl + `KPI/GetListTreeClient/${userid}`, {})
  }

  loadDataKPILevel(levelid? ,category? , locale? , page? ,pageSize?) {
    return this.http.get(this.baseUrl + `AdminKPILevel/LoadDataKPILevel2/${levelid}/${category}/${locale}/${page}/${pageSize}`)
  }

  addOCCategory(ocID?,id?) {
    return this.http.get(this.baseUrl + `OCCategories/AddOCCategory/${ocID}/${id}`)
  }

  update(entity) {
    return this.http.post(this.baseUrl + 'AdminKPILevel/UpdateKPILevel',entity)
  }

  loadDetail(id) {
    return this.http.get(this.baseUrl + `AdminKPILevel/GetbyID/${id}`)
  }

  LoadDataPerfomance(KPILevelCode) {
    return this.http.get(this.baseUrl + `AdminKPILevel/LoadDataPerfomance/${KPILevelCode}`)
  }

  AddScorePerfomance(entity) {
    return this.http.post(this.baseUrl + 'AdminKPILevel/AddScorePerfomance',entity)
  }

  UpdateScorePerfomanceData(entity) {
    return this.http.post(this.baseUrl + 'AdminKPILevel/UpdateScorePerfomanceData',entity)
  }

}
