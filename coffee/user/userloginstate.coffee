'use strict'
define [], ->
  [
    '$scope'
    '$http'
    '$userService'
    ($scope, $http, $userService) ->
      $scope.doLogin = $userService.doLogin
      $scope.tryOut = $userService.tryOut
      $scope.canLogin = $userService.canLogin
  ]
