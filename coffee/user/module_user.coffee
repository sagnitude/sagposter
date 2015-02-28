'use strict'
define [
  'angular'
  'user/userloginlogout'
  'user/userservice'
  'user/userloginstate'
  'user/userloginactionctrl'
  'angularCookie'
], (angular, userloginlogout, userservice, userloginstate, userloginaction, cookies) ->
  angular.module('ids2bweb.user', []).controller('LoginCtrl', userloginlogout).factory('$userService', userservice).controller('LoginStateCtrl', userloginstate).controller 'LoginActionCtrl', userloginaction
