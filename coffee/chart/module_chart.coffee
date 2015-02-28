'use strict'
define [
  'angular'
  'chartjs'
  'angularChartjs'
  'chart/mallbottomchartctrl'
], (angular, chartjs, ngChartjs, mallBottomChartCtrl) ->
  angular.module('ids2bweb.chart', []).controller 'MallBottomChartCtrl', mallBottomChartCtrl
