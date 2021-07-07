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
export class AdminUserService {

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

  LoadData(page?, pageSize?, name?) {
    return this.http.post(this.baseUrl + `AdminUser/LoadData/${page}/${pageSize}/${name}`,httpOptions)
  }
  getUnit() {
    return this.http.get(this.baseUrl + 'AdminUser/GetListAllPermissions/0')
  }
  save(entity) {
    return this.http.post(this.baseUrl + 'AdminUser/add',entity)
  }
  getUserByID(id) {
    return this.http.get(this.baseUrl + `AdminUser/GetbyID/${id}`)
  }
  update(entity) {
    return this.http.post(this.baseUrl + 'AdminUser/Update', entity)
  }
  delete(id) {
    return this.http.post(this.baseUrl + `AdminUser/Delete/${id}`,httpOptions)
  }
  updateState(id) {
    return this.http.get(this.baseUrl + `AdminUser/LockUser/${id}`)
  }
  ResetPass(obj) {
    return this.http.post(this.baseUrl + 'AdminUser/ForgotPassword', obj)
  }
}
