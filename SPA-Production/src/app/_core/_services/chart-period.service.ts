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
export class ChartPeriodService {
  baseUrl = environment.apiUrl
  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error);
      return of(result as T);
    }
  }
  constructor(
    private http: HttpClient
  ) { }

  LoadAllDataActionPlanByKPILevelID(id,userid) {
    return this.http.get(this.baseUrl + `ChartPeriod/GetAllActionPlan/${id}/${userid}`)
  }
  pondHandleRemoveFile(file) {
    return this.http.post(this.baseUrl + `ChartPeriod/DeleteFile/${file}`,httpOptions)
  }
  viewHistoryActionPlan(id) {
    return this.http.get(this.baseUrl + `HistoryActionPlan/LoadHistoryActionPlanByID/${id}`)
  }

  GetFileUpload(id) {
    return this.http.get(this.baseUrl + `ActionPlan/GetFileUpload/${id}`)
  }

  unpin(id) {
    return this.http.put(this.baseUrl + `ChartPeriod/Unpin/${id}`,httpOptions)
  }
  pin(id) {
    return this.http.put(this.baseUrl + `ChartPeriod/Pin/${id}`,httpOptions)
  }
  DeleteComment(id) {
    return this.http.get(this.baseUrl + `ChartPeriod/DeleteComment2/${id}`)
  }
  deleteActionPlan(id) {
    return this.http.get(this.baseUrl + `ChartPeriod/Delete/${id}`)
  }
  done(entity) {
    return this.http.post(this.baseUrl + 'ChartPeriod/Done',entity)
  }
  approval(entity) {
    return this.http.post(this.baseUrl + 'ChartPeriod/Approval',entity)
  }
  loadDataComment(id,userid) {
    return this.http.get(this.baseUrl + `ChartPeriod/LoadDataComment/${id}/${userid}`)
  }
  LoadDataActionPlan(dataid?,commentid?,userid?,keyword?,page?,pageSize?) {
    return this.http.post(this.baseUrl +
      `ChartPeriod/getallpaging/${dataid}/${commentid}/${userid}/${keyword}/${page}/${pageSize}`,httpOptions)
  }
  remark(id) {
    return this.http.get(this.baseUrl + `ChartPeriod/Remark/${id}`)
  }
  addcomment(mObj) {
    return this.http.post(this.baseUrl + 'ChartPeriod/AddComment',mObj)
  }
  loadDataCompare(obj) {
    return this.http.get(this.baseUrl + `ChartPeriod/LoadDataProvide/${obj}/1/1000`)
  }
  addFv(mObj) {
    return this.http.get(this.baseUrl + 'ChartPeriod/AddFavourite',mObj)
  }
}
