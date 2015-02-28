'use strict'
define [], ->
  [
    '$scope'
    '$http'
    '$ginit'
    ($scope, $http, $ginit) ->
      $ginit.bindEvents()
      $ginit.setGVars()
      $scope.x = 0
  ]
