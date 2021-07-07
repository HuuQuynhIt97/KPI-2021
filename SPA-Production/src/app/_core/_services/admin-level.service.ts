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
export class AdminLevelService {

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

  GetOcs(userid) {
    return this.http.get(this.baseUrl + `KPI/GetListTreeClient/${userid}`, {})
  }
  save(entity) {
    return this.http.post(this.baseUrl + 'AdminLevel/Add',entity)
  }
  Rename(obj) {
    return this.http.post(this.baseUrl + 'AdminLevel/Rename',obj)
  }
  delete(id) {
    return this.http.post(this.baseUrl + 'AdminLevel/Remove/${id}',httpOptions)
  }
}
