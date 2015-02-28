'use strict'
define [], ->
  [->
    restrict: 'A'
    scope:
      resizeX: '='

    link: postLink = (scope, elem, attrs) ->
      scope.$watch 'resizeY', (value) ->
        elem.css 'height', value + 'px'
        return

      return
  ]
