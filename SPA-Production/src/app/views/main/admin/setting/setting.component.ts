import { environment } from './../../../../../environments/environment';
import { Component, OnInit, ViewChild } from '@angular/core';
// import EngJson from '../../../../assets/i18n/en.json';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { EditService, PageService, CommandColumnService, ResizeService,SortService ,
  ExcelExportService, ContextMenuService, GridComponent } from '@syncfusion/ej2-angular-grids';
import { QueryCellInfoEventArgs } from '@syncfusion/ej2-angular-grids';
import { Tooltip } from '@syncfusion/ej2-popups';
import { ToolbarService } from '@syncfusion/ej2-angular-grids';
import  swal  from 'sweetalert2';

const httpOptions = {
  headers: new HttpHeaders({
    Authorization: 'Bearer ' + localStorage.getItem('token'),
  })
}
const Toast = swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000,
  timerProgressBar: false,
  onOpen: (toast) => {
    toast.addEventListener('mouseenter', swal.stopTimer)
    toast.addEventListener('mouseleave', swal.resumeTimer)
  }
})
@Component({
  selector: 'app-setting',
  templateUrl: './setting.component.html',
  styleUrls: ['./setting.component.css'],
  providers: [
    SortService,ToolbarService,PageService ,ResizeService,EditService,
    CommandColumnService,ExcelExportService,ContextMenuService]
})
export class SettingComponent implements OnInit {
  baseUrl = environment.apiUrl ;
  editSettings: any = { allowEditing: true, allowAdding: true, allowDeleting: true, mode: 'Normal', allowEditOnDblClick: true };
  toolbarOptions = ['Search']
  searchSettings: any = { hierarchyMode: 'Name' }
  dataEn = []
  dataVi: any = []
  dataTw: any = []
  key: string ;
  newName: string ;
  @ViewChild('gridEn') GridEn: GridComponent;
  @ViewChild('gridTw') GridTw: GridComponent;
  @ViewChild('gridVi') GridVi: GridComponent;
  pageSettings = {pageSize: 20}
  public wrapSettings = { wrapMode: 'Content' };
  constructor(
    private http: HttpClient
  ) {
    this.getJSON().subscribe(data => {
      const obj = data;
      this.dataEn = Object.keys(obj).map(key => ({keyEn: key, valueEn: obj[key]}));
    });
  }

  ngOnInit(): void {
    this.getJsonVi();
    this.getJsonZh();
  }

  tooltip(args: QueryCellInfoEventArgs) {
    const tooltip: Tooltip = new Tooltip({
      content: args.data[args.column.field].toString()
    }, args.cell as HTMLTableCellElement);
  }

  public getJSON(): Observable<any> {
    return this.http.get(this.baseUrl + 'Home/LoadJsonFile/en.json');
  }

  getJsonVi() {
    this.http.get(this.baseUrl +'Home/LoadJsonFile/vi.json').subscribe((data) =>{
      const obj = data;
      this.dataVi = Object.keys(obj).map(key => ({keyVi: key, valueVi: obj[key]}));
    })
  }

  getJsonZh() {
    this.http.get(this.baseUrl +'Home/LoadJsonFile/zh-TW.json').subscribe((data) =>{
      const obj = data;
      this.dataTw = Object.keys(obj).map(key => ({keyTw: key, valueTw: obj[key]}));
    })
  }

  actionBeginEn(args) {
    console.log('actionBeginEn',args)
    if (args.requestType === 'save') {
      const objEn = {
        fileName: 'en.json',
        key: args.data.keyEn,
        newValue: args.data.valueEn
      }
      this.http.post(this.baseUrl + 'Home/UpdateLanguage/',objEn)
      .subscribe(() => {
        Toast.fire({
          icon: 'success',
          title: 'Language Update Successfully'
        })
      })
    }
  }

  actionBeginTw(args) {
    if (args.requestType === 'save') {
      const objTw = {
        fileName: 'zh-TW.json',
        key: args.data.keyTw,
        newValue: args.data.valueTw
      }
      this.http.post(this.baseUrl + 'Home/UpdateLanguage/',objTw)
      .subscribe(() => {
        Toast.fire({
          icon: 'success',
          title: 'Language Update Successfully'
        })
      })
    }
  }

  actionBeginLocal(args) {
    if (args.requestType === 'save') {
      const objVi = {
        fileName: 'vi.json',
        key: args.data.keyVi,
        newValue: args.data.valueVi
      }
      this.http.post(this.baseUrl + 'Home/UpdateLanguage/', objVi)
      .subscribe(() => {
        Toast.fire({
          icon: 'success',
          title: 'Language Update Successfully'
        })
      })
    }
  }

  LoadLanguage(fileName) {
    this.http.get(this.baseUrl + `Home/LoadJsonFile/${fileName}`)
    .subscribe(() => {})
  }

  reload() {
    window.location.reload();
  }

}
