// Entry point for the build script in your package.json
import bootstrap from "bootstrap/dist/js/bootstrap.bundle"
import "@hotwired/turbo-rails"
import "./echarts"
import "./highcharts"
import "./controllers"
// import Rails from "@rails/ujs"
import * as echarts from "echarts";
// Rails.starts()

import * as Highcharts from "highcharts"

window.echarts = echarts
window.Highcharts = Highcharts
// import HighchartsMore from "highcharts/highcharts-more";
// import funnelModule from "highcharts/modules/funnel";

// // Add the funnel module to Highcharts
// funnelModule(Highcharts);


// new bootstrap.Popover(document.querySelector('[data-bs-toggle="popover"]'), {
//   trigger: 'hover'
// })

// const exampleModal = document.getElementById('exampleModal')
// if (exampleModal) {
//   exampleModal.addEventListener('show.bs.modal', event => {
//     // Button that triggered the modal
//     const button = event.relatedTarget
//     // Extract info from data-bs-* attributes
//     const recipient = button.getAttribute('data-bs-whatever')
//     // If necessary, you could initiate an Ajax request here
//     // and then do the updating in a callback.

//     // Update the modal's content.
//     const modalTitle = exampleModal.querySelector('.modal-title')
//     const modalBodyInput = exampleModal.querySelector('.modal-body input')

//     modalTitle.textContent = `New message to ${recipient}`
//     modalBodyInput.value = recipient
//   })
// }
const exampleModal = document.getElementById('container')
if (exampleModal) {
  console.log("hello")
}



// // Example to create a simple line chart in a div#container:
// const mychart = Highcharts.chart('container', {
//   chart: {
//     type: 'area'
//   },
//   xAxis: {
//     categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
//   },
  
//   plotOptions: {
//     series: {
//       fillOpacity: 0.1
//     }
//   },

//   series: [{
//     data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
//   }]
// });

