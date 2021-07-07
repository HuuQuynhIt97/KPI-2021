import { FavoriteService } from './../../../../_core/_services/favorite.service';
import { Component, OnInit } from '@angular/core';
import {Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { JwtHelperService } from '@auth0/angular-jwt';
import { EditService, PageService,ResizeService, CommandColumnService, FilterService } from '@syncfusion/ej2-angular-grids';
import { ToolbarService } from '@syncfusion/ej2-angular-grids';
import { environment } from '../../../../../environments/environment';
import { AlertifyService } from '../../../../_core/_services/alertify.service';
@Component({
  selector: 'app-favorite',
  templateUrl: './favorite.component.html',
  styleUrls: ['./favorite.component.css'],
  providers: [
  ToolbarService,PageService,EditService,CommandColumnService,FilterService,ResizeService
  ]
})
export class FavoriteComponent implements OnInit {
  jwtHelper = new JwtHelperService();
  public data: object[];
  editSettings: any = { allowEditing: true, allowAdding: true, allowDeleting: true, mode: 'Normal', allowEditOnDblClick: false };
  pageSettings = {pageSize: 5}
  locale: any = this.cookieService.get('Lang')
  page: any = 1
  pageSize: any = 1000
  toolbarOptions = ['Search']
  searchSettings: any = { hierarchyMode: 'Name' }
  baseUrl: any = environment.apiUrl
  userid: any = Number(this.jwtHelper.decodeToken(localStorage.getItem('token')).nameid)
  lines: string = 'Both'
  constructor(
    private cookieService: CookieService,
    private router: Router,
    private favoriteService: FavoriteService,
    public alertify : AlertifyService
  ) { }

  ngOnInit(): void {
    this.LoadData()
  }

  getchart(Link) {
    return this.router.navigate([Link])
  }

  rowSelected(args){
  }

  actionComplete(args){
  }

  LoadData() {
    this.favoriteService.LoadData(this.userid,this.page,this.pageSize)
    .subscribe((res: any) => {
      this.data = res.data
    })
  }

  Delete(id){
    this.alertify.confirm('Delete' , "Are you sure? You won't be able to revert this!" , () => {
      this.favoriteService.Delete(id)
      .subscribe(() => {
        this.alertify.success('Favourite has been deleted')
        this.LoadData()
      })
    })
  }

}
