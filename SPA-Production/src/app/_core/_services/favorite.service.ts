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
export class FavoriteService {
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

  LoadData(userid?,page?,pageSize?) {
    return this.http.get(this.baseUrl + `Favourite/LoadData/${userid}/${page}/${pageSize}`)
  }
  Delete(id) {
    return this.http.get(this.baseUrl + `Favourite/delete/${id}`)
  }
}
