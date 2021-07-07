import { DataService } from "./../../../../_core/_services/data.service";
import { Component, OnInit, ViewChild } from "@angular/core";
import { CheckBoxSelectionService, DropDownListComponent } from "@syncfusion/ej2-angular-dropdowns";
import { Router, ActivatedRoute } from "@angular/router";
import { CookieService } from "ngx-cookie-service";
import { NgxSpinnerService } from "ngx-spinner";
import { environment } from "../../../../../environments/environment";
import { IOverview } from "../../../../_core/_models/overview";
import { OverviewService } from "../../../../_core/_services/overview.service";
import { AlertifyService } from "../../../../_core/_services/alertify.service";
import { FormGroup } from '@angular/forms';
@Component({
  selector: "app-overview",
  templateUrl: "./overview.component.html",
  styleUrls: ["./overview.component.css"],
  providers: [CheckBoxSelectionService]
})
export class OverviewComponent implements OnInit {
  baseUrl: any = environment.apiUrl;
  valueCategory: null;
  value: string = "m";
  public dataperiod: Object[] = [
    { text: "Weekly", value: "w" },
    { text: "Monthly", value: "m" },
    { text: "Quaterly", value: "q" },
    { text: "Half Year", value: "h" },
    { text: "Yearly", value: "y" },
  ];
  vstartM = 1;
  vendM = 12;
  vstartW = 1;
  vendW = 12;
  vstartQ = 1;
  vendQ = 4;
  vstartY = new Date().getFullYear() - 10;
  vendY = new Date().getFullYear();
  YearM = new Date().getFullYear();
  fieldscategory: object = { text: "Name", value: "ID" };
  fieldsperiod: object = { text: "text", value: "value" };
  allowFiltering: boolean = true;
  periodDefault: string = "m";
  start: number = 1;
  end: number = 12;
  year: number = new Date().getFullYear();
  catid: number = 0;
  @ViewChild("dropdownlistPeriod")
  public listObjlistPeriod: DropDownListComponent;
  @ViewChild("dropdownObjCategory")
  public listObjCategory: DropDownListComponent;
  categorymodel: Object[];
  datamap: [];
  data: any;
  dataTamp: any;
  data2: IOverview[];
  title: any[];
  counter = Array;
  locale: any = this.cookieService.get("Lang");
  categories: any;
  isYear: boolean = false;
  isHalf: boolean = false;

  dataOC = [];
  public fields: Object = { text: 'Name', value: 'ID' };
  newA = [];
  public field: any;
  ListLevel: any;
  myForm:FormGroup;
  disabled = false;
  ShowFilter = false;
  limitSelection = false;
  cities = [];
  selectedItems = [];
  dropdownSettings: any = {};
  public popHeight: string = '350px';
  public mode: string;
  public filterPlaceholder: string;
  constructor(
    private cookieService: CookieService,
    private router: Router,
    public route: ActivatedRoute,
    private spinner: NgxSpinnerService,
    private overviewService: OverviewService,
    public alertify: AlertifyService,
    public dataService: DataService,
  ) {
    this.router.routeReuseStrategy.shouldReuseRoute = () => false;
  }

  ngOnInit(): void {
    // this.spinner.show();
    // this.LoadDataset();
    this.mode = 'CheckBox';
    this.dataService.currentSourceLang.subscribe((res: any) => {
      this.locale = res;
      this.spinner.show();
      this.LoadDataset();
    });

  }
  ngAfterViewInit(e: any): void {
    // setTimeout(() => {
    //   this.select(e);
    // }, 500)
  }

  public removed(){
    // console.log('removed',this.ListLevel);
    // this.spinner.show()
    // var array = [];
    // setTimeout(() => {
    //   if (this.ListLevel.length > 0) {
    //     for(let item of this.ListLevel){
    //       for(let items of this.dataTamp){
    //         if (item === items.Level) {
    //           if(array.indexOf(items) < 0 ){
    //             array.push(items);
    //           }
    //         }
    //       }
    //     }
    //     this.data = array.sort((a, b) => (a.Level - b.Level));
    //     this.spinner.hide();
    //   } else {
    //     this.data = this.dataTamp
    //     this.spinner.hide();
    //   }
    // }, 500)
  }

  public select(){
    this.spinner.show()
    var array = [];
    setTimeout(() => {
      if (this.ListLevel.length > 0) {
        for(let item of this.ListLevel){
          for(let items of this.dataTamp){
            if (parseInt(item) === items.Level) {
              if(array.indexOf(items) < 0 ) {
                array.push(items);
              }
            }
          }
        }
        this.data = array.sort((a, b) => (a.Level - b.Level));
        this.spinner.hide();
      } else {
        this.data = this.dataTamp;
        this.spinner.hide();
      }
    }, 500)
  }

