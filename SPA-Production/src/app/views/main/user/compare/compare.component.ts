import { HttpClient  } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { environment } from '../../../../../environments/environment';
import { planetChartData } from '../../../../modules/Chartjs/chart';
import { CompareService } from '../../../../_core/_services/compare.service';
import {Chart} from 'chart.js';
@Component({
  selector: 'app-compare',
  templateUrl: './compare.component.html',
  styleUrls: ['./compare.component.css']
})
export class CompareComponent implements OnInit {
  baseUrl = environment.apiUrl
  itemList: any = []
  chart: any = {}
  planetChartData: any = planetChartData
  datacollection: any = {}
  weekly: any = []
  years: any = []
  data: any = []
  kpiname: ''
  datasets: any = {}
  period: any = ''
  unit: any = ''
  labels: any = []
  targets: any =  []
  standards: []
  dataremarks: any = []
  statusfavorite: true
  dataCharts: any = {}
  options: any = {
    responsive: true,
    maintainAspectRatio: false,
    showScale: false,
    plugins: {
      datalabels: {
        backgroundColor: function(context) {
          return context.dataset.backgroundColor;
        },
        borderRadius: 4,
        color: 'white',
        font: {
          weight: 'bold'
        },
        formatter: function(value, context) {
          return value
        }
      }
    },
    title: {
      display: true,
      text: '',
      fontSize: 14,
      fontColor: 'black'
    },
    elements: {
      point: {
        radius: 0
      },
      line: {
        tension: 0.2
      }
    },
    scales: {
      yAxes: [
        {
          stacked: true,
          display: true,
          position: 'left',
          ticks: {
            beginAtZero: true,
            padding: 10,
            fontSize: 12,
            stepSize: 10,
            min: -5
          },
          scaleLabel: {
            display: true,
            labelString: this.unit,
            fontSize: 12,
            fontStyle: 'normal'
          }
        }
      ],
      xAxes: [
        {
          gridLines: {
            display: true,
            tickMarkLength: 8
          },
          ticks: {
            fontSize: 12
          },
          scaleLabel: {
            display: true,
            labelString: this.period,
            fontSize: 12,
            fontStyle: 'normal'
          }
        }
      ]
    }
  }
  constructor(
    private http: HttpClient,
    private router: Router,
    private route: ActivatedRoute,
    private compareService: CompareService
  ) { }

  ngOnInit(): void {
    this.LoadDataCompare()
  }
  convertPeriod(period) {
    switch (period) {
      case 'M':
        return 'Monthly';
      case 'W':
        return 'Weekly';
      case 'H':
        return 'Half Year';
      case 'Q':
        return 'Quarterly';
      case 'Y':
        return 'Yearly';
    }
  return 'N/A';
}
createChart(chartId, datasets, targets, labels, unit) {
  const ctx = document.getElementById(chartId) as HTMLCanvasElement;

  const myChart = new Chart(ctx, {
    type: 'line',
    // labels: labels,
    data: {
      labels: labels,
      datasets: this.itemList
    },
    options: this.options
  });
  this.chart = myChart;
  this.chart.update();
}
  LoadDataCompare() {
    this.compareService.LoadDataCompare(this.route.snapshot.params.obj)
    .subscribe((result: any) =>{
      this.kpiname = result[0].kpiname
      this.period = this.convertPeriod(result[0].period)
      this.datasets  = result;
      let COLORS =  [
        '#FF3784',
        '#36A2EB',
        '#4BC0C0',
        '#F77825',
        '#9966FF',
        '#00A8C6',
        '#379F7A',
        '#CC2738',
        '#8B628A',
        '#8FBE00',
        '#606060'
      ];
      for (let item = 0; item < this.datasets.length; item ++) {
        let ListData = {
          label: this.datasets[item].label,
          spanGaps: false,
          backgroundColor: COLORS[(item+1)],
          borderColor: COLORS[(item+1)],
          fill: false,
          data: this.datasets[item].datasets,
        };
        this.itemList.push(ListData);
      }

      this.labels = result[0].labels;
      this.targets = result[0].targets;

      (this.options.label = result.label),
      (this.options.title.text = 'KPI Compare Chart -' + result[0].kpiname + ' - ' + this.convertPeriod(result[0].period)),
      (this.options.scales.yAxes[0].scaleLabel.labelString = result[0].Unit);
      this.options.scales.xAxes[0].scaleLabel.labelString = this.convertPeriod(result[0].period);
      this.createChart(
        'planet-chartcompare',
        this.datasets,
        this.targets,
        this.labels,
        this.unit
      );
    })
  }

}
