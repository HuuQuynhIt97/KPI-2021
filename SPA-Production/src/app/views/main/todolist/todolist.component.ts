import { TodolistService } from './../../../_core/_services/todolist.service';
import { AlertifyService } from './../../../_core/_services/alertify.service';
import { environment } from './../../../../environments/environment';
import { AccountService } from './../../../_core/_services/account.service';
import { Component, OnInit ,TemplateRef,ViewChild,ViewEncapsulation  } from '@angular/core';
import { saveAs } from 'file-saver';
import {
  EditService,
  ToolbarService,
  PageService,
  PageSettingsModel,
  ToolbarItems,
  GridComponent,
} from "@syncfusion/ej2-angular-grids";
import { NgbModal, NgbModalConfig, NgbModalRef } from '@ng-bootstrap/ng-bootstrap';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
@Component({
  selector: 'app-todolist',
  templateUrl: './todolist.component.html',
  styleUrls: ['./todolist.component.css'],
  providers: [ToolbarService, EditService, PageService],
  encapsulation: ViewEncapsulation.None
})
export class TodolistComponent implements OnInit {
  @ViewChild('content', { static: true }) content: TemplateRef<any>;
  @ViewChild('previewFile', { static: true }) previewFile: TemplateRef<any>;
  @ViewChild('timeline', { static: true }) timeline: TemplateRef<any>;
  @ViewChild('reject', { static: true }) reject: TemplateRef<any>;
  Data: any;
  buildings: [];
  roles: [];
  roleData: [];
  fieldsBuilding: object = { text: "name", value: "name" };
  fieldsRole: object = { text: "name", value: "name" };
  editSettings = {
    showDeleteConfirmDialog: false,
    allowEditing: false,
    allowAdding: false,
    allowDeleting: false,
    mode: "Normal",
  };
  buildingUsers: [];
  Topic_Name: string = null
  user: any;
  password = "";
  buildingID: number;
  roleID: number = 0;
  locale = 'de-DE'
  public toolbarAccount : string[] ;
  userID: any = 0 ;
  RoleUser: any;
  passwordFake = `aRlG8BBHDYjrood3UqjzRl3FubHFI99nEPCahGtZl9jvkexwlJ`;
  pageSettings = { pageCount: 20, pageSizes: true, pageSize: 10 };
  @ViewChild("grid") public grid: GridComponent;
  modalReference: NgbModalRef;
  @ViewChild('myPondUpload') myPondUpload: any;
  pondOptions = {
    class: 'my-filepond',
    multiple: true,
    acceptedFileTypes: 'application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    server: {
      process: environment.api + 'todolist/SaveFile',
      revert: null
    }
  }
  file: any = [];
  myFiles = [];

  viewer = 'office';
  doc = 'https://file-examples-com.github.io/uploads/2017/02/file_example_XLSX_50.xlsx';
  baseUrl = environment.api;
  dataUser: any;
  public ADMIN = 1;
  public SUPERVISOR = 2;
  public LEADER = 3;
  public STAFF = 5;
  contents = '';
  modelReject = {
    ID: 0,
    UserID : 0,
    Remark: '',
    UserSenderID: 0
  }
  TimelineData: any;
  File_Code: any ;
  constructor(
    private accountService: AccountService,
    private todolistService: TodolistService,
    private alertify: AlertifyService,
    private modalService: NgbModal,
    config: NgbModalConfig,
    private router: Router,
    private spinner: NgxSpinnerService
  ) {
    config.backdrop = 'static';
    config.keyboard = false;
    this.router.routeReuseStrategy.shouldReuseRoute = () => false;
  }

  DownloadExcel(data) {
    const url = this.baseUrl + `ToDoList/DownloadExcel/${data.file_Name}`
    let file = data.file_Name;
    this.spinner.show();
    this.todolistService.downloadExcel(url).subscribe(data =>{
      (saveAs(data,file))
      setTimeout(() => {
        this.spinner.hide();
        this.alertify.success('Download successfully')
      }, 2000);
    })
  }

  ngOnInit() {
    if (localStorage.getItem('user') !== null) {
      this.userID = Number(JSON.parse(localStorage.getItem('user')).id);
      this.RoleUser = Number(JSON.parse(localStorage.getItem('user')).roleID);
    }
    this.getAllUsers();
    this.getAllDataByUser();
    this.toolbarAccount = [
      "Import Excel",
      "Cancel",
      "Search",
    ];
  }

  Timelines(data) {
    this.modalReference = this.modalService.open(this.timeline ,{ size: "lg"})
    this.todolistService.LoadTimeLine(data.id).subscribe((res: any) => {
      this.TimelineData = res ;
    })
  }

  Approve(data) {
    this.spinner.show();
    this.todolistService.approve(data.id ,this.userID).subscribe((res: any) => {
      setTimeout(() => {
        this.alertify.success('Approve Success');
        this.getAllDataByUser();
        this.spinner.hide();
      }, 500);

    })
  }

  Reject(data) {
    this.modelReject = {
      ID: data.id,
      Remark: '',
      UserID : this.userID,
      UserSenderID: data.created_By
    }
    this.modalReference = this.modalService.open(this.reject, { size: "lg"})

  }

  Confirm(){
    this.modelReject.Remark = this.contents
    if(this.contents !== null) {
      this.todolistService.reject(this.modelReject).subscribe(res =>{
        this.alertify.success('Reject success')
        this.getAllDataByUser();
        this.modalReference.close();
      })
    } else{
      this.alertify.error('Please Enter new content to Reject File')
    }
  }

  delete(data) {
    this.alertify.confirm(
      "Delete Topic",
      'Are you sure you want to delete this Topic "' + data.topic + '" ?',
      () => {
        this.todolistService.delete(data.id ,data.file_Name).subscribe(
          (res) => {
            this.getAllDataByUser();
            this.alertify.success("The Topic has been deleted!!!");
          },
          (error) => {
            this.alertify.error("Failed to delete the Topic!!!");
          }
        );
      }
    );
  }

  getAllDataByUser() {
    this.todolistService.getAll(this.userID).subscribe((res: any) => {
      const todo = res.map((item: any) => {
        return {
          id: item.id,
          pending_Status: item.pending_Status,
          reasion: item.reasion,
          reject_Status: item.reject_Status,
          seen_Status: item.seen_Status,
          seen_Time: item.seen_Time,
          status: item.status,
          topic: item.topic,
          url: item.url,
          approve_By: item.approve_By,
          approve_Date: item.approve_Date,
          complete_Status: item.complete_Status,
          created_By: item.created_By,
          created_By_Name: this.createdBy(item.created_By),
          created_Date: item.created_Date,
          delete_By: item.delete_By,
          delete_Time: item.delete_Time,
          file_Name: item.file_Name,
          leader_Status: item.leader_Status
        };
      });
      this.Data = todo ;
      console.log(this.Data);
    })
  }

  openUploadModal() {
    this.modalReference = this.modalService.open(this.content, { size: "xl", centered: true});
  }

  close() {
    this.file = [] ;
    this.modalReference.close();
    this.Topic_Name = null;
  }

  handleFileProcess(event: any){
    this.file.push(event.file.file) ;
  }

  pondHandleAddFile(event: any) {
  }

  pondHandleRemoveFile(event: any) {
    for(var i = 0; i < this.file.length; i++) {
      if(this.file[i].name == event.file.file.name) {
        this.file.splice(i, 1);
        break;
      }
    }
    // this.chartPeriodService.pondHandleRemoveFile(event.file.file.name)
    // .subscribe((res: any)=>{
    // })
  }

  Upload() {

    const formData = new FormData();
    formData.append("uploadBy", this.userID);
    formData.append("file_code", this.makeid(8));
    // formData.append("topic", this.Topic_Name);
    for (let item of this.file) {
      formData.append('UploadedFile', item);
    }
    if(this.file) {
      this.todolistService.import(formData).subscribe((res: any) => {
        this.alertify.success('Upload Success!')
        this.getAllDataByUser();
        this.modalReference.close();
        // this.Topic_Name = null;
      })

    } else {
      this.alertify.error('Not File Upload!')
    }
  }

  makeid(length) {
    let result           = '';
    const characters       = '0123456789';
    const charactersLength = characters.length;
    for ( let i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
  }

  tooltips(data) {
    if (data) {
      return data;
    } else {
      return "";
    }
  }
  // life cycle ejs-grid
  createdUsers() {}

  actionBegin(args) {
    if (args.requestType === "save" && args.action === "add") {
      this.user = {
        id: 0,
        username: args.data.Username,
        password: this.password,
        email: args.data.Email,
        roleid: 2,
        employeeID: args.data.EmployeeID,
        isLeader: false,
        systemCode: 4,
      };
      if (this.roleID !== 0) {
      } else {
        this.alertify.error("Please Select Role !");
        args.cancel = true;
      }
    }
    if (args.requestType === "save" && args.action === "edit") {
      this.user = {
        id: args.data.ID,
        username: args.data.Username,
        password: this.password || "",
        email: args.data.Email || "",
        roleid: 2,
        systemCode: 4,
        employeeID: args.data.EmployeeID,
        isLeader: false,
      };

    }
    if (args.requestType === "delete") {
    }
  }

  toolbarClick(args) {
    switch (args.item.text) {
      case "Import Excel":
        args.cancel = true;
        this.openUploadModal();
        break;
      case "Excel Export":
        this.grid.excelExport({ hierarchyExportMode: "All" });
        break;
      default:
        break;
    }
  }

  actionComplete(args) {
    if (args.requestType === "edit") {
      (args.form.elements.namedItem("ID") as HTMLInputElement).disabled = true;
      (args.form.elements.namedItem(
        "Password"
      ) as HTMLInputElement).disabled = true;
    }
    if (args.requestType === "add") {
      (args.form.elements.namedItem("ID") as HTMLInputElement).disabled = true;
    }
  }

  dataBound() {
    // document.querySelectorAll(
    //   "button[aria-label=Update] > span.e-tbar-btn-text"
    // )[0].innerHTML = "Save";
  }

  // end life cycle ejs-grid

  // api


  async getAllUsers() {
    try {
      this.accountService.getAll().subscribe((res: any) => {
        const users = res.map((item: any) => {
          return {
            ID: item.id,
            Username: item.username,
            Password: this.passwordFake + item.id,
            Email: item.email
          };
        });
        this.dataUser = users;
      });
    } catch (error) {
      this.alertify.error(error + "");
    }
  }

  // end api

  // template ejs-grid
  createdBy(id) {
    if (id === 0) {
      return '#N/A';
    }
    const result = this.dataUser.filter(
      (item: any) => item.ID === id
    )[0] as any;
    if (result !== undefined) {
      return result.Username;
    } else {
      return '#N/A';
    }
  }
  // end template ejs-grid
  NO(index) {
    return (
      (this.grid.pageSettings.currentPage - 1) * this.pageSettings.pageSize +
      Number(index) +
      1
    );
  }

}