  LoadDataset() {
    this.overviewService.LoadDataset(this.catid,this.periodDefault,this.locale,this.start,this.end,this.year)
    .subscribe((response: any) => {
      this.datamap = response.data;
      this.data = response.model;
      this.dataTamp = response.model;
      this.categorymodel = response.categorymodel;
      this.data2 = response.listTitle2;

      this.LoadTitle();
      if (this.periodDefault == "y") {
        this.isYear = true;
        this.isHalf = false;
      } else if (this.periodDefault == "h") {
        this.isYear = false;
        this.isHalf = true;
      } else {
        this.isYear = false;
      }

      this.categorymodel.unshift({ Name: "All", ID: 0 });
      if (response) {
        this.spinner.hide();

        this.dataOC = response.list_level.map((item: any) => {
          return {
            ID: item.ID,
            Name: "Level " + item.Name
          }
        })

        this.field = {
          dataSource: this.dataOC,
          value: 'ID',
          parentValue: 'pid',
          text: 'Name',
        }
      }
    });
  }

  changeyears(event) {
    this.year = event.target.value;
    this.spinner.show();
    this.LoadDataset();
  }

  starts(event) {
    this.spinner.show();
    this.start = event.target.value;
    this.LoadDataset();
  }

  ends(event) {
    this.spinner.show();
    this.end = event.target.value;
    this.LoadDataset();
  }

  OnchangeCategory(event) {
    this.spinner.show();
    this.catid = event.target.value;
    this.LoadDataset();
  }

  exportTableToExcel(tableID, filename = "") {
    var downloadLink;
    var dataType = "application/vnd.ms-excel";
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, "%20");

    filename = filename ? filename + ".xls" : "excel_data.xls";

    downloadLink = document.createElement("a");

    document.body.appendChild(downloadLink);

    if (navigator.msSaveOrOpenBlob) {
      var blob = new Blob(["\ufeff", tableHTML], {
        type: dataType,
      });
      navigator.msSaveOrOpenBlob(blob, filename);
    } else {
      downloadLink.href = "data:" + dataType + ", " + tableHTML;

      downloadLink.download = filename;
      downloadLink.click();
    }
  }

  checktarget(item, item2) {
    if (item2.ID != 0) {
      if (item.Status === false) {
        if (item2.ValueArray[1] === "True") {
          return "datasetTd text-center active-td2";
        } else {
          return "datasetTd text-center active-td";
        }
      } else {
        if (item2.ValueArray[1] === "True") {
          return "datasetTd text-center active-td";
        } else {
          return "datasetTd text-center active-td2";
        }
      }
    } else {
      return "datasetTd text-center active-tdtarget";
    }
  }

  pushTrendView(item) {
    const pr = this.convertPeriodPush(this.periodDefault, true);
    return this.router.navigate([
      `/KPITrendView/${item.KPILevelCode}/${item.CategoryID}/${pr}/${this.year}/1/${this.end}`,
    ]);
  }

  refresh() {
    this.spinner.show();
    this.catid = 0;
    this.periodDefault = "m";
    this.value = "m";
    this.end = 12;
    this.year = new Date().getFullYear();
    this.listObjlistPeriod.value = "m";
    this.LoadDataset();
  }

  vstart(event): void {
    this.spinner.show();
    this.catid = parseInt(event.target.value);
    this.LoadDataset();
  }

  changeCategory(event) {
    // tslint:disable-next-line: radix
    this.catid = event.value;
    this.LoadDataset();
  }

  OnchangePeriod(event) {
    this.spinner.show();
    this.ListLevel = []
    this.periodDefault = event.value;
    if (this.periodDefault === "w") {
      this.start = 1;
      this.end = 53;
    }
    if (this.periodDefault === "m") {
      this.start = 1;
      this.end = 12;
    }
    if (this.periodDefault === "h") {
      this.start = 1;
      this.end = 2;
    }
    if (this.periodDefault === "y") {
      this.start = this.year - 10;
      this.end = this.year;
    }
    if (this.periodDefault === "q") {
      this.start = 1;
      this.end = 4;
    }
    this.LoadDataset();
  }


  LoadTitle() {
    switch (this.periodDefault) {
      case "w":
        this.title = this.data2.map((x) => {
          return x.Week;
        });
        break;
      case "m":
        this.title = this.data2.map((x) => {
          return this.convertNumberMonthToText(x.Week);
        });
        break;
      case "q":
        this.title = this.data2.map((x) => {
          return "Quarter " + x.Week;
        });
        break;
      case "h":
        this.title = this.data2.map((x) => {
          return "Half " + x.Week;
        });
        break;
      case "y":
        this.title = this.data2.map((x) => {
          if (x.ID != 0) {
            return "Year " + x.Week;
          } else {
            return "Target " + x.Week;
          }
        });
        break;
    }
  }

  convertPeriodPush(period, status = true) {
    if (status) {
      switch (period) {
        case "m":
          return "M";
        case "w":
          return "W";
        case "q":
          return "Q";
        case "h":
          return "H";
        case "y":
          return "Y";
      }
    } else {
      switch (period) {
        case "M":
          return "Monthly";
        case "W":
          return "Weekly";
        case "Q":
          return "Quarterly";
        case "H":
          return "Half Year";
        case "Y":
          return "Yearly";
      }
    }

    return "N/A";
  }

  convertNumberMonthToText(period) {
    switch (period) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
    }
    return "N/A";
  }
}
