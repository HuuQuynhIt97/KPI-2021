import { Component, OnInit, ViewChild } from "@angular/core";
import { JwtHelperService } from "@auth0/angular-jwt";
import { CookieService } from "ngx-cookie-service";
import pluginDataLabels from "chartjs-plugin-datalabels";
import { HttpClient } from "@angular/common/http";
import { Router, ActivatedRoute } from "@angular/router";
import { DatePipe } from "@angular/common";
import * as Chart from "chart.js";
import { DxDataGridComponent } from "devextreme-angular";
import { exportDataGrid } from "devextreme/excel_exporter";
import * as ExcelJS from "exceljs";
import saveAs from "file-saver";
import { environment } from "../../../../../environments/environment";
import { planetChartData } from "./../../../../modules/Chartjs/chart";
import { KpiTrendViewService } from "../../../../_core/_services/kpi-trend-view.service";
import { AlertifyService } from "../../../../_core/_services/alertify.service";

@Component({
  selector: "app-kpitrend-view",
  templateUrl: "./kpitrend-view.component.html",
  styleUrls: ["./kpitrend-view.component.css"],
  providers: [DatePipe],
})
export class KPITrendViewComponent implements OnInit {
  unit: string = "";
  period: string = "";
  label: string = "";
  jwtHelper = new JwtHelperService();
  baseUrl: string = environment.apiUrl;
  locale: string = this.cookieService.get("Lang");
  OwnerManagerment: string = "";
  public barChartPlugins = [pluginDataLabels];
  currentUser: any = Number(
    this.jwtHelper.decodeToken(localStorage.getItem("token")).nameid
  );
  Owner: string = "";
  PIC: string = "";
  Sponsor: string = "";
  Participant: string = "";
  name: string = "";
  year = new Date().getFullYear();
  columnResizingMode: string;
  showFilterRow: true;
  showHeaderFilter: boolean;
  ratingGridRefKey;
  priceGridRefKey;
  urlimage: "";
  filterOptions: {
    type: "CheckBox";
  };
  filter: {
    type: "CheckBox";
  };
  excelName: "";
  AllDataActionPlanByKPILevelID: [];
  AllDataActionPlanByKPILevelID2: any[] = [
    {
      ID: 86,
      Title: "ddd",
    },
  ];
  window: {
    width: 0;
    height: 0;
  };
  pageSettings: { pageSize: 10 };
  data: [];
  defaultLink: string = null;
  title: string = null;
  comID: 0;
  date: "";
  data2: [];
  vstart: 0;
  vend: 0;
  chart: any = {};
  min: 1;
  stepSize: 10;
  planetChartData: any = planetChartData;
  datacollection: {};
  weekly: [];
  years: [];
  start: 0;
  kpiname: string = "";
  end: 0;
  datasets: any = {};
  labels: [];
  targets: [];
  standards: [];
  dataremarks: [];
  statusfavorite: true;
  dataCharts: {};
  searchyear: 0;
  kpilevelcode: "";
  kpilevelID: 0;
  // @ViewChild(DxDataGridComponent, { static: false }) priceDataGrid: DxDataGridComponent;
  @ViewChild("priceDataGrid", { static: false })
  priceDataGrid: DxDataGridComponent;
  @ViewChild("ratingDataGrid", { static: false })
  ratingDataGrid: DxDataGridComponent;
  boxTitle: string;
  pointBackgroundColors: any[] = [];
  counter = Array;
  scores: any;
  constructor(
    public cookieService: CookieService,
    public router: Router,
    public route: ActivatedRoute,
    public http: HttpClient,
    public datePipe: DatePipe,
    private kpiTrendViewService: KpiTrendViewService,
    public alertify : AlertifyService
  ) {
    this.showHeaderFilter = true;
    this.columnResizingMode = "widget";
    this.router.routeReuseStrategy.shouldReuseRoute = () => false;
  }

