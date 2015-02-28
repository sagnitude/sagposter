'use strict'
define [
  'angular'
  'common/globalinits'
  'common/actionhandler'
  'common/utils'
  'common/constants'
], (angular, inits, actionhandler, utils, consts) ->
  angular.module('ids2bweb.common', []).factory('$ginit', inits).factory('$commonUtils', utils).factory('$c', consts).factory '$actionhandler', [
    '$http'
    '$commonUtils'
    '$c'
    actionhandler
  ]
