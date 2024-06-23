// app/javascript/higcharts.js
import * as Highcharts from "highcharts"
import funnelModule from "highcharts/modules/funnel"



funnelModule(Highcharts);
window.Highcharts = Highcharts;