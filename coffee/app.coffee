'use strict'
define [
  'angular'
  'angularCookie'
  'angularRoute'
  'angularSanitize'
  'angularMaterial'
  'uiBootstrap'
  'common'
  'bigdata'
  'bandtracking'
  'm3d'
  'chart'
  'user'
  'controllers'
  'samples'
  'directives'
  'services'
  'chartjs'
  'angularChartjs'
  'randomColor'
  'routingmap'
], (angular, cookie, route, sanitize, material, uibootstrap, common, bigdata, bandtracking, m3d, chart, user, controllers, sampleapp, directives, services, chartjs, angularChartjs, randomColor, routingmap) ->
  angular.module('ids2bweb', [
    'ngRoute'
    'ngCookies'
    'ngSanitize'
    'ngMaterial'
    'ui.bootstrap'
    'ids2bweb.common'
    'ids2bweb.bigdata'
    'ids2bweb.bandtracking'
    'ids2bweb.m3d'
    'ids2bweb.chart'
    'ids2bweb.user'
    'ids2bweb.controllers'
    'sampleapp'
    'ids2bweb.directives'
    'ids2bweb.services'
    'chart.js'
  ]).config(routingmap).config ($locationProvider) ->
    $locationProvider.html5Mode false
    return
