'use strict'
define [
  'angular'
  'chartjs'
  'angularChartjs'
], (angular, chartjs, angularChartjs) ->
  [
    '$scope'
    ($scope) ->
      $scope.lastestStats =
        labels: [
          '13:00'
          '14:00'
          '15:00'
          '16:00'
          '17:00'
          '18:00'
        ]
        data: [[
          10
          100
          150
          200
          180
          192
        ]]
        series: ['Series A']
        options:
          responsive: true
          maintainAspectRatio: false
          scaleFontColor: 'rgba(255,255,255,1.0)'
          scaleGridLineColor: '#FFFFFF'

        onClick: (points, evt) ->
  ]


#console.log(points, evt);