  ngOnInit(): void {
    this.Loadchart();
    this.period = this.route.snapshot.params.period;
    this.year = this.route.snapshot.params.year;
  }
  vyear(event): void {
    let newYear = event.target.value;
    this.router.navigate([
      `/KPITrendView/${this.route.snapshot.params.kpilevelcode}/${this.route.snapshot.params.catid}/${this.route.snapshot.params.period}/${newYear}/${this.route.snapshot.params.start}/${this.route.snapshot.params.end}`,
    ]);
    this.Loadchart();
  }

  onExporting(e) {
    this.converImg();
    if (this.route.snapshot.params.period === "W") {
      this.boxTitle = `KPI Chart - ${this.name} - Weekly`;
    } else if (this.route.snapshot.params.period === "M") {
      this.boxTitle = `KPI Chart - ${this.name} - Monthly`;
    } else if (this.route.snapshot.params.period === "H") {
      this.boxTitle = `KPI Chart - ${this.name} - Half Year`;
    } else if (this.route.snapshot.params.period === "Q") {
      this.boxTitle = `KPI Chart - ${this.name} - Quaterly`;
    } else {
      this.boxTitle = `KPI Chart - ${this.name} - Yearly`;
    }
    const boxTitle = this.boxTitle;
    const OwnerManagerment = this.OwnerManagerment;
    const Owner = this.Owner;
    const PIC = this.PIC;
    const Sponsor = this.Sponsor;
    const Participant = this.Participant;

    const context = this;
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("Capacity Commitment");
    exportDataGrid({
      component: context.ratingDataGrid.instance,
      worksheet: worksheet,
      // autoFilterEnabled: true,
      topLeftCell: { row: 10, column: 1 },
      customizeCell: (options) => {
        const { excelCell, gridCell } = options;
        if (gridCell.rowType === "data") {
          if (gridCell.column.dataField === "Picture") {
            excelCell.value = undefined;
            const image = workbook.addImage({
              base64: this.urlimage,
              extension: "png",
            });
            worksheet.getRow(excelCell.row).height = 250;
            worksheet.mergeCells(11, 1, 11, 8);
            worksheet.addImage(image, {
              tl: { col: excelCell.col - 1, row: excelCell.row - 1 },
              ext: { width: 1000, height: 340 },
            });
          }
        }
      },
    })
      .then(function (dataGridRange) {
        // header
        const headerRow = worksheet.getRow(1);
        headerRow.height = 30;
        worksheet.mergeCells(1, 1, 1, 8);

        headerRow.getCell(1).value = boxTitle;
        headerRow.getCell(1).font = { name: "Segoe UI Light", size: 22 };
        headerRow.getCell(1).alignment = { horizontal: "left" };

        const ownerRow = worksheet.getRow(4);

        ownerRow.getCell(1).value = "Manager";
        ownerRow.getCell(1).alignment = { horizontal: "center" };
        ownerRow.getCell(1).fill = {
          type: "pattern",
          pattern: "solid",
          fgColor: { argb: "e6b800" },
        };
        ownerRow.getCell(2).value = OwnerManagerment;
        ownerRow.getCell(2).alignment = { horizontal: "center" };

        ownerRow.getCell(3).value = "Owner";
        ownerRow.getCell(3).alignment = { horizontal: "center" };
        ownerRow.getCell(3).fill = {
          type: "pattern",
          pattern: "solid",
          fgColor: { argb: "e6b800" },
        };
        ownerRow.getCell(4).value = Owner;
        ownerRow.getCell(4).alignment = { horizontal: "center" };

        ownerRow.getCell(5).value = "Updater";
        ownerRow.getCell(5).alignment = { horizontal: "center" };
        ownerRow.getCell(5).fill = {
          type: "pattern",
          pattern: "solid",
          fgColor: { argb: "e6b800" },
        };
        ownerRow.getCell(6).value = PIC;
        ownerRow.getCell(6).alignment = { horizontal: "center" };

        ownerRow.getCell(7).value = "Sponsor";
        ownerRow.getCell(7).alignment = { horizontal: "center" };
        ownerRow.getCell(7).fill = {
          type: "pattern",
          pattern: "solid",
          fgColor: { argb: "e6b800" },
        };
        ownerRow.getCell(8).value = Sponsor;
        ownerRow.getCell(8).alignment = { horizontal: "center" };

        ownerRow.getCell(9).value = "Participant";
        ownerRow.getCell(9).alignment = { horizontal: "center" };
        ownerRow.getCell(9).fill = {
          type: "pattern",
          pattern: "solid",
          fgColor: { argb: "e6b800" },
        };
        ownerRow.getCell(10).value = Participant;
        ownerRow.getCell(10).alignment = { horizontal: "center" };
        // debugger
        if (context.route.snapshot.params.period === "H") {
          const dataRow = worksheet.getRow(6);
          dataRow.getCell(1).value = "Half Year";
          dataRow.getCell(1).fill = {
            type: "pattern",
            pattern: "solid",
            fgColor: { argb: "b3b3b3" },
          };
          let idataRow = 2;
          for (let item of context.labels) {
            dataRow.getCell(idataRow).value = item;
            dataRow.getCell(idataRow).alignment = { horizontal: "center" };
            dataRow.getCell(idataRow).fill = {
              type: "pattern",
              pattern: "solid",
              fgColor: { argb: "b3b3b3" },
            };
            idataRow++;
          }
          const targetRow = worksheet.getRow(7);
          targetRow.getCell(1).value = "Target";
          let itargetRow = 2;
          for (let item of context.targets) {
            targetRow.getCell(itargetRow).value = item + "%";
            targetRow.getCell(itargetRow).alignment = { horizontal: "center" };
            itargetRow++;
          }
          const datasetsRow = worksheet.getRow(8);
          datasetsRow.getCell(1).value = "Actual";
          let idatasetsRow = 2;
          for (let item of context.datasets) {
            datasetsRow.getCell(idatasetsRow).value = item + "%";
            datasetsRow.getCell(idatasetsRow).alignment = {
              horizontal: "center",
            };
            idatasetsRow++;
          }
        }
        if (context.route.snapshot.params.period === "M") {
          const dataRow = worksheet.getRow(6);
          dataRow.getCell(1).value = "Monthly";
          dataRow.getCell(1).fill = {
            type: "pattern",
            pattern: "solid",
            fgColor: { argb: "b3b3b3" },
          };
          let idataRow = 2;
          for (let item of context.labels) {
            dataRow.getCell(idataRow).value = item;
            dataRow.getCell(idataRow).alignment = { horizontal: "center" };
            dataRow.getCell(idataRow).fill = {
              type: "pattern",
              pattern: "solid",
              fgColor: { argb: "b3b3b3" },
            };
            idataRow++;
          }
          const targetRow = worksheet.getRow(7);
          targetRow.getCell(1).value = "Target";
          let itargetRow = 2;
          for (let item of context.targets) {
            targetRow.getCell(itargetRow).value = item + "%";
            targetRow.getCell(itargetRow).alignment = { horizontal: "center" };
            itargetRow++;
          }
          const datasetsRow = worksheet.getRow(8);
          datasetsRow.getCell(1).value = "Actual";
          let idatasetsRow = 2;
          for (let item of context.datasets) {
            datasetsRow.getCell(idatasetsRow).value = item + "%";
            datasetsRow.getCell(idatasetsRow).alignment = {
              horizontal: "center",
            };
            idatasetsRow++;
          }
        }
        if (context.route.snapshot.params.period === "W") {
          const dataRow = worksheet.getRow(6);
          dataRow.getCell(1).value = "Weekly";
          dataRow.getCell(1).fill = {
            type: "pattern",
            pattern: "solid",
            fgColor: { argb: "b3b3b3" },
          };
          let idataRow = 2;
          for (let item of context.labels) {
            dataRow.getCell(idataRow).value = item;
            dataRow.getCell(idataRow).alignment = { horizontal: "center" };
            dataRow.getCell(idataRow).fill = {
              type: "pattern",
              pattern: "solid",
              fgColor: { argb: "b3b3b3" },
            };
            idataRow++;
          }
          const targetRow = worksheet.getRow(7);
          targetRow.getCell(1).value = "Target";
          let itargetRow = 2;
          for (let item of context.targets) {
            targetRow.getCell(itargetRow).value = item + "%";
            targetRow.getCell(itargetRow).alignment = { horizontal: "center" };
            itargetRow++;
          }
          const datasetsRow = worksheet.getRow(8);
          datasetsRow.getCell(1).value = "Actual";
          let idatasetsRow = 2;
          for (let item of context.datasets) {
            datasetsRow.getCell(idatasetsRow).value = item + "%";
            datasetsRow.getCell(idatasetsRow).alignment = {
              horizontal: "center",
            };
            idatasetsRow++;
          }
        }
        if (context.route.snapshot.params.period === "Q") {
          const dataRow = worksheet.getRow(6);
          dataRow.getCell(1).value = "Quaterly";
          dataRow.getCell(1).fill = {
            type: "pattern",
            pattern: "solid",
            fgColor: { argb: "b3b3b3" },
          };
          let idataRow = 2;
          for (let item of context.labels) {
            dataRow.getCell(idataRow).value = item;
            dataRow.getCell(idataRow).alignment = { horizontal: "center" };
            dataRow.getCell(idataRow).fill = {
              type: "pattern",
              pattern: "solid",
              fgColor: { argb: "b3b3b3" },
            };
            idataRow++;
          }
          const targetRow = worksheet.getRow(7);
          targetRow.getCell(1).value = "Target";
          let itargetRow = 2;
          for (let item of context.targets) {
            targetRow.getCell(itargetRow).value = item + "%";
            targetRow.getCell(itargetRow).alignment = { horizontal: "center" };
            itargetRow++;
          }
          const datasetsRow = worksheet.getRow(8);
          datasetsRow.getCell(1).value = "Actual";
          let idatasetsRow = 2;
          for (let item of context.datasets) {
            datasetsRow.getCell(idatasetsRow).value = item + "%";
            datasetsRow.getCell(idatasetsRow).alignment = {
              horizontal: "center",
            };
            idatasetsRow++;
          }
        }
        if (context.route.snapshot.params.period === "Y") {
          const dataRow = worksheet.getRow(6);
          dataRow.getCell(1).value = "Yearly";
          dataRow.getCell(1).fill = {
            type: "pattern",
            pattern: "solid",
            fgColor: { argb: "b3b3b3" },
          };
          let idataRow = 2;
          for (let item of context.labels) {
            dataRow.getCell(idataRow).value = item;
            dataRow.getCell(idataRow).alignment = { horizontal: "center" };
            dataRow.getCell(idataRow).fill = {
              type: "pattern",
              pattern: "solid",
              fgColor: { argb: "b3b3b3" },
            };
            idataRow++;
          }
          const targetRow = worksheet.getRow(7);
          targetRow.getCell(1).value = "Target";
          let itargetRow = 2;
          for (let item of context.targets) {
            targetRow.getCell(itargetRow).value = item + "%";
            targetRow.getCell(itargetRow).alignment = { horizontal: "center" };
            itargetRow++;
          }
          const datasetsRow = worksheet.getRow(8);
          datasetsRow.getCell(1).value = "Actual";
          let idatasetsRow = 2;
          for (let item of context.datasets) {
            datasetsRow.getCell(idatasetsRow).value = item + "%";
            datasetsRow.getCell(idatasetsRow).alignment = {
              horizontal: "center",
            };
            idatasetsRow++;
          }
        }
        return Promise.resolve();
      })
      .then(function () {
        return exportDataGrid({
          worksheet: worksheet,
          component: context.priceDataGrid.instance,
          topLeftCell: { row: 13, column: 1 },
          customizeCell: function (options) {
            const { gridCell, excelCell } = options;
            if (excelCell.row === 13) {
              excelCell.alignment = { horizontal: "center" };
              excelCell.border = {
                top: { style: "thin" },
                left: { style: "thin" },
                bottom: { style: "thin" },
                right: { style: "thin" },
              };
              excelCell.fill = {
                type: "pattern",
                pattern: "solid",
                fgColor: { argb: "009900" },
              };
            }
            if (gridCell.rowType === "data") {
              excelCell.alignment = { horizontal: "center" };
            }
          },
        });
      })
      .then(function () {
        workbook.xlsx.writeBuffer().then(function (buffer) {
          saveAs(
            new Blob([buffer], { type: "application/octet-stream" }),
            "KPI system download 2.xlsx"
          );
          this.alertify.success('Download success')
        });
      });
  }

