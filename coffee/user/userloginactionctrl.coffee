'use strict'
define [], ->
  [
    '$scope'
    '$http'
    '$userService'
    ($scope, $http, $userService) ->
      
      # You can access the scope of the controller from here
      $scope.welcomeMessage = 'hey this is myctrl2.js!'
      $scope.doLogin = $userService.doLogin
      $scope.tryOut = $userService.tryOut
      $scope.canLogin = $userService.canLogin
      $scope.usernameDefaultLabelText = '用户名'
      $scope.usernameRequiredText = '必填'
      $scope.usernameEmailIncorrectText = 'Email格式不对'
      $scope.passwordDefaultLabelText = '密 码'
      $scope.passwordTooShortLabelText = '密码至少六位'
      $scope.getAppropriateUsernameLabelText = ->
        if $scope.xForm.username.$error.required
          $scope.usernameRequiredText
        else if $scope.xForm.username.$error.email
          $scope.usernameEmailIncorrectText
        else
          $scope.usernameDefaultLabelText

      $scope.getAppropriatePasswordLabelText = ->
        if $scope.xForm.password.$invalid
          $scope.passwordTooShortLabelText
        else if $scope.xForm.password.$dirty
          $scope.passwordTooShortLabelText
        else
          $scope.passwordDefaultLabelText
  ]
