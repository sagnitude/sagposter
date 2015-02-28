'use strict'
define [
  'angular'
  'angularMaterial'
  'controllers/mainctrl'
  'controllers/contentwrapperctrl'
  'controllers/mallselectorctrl'
  'controllers/shopselectorctrl'
  'controllers/selectorwrapper'
  'controllers/displaywindowctrl'
  'controllers/malldisplaywindowctrl'
  'controllers/shopdisplaywindowctrl'
  'controllers/realtimestatectrl'
  'controllers/pagectrl'
], (angular, angularMaterial, mainCtrl, contentWrapperCtrl, mallSelectorCtrl, shopSelectorCtrl, selectorWrapperCtrl, displayWindowCtrl, mallDisplayWindowCtrl, shopDisplayWindowCtrl, realtimeStateCtrl, pageCtrl) ->
  angular.module('ids2bweb.controllers', ['ngMaterial']).controller('MainCtrl', mainCtrl).controller('ContentWrapperCtrl', contentWrapperCtrl).controller('MallSelectorCtrl', mallSelectorCtrl).controller('ShopSelectorCtrl', shopSelectorCtrl).controller('SelectorWrapperCtrl', selectorWrapperCtrl).controller('DisplayWindowCtrl', displayWindowCtrl).controller('MallDisplayWindowCtrl', mallDisplayWindowCtrl).controller('ShopDisplayWindowCtrl', shopDisplayWindowCtrl).controller('RealTimeStateCtrl', realtimeStateCtrl).controller 'PageCtrl', pageCtrl
