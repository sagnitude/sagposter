'use strict'
define ['underscore'], (underscore) ->
  [
    '$window'
    '$rootScope'
    '$state'
    '$userService'
    ($window, $rootScope, $state, $userService) ->
      $c = {}
      $c.bindEvents = ->
        angular.element($window).bind 'resize', ->
          $rootScope.$broadcast 'window_resize'
          return

        return

      $c.setGVars = ->
        window._ = underscore
        window.$rp = _.chain
        return

      reserveState = _.debounce((toState, toParams) ->
        $rootScope.reservedState = toState
        $rootScope.reservedParams = toParams
        return
      , 1000, true)
      $rootScope.$on 'login_event', (event, data) ->
        
        #restore default state
        if $rootScope.reservedState and $rootScope.reservedParams
          $state.go $rootScope.reservedState.name, $rootScope.reservedParams
          delete $rootScope.reservedParams

          delete $rootScope.reservedState
        return

      $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
        
        #from any other state to any state except login, jump to login
        if not $userService.canLogin() and toState.name isnt 'login'
          event.preventDefault()
          reserveState toState, toParams
          $state.go 'login'
        return

      
      #$state.go("mall.m2d", {m:"bandtracking"});
      window.location.hash = '#/mall/m2d?m=bandtracking'
      return $c
  ]
