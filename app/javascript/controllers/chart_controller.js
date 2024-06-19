import { Controller } from "@hotwired/stimulus"
import * as Highcharts from "highcharts"
import "highcharts/highcharts-more"
import 'highcharts/modules/funnel'
// import "highcharts/modules"

// Connects to data-controller="chart"
export default class extends Controller {
  connect() {
    const chartData = JSON.parse(this.data.get("chart-data"))
    console.log(chartData)
    Highcharts.chart(this.element, {
      chart: {
          type: chartData["chart_type"]
      },
      title: {
          text: chartData["title"],
          align: 'left'
      },
      subtitle: {
          text: chartData["subtitle"],
          align: 'left'
      },
      xAxis: {
          categories: chartData["full_data"]["categories"],
          title: {
              text: null
          },
          gridLineWidth: 1,
          lineWidth: 0
      },
      yAxis: {
      },
      plotOptions: {
          bar: {
              borderRadius: '50%',
              dataLabels: {
                  enabled: true
              },
              groupPadding: 0.1
          }
      },
      legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'top',
          x: -40,
          y: 80,
          floating: true,
          borderWidth: 1,
          backgroundColor:
              Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF',
          shadow: true
      },
      credits: {
          enabled: false
      },
      series: chartData["full_data"]["series"]
  });
  }
}
