'use strict'
define [], ->
  [
    '$rootScope'
    '$compile'
    '$state'
    ($rootScope, $compile, $state) ->
      return (
        restrict: 'E'
        link: ($scope, elem, attrs, ctrls) ->
          applyStyles = (state, action) ->
            sheets = (if state then state.css else null)
            if state.parent
              parentState = $state.get(state.parent)
              applyStyles parentState, action
            if sheets
              sheets = [sheets]  unless Array.isArray(sheets)
              angular.forEach sheets, (sheet) ->
                action sheet
                return

            return
          html = '<link rel="stylesheet" ng-repeat="(routeCtrl, cssUrl) in routeStyles" ng-href="{{cssUrl}}" />'
          el = $compile(html)($scope)
          elem.append el
          $scope.routeStyles = {}
          $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
            applyStyles fromState, (sheet) ->
              delete $scope.routeStyles[sheet]

              console.log '>> remove >> ', sheet
              return

            applyStyles toState, (sheet) ->
              $scope.routeStyles[sheet] = sheet
              console.log '>> add >> ', sheet
              return

            return

          return
      )
  ]