  converImg() {
    // const img = 'http://codepattern.net/Blog/pics/CodepatternLogoN.png';
    const img2 = this.chart.toBase64Image();
    this.urlimage = img2;
  }

  createChart(chartId, datasets, targets, labels, label, unit,scores) {
    const self = this;
    const ctx = document.getElementById(chartId) as HTMLCanvasElement;
    const un = this.unit;

    const option: any = {
      interaction: {
        mode: 'x'
      },
      responsive: true,
      maintainAspectRatio: false,
      showScale: false,
      plugins: {
        datalabels: {
          backgroundColor: function (context) {
            return context.dataset.backgroundColor;
          },
          borderRadius: 4,
          color: "white",
          font: {
            weight: "bold",
          },
          formatter: function (value, context) {
            if (context.dataset.label.includes("Score for perfomance")) {
              return value;
            } else {
              if (self.unit == "Percentage") {
                return value + "%";
              } else {
                return value;
              }
            }
          },
        },
      },
      title: {
        display: true,
        text: "",
        fontSize: 14,
        fontColor: "black",
      },
      elements: {
        point: {
          radius: 0,
        },
        line: {
          tension: 0.2,
        },
      },
      scales: {
        yAxes: [
          {
            id: "A",
            type: "linear",
            position: "left",
            ticks: {
              padding: 10,
              fontSize: 12,
              stepSize: 10,
            },
          },
          {
            id: "B",
            type: "linear",
            position: "right",
            ticks: {
              max: 10,
              min: 0,
            },
          },
        ],
        xAxes: [
          {
            gridLines: {
              display: true,
              tickMarkLength: 8,
            },
            ticks: {
              fontSize: 12,
            },
            scaleLabel: {
              display: true,
              labelString: this.period,
              fontSize: 12,
              fontStyle: "normal",
            },
          },
        ],
      },
      tooltips: {
        intersect: false,
        mode: "label",
        position: "nearest",
        callbacks: {}
      }
    };

    const myChart = new Chart(ctx, {
      type: "bar",
      data: {
        labels: this.labels,
        datasets: [
          {
            type: 'bar',
            label: "Score for perfomance",
            data: scores,
            yAxisID: 'B',
            backgroundColor: "#db9925",
            borderColor: "#db9925",
            borderWidth: 3,
            fill: false,
            pointRadius: 10
          },
          {
            type: 'line',
            label: "Perfomance Data",
            backgroundColor: this.pointBackgroundColors,
            borderColor: "#e7263b ",
            fill: false,
            yAxisID: 'A',
            data: this.datasets,
            pointRadius: 10,
            pointHitRadius: 15
          },
          {
            type: 'line',
            label: "Targets",
            data: this.targets,
            backgroundColor: "#3c8d8a",
            borderColor: "#3c8d8a",
            borderWidth: 3,
            fill: false,
            pointRadius: 10
          }
        ],
      },
      options: option,
    });

    self.chart = myChart;
    // tslint:disable-next-line: only-arrow-functions
    ctx.onclick = function (evt) {
      const activePoints: any = myChart.getElementAtEvent(evt);
      const ind = activePoints[0]._index + 1;
      const label = myChart.data.labels[activePoints[0]._index];
      const period = self.period;
      const point = ind;
      if (period === "Y") {
        self.SortActionPlanByPeriod(label);
      } else {
        self.SortActionPlanByPeriod(point);
      }
    };
  }

