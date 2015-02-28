'use strict'
define [
  'angular'
  'services/cityselectorservice'
  'services/mallselectorservice'
], (angular, citySelectorService, mallSelectorService) ->
  angular.module('ids2bweb.services', []).factory('$citySelectorService', citySelectorService).factory '$mallSelectorService', mallSelectorService
