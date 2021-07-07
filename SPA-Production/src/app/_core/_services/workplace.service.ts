import { Injectable } from '@angular/core';
import { environment } from './../../../environments/environment';
import { Observable, of, throwError } from 'rxjs';
import { HttpClient , HttpHeaders , HttpParams } from '@angular/common/http';
import { catchError, tap, map } from 'rxjs/operators';
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
export class WorkplaceService {
  baseUrl = environment.apiUrl
  constructor(
    private http: HttpClient
  ) { }
  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error);
      return of(result as T);
    };
  }

  download(url: string){
    return this.http.get(url,{responseType: 'blob'})
  }
  downloadExcel(url: string){
    return this.http.get(url,{responseType: 'blob'})
  }
  loadActionPlan(role?,page?,pageSize?,stt?) {
    return this.http.get(this.baseUrl + `Workplace/loadActionPlan/${role}/${page}/${pageSize}/${stt}`)
  }
  listKPIUpload(page?,pageSize?) {
    return this.http.get(this.baseUrl + `Workplace/ListKPIUpload/${page}/${pageSize}`)
  }
  getOC(userid) {
    return this.http.get(this.baseUrl + `KPI/GetListTreeClient/${userid}`)
  }
  TrackKPI(levelid?,page?,pageSize?) {
    return this.http.get(this.baseUrl + `Workplace/KPIRelated/${levelid}/${page}/${pageSize}`)
  }
}
