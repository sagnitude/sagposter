'use strict'
define [], ->
  [
    '$interpolate'
    '$commonUtils'
    '$window'
    '$rootScope'
    ($interpolate, $utils, $window, $rootScope) ->
      return (
        restrict: 'E'
        transclude: false
        template: '<canvas class=\'2dcanvas\' noselect layout-fill></canvas>'
        replace: true
        scope:
          bgmap: '@'

        link: (scope, elem, attrs, controller, transcludeFn) ->
          elem[0].onselectstart = ->
            false

          elem[0].onmousedown = (event) ->
            pos = $utils.translateFromWindowToCanvas(elem[0], event.clientX, event.clientY)
            clearState = ->
              elem[0].onmousemove = null
              elem[0].onmouseup = null
              elem[0].style.cursor = 'default'
              return

            elem[0].onmousemove = (event) ->
              elem[0].style.cursor = 'move'
              pos1 = $utils.translateFromWindowToCanvas(elem[0], event.clientX, event.clientY)
              offset =
                x: pos1.x - pos.x
                y: pos1.y - pos.y
                t: _.now() or (new Date()).getTime()

              scope.$emit 'move_event', offset
              pos = pos1
              return

            elem[0].onmouseup = ->
              clearState()
              return

            elem[0].onmouseout = ->
              clearState()
              return

            return

          try
            scope.$parent.canvas = elem[0]
            scope.$parent.startDrawing()
          catch e
            console.log e
          elem
      )
  ]
