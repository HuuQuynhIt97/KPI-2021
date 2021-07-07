import { PaginatedResult } from './../_models/pagination';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { environment } from '../../../environments/environment';
const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    Authorization: 'Bearer ' + localStorage.getItem('token')
  })
};

@Injectable({
  providedIn: 'root'
})
export class AccountService {

  baseUrl = environment.api;
  authUrl = environment.apiUrl;
  messageSource = new BehaviorSubject<number>(0);
  currentMessage = this.messageSource.asObservable();
  // method này để change source message
  changeMessage(message) {
    this.messageSource.next(message);
  }
  constructor(private http: HttpClient) { }

  getAllUsers(page?, pageSize? ): Observable<PaginatedResult<object[]>> {
    const paginatedResult: PaginatedResult<object[]> = new PaginatedResult<
    object[]
    >();
    return this.http
      .get<object[]>(`${this.authUrl}Users/GetAllUsers/${4}/${page}/${pageSize}`, {
        observe: 'response'
      })
      .pipe(
        map(response => {
          paginatedResult.result = response.body;
          if (response.headers.get('Pagination') != null) {
            paginatedResult.pagination = JSON.parse(
              response.headers.get('Pagination')
              );
            }
          return paginatedResult;
        })
      );
  }

  deleteUser(id) {
    return this.http.delete(`${this.baseUrl}User/Delete/${id}`);
  }

  blockAccount(id) {
    return this.http.post(`${this.baseUrl}BuildingUser/LockUser/${id}` , httpOptions);
  }
  mapBuildingUser(userid, buildingid) {
    return this.http.get(`${this.baseUrl}BuildingUser/MapBuildingUser/${userid}/${buildingid}`);
  }
  mapRoleUser(userid, roleid) {
    return this.http.post(`${this.baseUrl}BuildingUser/MapRoleUser/${userid}/${roleid}`, httpOptions);
  }
  getAllRole() {
    return this.http.get(this.baseUrl + 'BuildingUser/GetAllRole', {});
  }

  getAll() {
    return this.http.get(this.baseUrl + 'User/GetAll', {});
  }

  getAllRoleUser() {
    return this.http.get(this.baseUrl + 'BuildingUser/GetAllRoleUser', {});
  }
  getBuildings() { return this.http.get(`${this.baseUrl}Building/GetBuildings`); }

  updateUser(update) { return this.http.put(`${this.baseUrl}User/Update`, update); }

  createUser(create) { return this.http.post(`${this.baseUrl}User/Create`, create); }

  getBuildingUsers() {
    return this.http.get(`${this.baseUrl}BuildingUser/GetAllBuildingUsers`);
  }
}
