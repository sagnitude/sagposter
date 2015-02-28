'use strict'
define [], ->
  ($rootScope, $cookieStore, $cookies) ->
    $userService = {}
    $userService.doLogin = (user) ->
      console.log user.username + ' ' + user.password + ' ' + user.remember
      return

    $userService.doLogout = ->
      $cookieStore.remove 'id'
      $userService.refreshStatus()
      return

    $userService.refreshStatus = ->
      $userService.canLogin = ->
        $cookies.id and $cookies.id isnt 0

      return

    $userService.canLogin = ->
      $cookies.id and $cookies.id isnt 0

    $userService.hasAccount = $cookies.id and $cookies.id > 0
    $userService.tryOut = ->
      $cookies.id = -1
      $rootScope.$emit 'login_event'
      $userService.refreshStatus()
      return

    $userService.user = Object(
      username: ''
      password: ''
      remember: false
    )
    $userService
