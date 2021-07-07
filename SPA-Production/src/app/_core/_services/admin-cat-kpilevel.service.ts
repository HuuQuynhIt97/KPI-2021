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
export class AdminCatKpilevelService {
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
  getOc(userid) {
    return this.http.get(this.baseUrl + `KPI/GetListTreeClient/${userid}`)
  }
  getCategoryByOC(levelid?, locale?, ocId?, page?, pageSize?) {
    return this.http.get(this.baseUrl + `CategoryKPILevelAdmin/GetAllCategories2/${levelid}/${locale}/${ocId}/${page}/${pageSize}`)
  }
  loadDataKPILevel(ocId?,category?,locale?,page?,pageSize?) {
    return this.http.get(this.baseUrl + `CategoryKPILevelAdmin/LoadDataKPILevel2/${ocId}/${category}/${locale}/${page}/${pageSize}`)
  }
  addOCCategory(ocId?,ID?) {
    return this.http.get(this.baseUrl + `OCCategories/AddOCCategory/${ocId}/${ID}`)
  }
  addMember(entity) {
    return this.http.post(this.baseUrl + 'CategoryKPILevelAdmin/Add',entity)
  }
  saveMember(entity) {
    return this.http.post(this.baseUrl + 'CategoryKPILevelAdmin/AddGeneral', entity)
  }
  getAllUser() {
    return this.http.get(this.baseUrl + 'AdminKPILevel/GetListAllUser')
  }
  getUserByCategoryIDAndKPILevelID(kpilevelid?,category?) {
    return this.http.get(this.baseUrl + `CategoryKPILevelAdmin/GetUserByCategoryIDAndKPILevelID/${kpilevelid}/${category}`)
  }
}
