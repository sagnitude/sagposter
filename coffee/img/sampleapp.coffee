reverseString = (name) ->
  name.split('').reverse().join ''
'use strict'
define ['angular'], (angular) ->
  angular.module('sampleapp', []).controller 'Ctrl2', [
    '$scope'
    '$mdSidenav'
    ($scope, $mdSidenav) ->
      $scope.welcomeMessage = 'App Started!'
      $scope.toggleSidenav = (menuId) ->
        $mdSidenav(menuId).toggle()
        return

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
