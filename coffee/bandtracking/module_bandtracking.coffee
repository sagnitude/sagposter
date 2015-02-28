'use strict'
define [
  'angular'
  'bandtracking/bandtrackingdatahandler'
  'bandtracking/m2delement'
  'bandtracking/m2dviewctrl'
  'bandtracking/m2ddrawingservice'
], (angular, datahandler, m2delement, m2dviewctrl, m2dDrawService) ->
  angular.module('ids2bweb.bandtracking', [
    'ui.router'
    'ngMaterial'
  ]).factory('$banddataservice', datahandler).directive('twodview', m2delement).controller('TwoDViewCtrl', m2dviewctrl).factory '$m2ddraw', m2dDrawService
