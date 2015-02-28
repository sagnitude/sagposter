'use strict'
window.name = 'NG_DEFER_BOOTSTRAP!'
require.config
  baseUrl: './'
  paths:
    angular: '../shared/angular.min'
    angularCookie: '../shared/angular-cookies.min'
    angularRoute: '../shared/angular-route.min'
    angularSanitize: '../shared/angular-sanitize.min'
    angularAria: '../shared/angular-aria.min'
    angularAnimate: '../shared/angular-animate.min'
    angularMaterial: '../shared/angular-material.min'
    uiBootstrap: '../shared/ui-bootstrap-tpls.min'
    amap: '../shared/amap.temp'
    domReady: '../shared/domReady'
    chartjs: '../shared/chart.min'
    angularChartjs: '../shared/angular-chart'
    jquery: '../shared/jquery.min'
    randomColor: '../shared/randomColor'
    underscore: '../shared/underscore-min'
    uiRouter: '../shared/angular-ui-router.min'
    ngChartjs: '../shared/chartjs-directive.min'
    app: '../app/app'
    bootstrap: '../app/bootstrap'
    sampleapp: '../app/img/sampleapp'
    routingmap: '../app/routingmap'

  shim:
    angular:
      deps: ['']
      exports: 'angular'

    angularRoute:
      deps: ['angular']
      exports: 'angularRoute'

    uiRouter:
      deps: ['angular']
      exports: 'uiRouter'

    angularCookie:
      deps: ['angular']
      exports: 'angularCookie'

    angularSanitize:
      deps: ['angular']
      exports: 'angularSanitize'

    angularAria:
      deps: ['angular']
      exports: 'angularAria'

    angularAnimate:
      deps: ['angular']
      exports: 'angularAnimate'

    angularMaterial:
      deps: ['angular']
      exports: 'angularMaterial'

    angularChartjs:
      deps: ['chartjs']
      exports: 'angularChartjs'

    app:
      deps: [
        'angular'
        'angularRoute'
        'angularCookie'
        'angularSanitize'
        'angularAria'
        'angularAnimate'
        'angularMaterial'
        'angularChartjs'
        'uiRouter'
      ]

  priority: ['angular']
  packages: [
    {
      name: 'common'
      main: 'module_common'
      location: 'common'
    }
    {
      name: 'controllers'
      main: 'controllers'
      location: 'controllers'
    }
    {
      name: 'user'
      main: 'module_user'
      location: 'user'
    }
    {
      name: 'bandtracking'
      main: 'module_bandtracking'
      location: 'bandtracking'
    }
    {
      name: 'bigdata'
      main: 'module_bigdata'
      location: 'bigdata'
    }
    {
      name: 'chart'
      main: 'module_chart'
      location: 'chart'
    }
    {
      name: 'm3d'
      main: 'module_m3d'
      location: 'm3d'
    }
    {
      name: 'samples'
      main: 'sampleapp'
      location: 'img'
    }
    {
      name: 'directives'
      main: 'directives'
      location: 'directives'
    }
    {
      name: 'services'
      main: 'services'
      location: 'services'
    }
  ]
  deps: ['bootstrap']
  urlArgs: 'bust=' + (new Date()).getTime() #防止读取缓存，调试用
