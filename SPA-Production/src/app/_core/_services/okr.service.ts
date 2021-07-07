import { Okr } from './../_model/okr';
import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { Observable, of, throwError } from 'rxjs';
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
export class OkrService {

  constructor(
    private http: HttpClient
  ) { }

  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error);
      return of(result as T);
    }
  }
  getListokr(url: string): Observable<Okr[]>{
    return this.http.get<Okr[]>(url,httpOptions)
  }
}
