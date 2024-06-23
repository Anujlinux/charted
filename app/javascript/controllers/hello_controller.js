import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // this.element.textContent = "Hello World!"
    console.log(echarts);
    console.log("hello there new build10");
    // Initialize the echarts instance based on the prepared dom
    var myChart = echarts.init(this.element);

    // Specify the configuration items and data for the chart
    var option = {
      title: {
        text: 'ECharts Getting Started Example'
      },
      tooltip: {},
      legend: {
        data: ['sales']
      },
      xAxis: {
        data: ['Shirts', 'Cardigans', 'Chiffons', 'Pants', 'Heels', 'Socks']
      },
      yAxis: {},
      series: [
        {
          name: 'sales',
          type: 'bar',
          data: [5, 20, 36, 10, 10, 20]
        }
      ]
    };

    // Display the chart using the configuration items and data just specified.
    myChart.setOption(option);
  }
}
