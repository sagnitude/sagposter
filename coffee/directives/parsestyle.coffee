'use strict'
define [], ->
  [
    '$interpolate'
    ($interpolate) ->
      return (scope, elem) ->
        exp = $interpolate(elem.html())
        watchFunc = ->
          exp scope

        scope.$watch watchFunc, (html) ->
          elem.html html
          return

        return
  ]
