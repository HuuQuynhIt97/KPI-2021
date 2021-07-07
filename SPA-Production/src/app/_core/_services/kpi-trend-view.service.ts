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
export class KpiTrendViewService {

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
  Loadchart(kpilevelcode?,catid?,period?,locale?,year?,start?,end?) {
    return this.http.get(this.baseUrl + `ChartPeriod/ListDatas2/${kpilevelcode}/${catid}/${period}/${locale}/${year}/${start}/${end}`)
  }
  LoadAllDataActionPlanByKPILevelID(id,currentUser) {
    return this.http.get(this.baseUrl + `ChartPeriod/GetAllActionPlan/${id}/${currentUser}`)
  }
  SortActionPlanByPeriod(period?,point?,kpilevelID?,currentUser?) {
    return this.http.get(this.baseUrl + `Dataset/SortActionPlanByPeriod/${period}/${point}/${kpilevelID}/${currentUser}`)
  }
}
