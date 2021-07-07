import { environment } from './../../../environments/environment';
import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders, HttpParams } from '@angular/common/http';
import { catchError, tap, map } from 'rxjs/operators';
import { Observable, of, throwError } from 'rxjs';
import { Unit } from '../_models/Unit';
import { IAdminCategory } from '../_models/admin-category';
const httpOptions = {
  headers: new HttpHeaders({
    Authorization: 'Bearer ' + localStorage.getItem('token'),
  }),
};
@Injectable({
  providedIn: 'root'
})
export class AdminCategoryService {
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
    return this.http.get<Unit[]>(`${this.baseUrl}AdminKPI/getallunit`,httpOptions)
    .pipe(
      tap(cases => console.log('Get Unit')),
      catchError(this.handleError('getCases', []))
    );
  }

  GetAllCategory(page? ,pagesize?,name?,locale?) {
    return this.http.post<IAdminCategory[]>(this.baseUrl + `Admincategory/LoadData/${page}/${pagesize}/${name}/${locale}`, {});
  }
  created(category) {
    return this.http.post(this.baseUrl + 'admincategory/add2', category);
  }
  getbyID(id) {
    return this.http.get(this.baseUrl + `adminCategory/GetbyID/${id}`)
  }
  update(entity) {
    return this.http.post(this.baseUrl + 'adminCategory/Update2',entity)
  }
  delete(id) {
    return this.http.get(this.baseUrl + `AdminCategory/delete/${id}`)
  }
}