  SortActionPlanByPeriod(point) {
    this.kpiTrendViewService
      .SortActionPlanByPeriod(
        this.route.snapshot.params.period,
        point,
        this.kpilevelID,
        this.currentUser
      )
      .subscribe((res: any) => {
        this.AllDataActionPlanByKPILevelID = res.data;
      });
  }

  Loadchart() {
    this.kpiTrendViewService.Loadchart(
      this.route.snapshot.params.kpilevelcode,
      this.route.snapshot.params.catid,
      this.route.snapshot.params.period,
      this.locale,
      this.route.snapshot.params.year,
      this.route.snapshot.params.start,
      this.route.snapshot.params.end
    ).subscribe((res: any) => {
      this.targets = res.targets,
      this.unit = res.Unit,
      this.statusfavorite = res.statusfavorite
      this.datasets = res.datasets
      this.labels = res.labels
      this.label = res.label
      this.kpiname = res.kpiname
      this.name = res.kpiname
      this.PIC = res.PIC
      this.kpilevelID = res.kpilevelID;
      this.LoadAllDataActionPlanByKPILevelID(res.kpilevelID)
      this.Owner = res.Owner
      this.OwnerManagerment = res.OwnerManagerment
      this.Sponsor = res.Sponsor
      this.Participant = res.Participant
      this.dataremarks = res.Dataremarks
      this.scores = res.score;
      this.createChart(
        "planet-charttrend",
        this.datasets,
        this.targets,
        this.labels,
        this.label,
        this.unit,
        this.scores
      );
      // tslint:disable-next-line: one-variable-per-declaration
      const lastTarget = this.targets;
      if (res.Status === false) {
        let i = 0;
        for (i = 0; i < this.chart.data.datasets[1].data.length; i++) {
          if (parseFloat(this.chart.data.datasets[1].data[i]) > parseFloat(lastTarget[i])) {
            this.pointBackgroundColors.push("green");
            this.chart.data.datasets[1].borderColor = "#e7263b";
          } else {
            this.pointBackgroundColors.push("red");
            this.chart.data.datasets[1].borderColor = "#e7263b";
          }
          this.chart.update();
        }
      } else {
        let i = 0;
        for (i = 0; i < this.chart.data.datasets[1].data.length; i++) {
          if (parseFloat(this.chart.data.datasets[1].data[i]) > parseFloat(lastTarget[i])) {
            this.pointBackgroundColors.push("red");
            this.chart.data.datasets[1].borderColor = "green";
          } else {
            this.pointBackgroundColors.push("green");
            this.chart.data.datasets[1].borderColor = "green";
          }
          this.chart.update();
        }
      }
    });
  }

  convertPeriod(period, status = true) {
    if (status) {
      switch (period) {
        case "M":
          return "Months In Year";
        case "W":
          return "Weeks In Year";
        case "Q":
          return "Quarters In Year";
        case "H":
          return "Halfs In Year";
        case "Y":
          return "Years In Year";
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

  LoadAllDataActionPlanByKPILevelID(id) {
    this.kpiTrendViewService
      .LoadAllDataActionPlanByKPILevelID(id, this.currentUser)
      .subscribe((res: any) => {
        this.AllDataActionPlanByKPILevelID = res.data;
      });
  }

  ResetChart() {
    this.LoadAllDataActionPlanByKPILevelID(this.kpilevelID);
  }
}
