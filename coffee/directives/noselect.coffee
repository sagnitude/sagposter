'use strict'
define [], ->
  [->
    restrict: 'A'
    transclude: false
    replace: false
    link: postLink = (scope, elem) ->
      elem[0].onselectstart = ->
        false

      return
  ]
