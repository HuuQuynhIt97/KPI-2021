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
export class CategoryKpilevelService {

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

  GetListID() {
    return this.http.get(this.baseUrl + 'CategoryKPILevel/GetListID', {})
  }
  getOc() {
    return this.http.get(this.baseUrl + 'AdminKPILevel/GetListTree')
  }
  getCategoryByOC(ocId?, locale?, levelid?, page?, pageSize?) {
    return this.http.get(this.baseUrl + `CategoryKPILevel/GetAllCategories2/${ocId}/${locale}/${levelid}/${page}/${pageSize}`)
  }
  loadDataKPILevel(category?,level?,locale?,page?,pageSize?) {
    return this.http.get(this.baseUrl + `CategoryKPILevel/getAllKPILevelByCategory2/${category}/${level}/${locale}/${page}/${pageSize}`)
  }
}
