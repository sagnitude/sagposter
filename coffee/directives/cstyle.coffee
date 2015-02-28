'use strict'
define [], ->
  [
    '$interpolate'
    '$commonUtils'
    ($interpolate, $utils) ->
      return (
        restrict: 'E'
        transclude: true
        template: '<style ng-transclude></style>'
        replace: true
        postLink: (scope, elem) ->
          scope.$watch $interpolate(elem.html())(scope), (html) ->
            elem.html html
            return

          return

        link: (scope, elem, attrs, controller, transcludeFn) ->
          item = transcludeFn(scope, (clone) ->
            clone.children()
          )
          content = $utils.escape2Html(item.html())
          elem.empty().html content
          scope.$watch (->
            $interpolate(content) scope
          ), (html) ->
            elem.html html
            return

          return
      )
  ]
