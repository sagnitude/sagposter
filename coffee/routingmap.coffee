'use strict'
define [], ->
  [
    '$stateProvider'
    ($stateProvider) ->
      $stateProvider.state('/',
        url: ''
        views:
          LoginFormView:
            templateUrl: 'user/loginformview.html'

          DisplayView:
            template: '<div>Select Mall to Start</div>'
      ).state('login',
        url: 'login'
        views:
          LoginFormView:
            templateUrl: 'user/loginformview.html'
      ).state('mall',
        url: '/mall'
        views:
          DisplayView:
            templateUrl: 'partials/mall.html'
      ).state('mall.m2d',
        url: '/m2d?m'
        views:
          MallDisplayView:
            templateUrl: 'bandtracking/m2d.html'
      ).state('mall.m3d',
        url: '/m3d?m'
        views:
          MallDisplayView:
            templateUrl: 'm3d/m3d.html'
      ).state 'shop',
        url: '/shop'
        views:
          DisplayView:
            templateUrl: 'partials/shop.html'

  ]
