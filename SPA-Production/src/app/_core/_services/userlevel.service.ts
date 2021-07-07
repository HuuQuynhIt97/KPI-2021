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
export class UserlevelService {
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
  getOc(userid) {
    return this.http.get(this.baseUrl + `KPI/GetListTreeClient/${userid}`)
  }
  LoadDataUser(ocId?,code?,page?,pageSize?) {
    return this.http.get(this.baseUrl + `AddUserToLevel/LoadDataUser/${ocId}/${code}/${page}/${pageSize}`)
  }
  addUserToLevel(ID?,ocId?, user?) {
    return this.http.post(this.baseUrl + `AddUserToLevel/AddUserToLevel/${ID}/${ocId}/${user}`,httpOptions)
  }
}
