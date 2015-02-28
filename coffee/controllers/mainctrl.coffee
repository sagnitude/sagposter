'use strict'
define [], ->
  [
    '$scope'
    ($scope) ->
      $scope.welcomeMessage = 'hey this is welcome from mainctrl'
      $scope.sayHello = ->
        console.log $scope.welcomeMessage
        return

      $scope.password = ''
      $scope.grade = ->
        size = $scope.password.length
        if size > 8
          $scope.strength = 'strong'
        else if size > 3
          $scope.strength = 'medium'
        else
          $scope.strength = 'weak'
        return
  ]
