'use strict'
define [], ->
  [->
    restrict: 'A'
    scope:
      resizeX: '='

    link: postLink = (scope, elem, attrs) ->
      console.log elem
      return
  ]


#scope.$watch('resizeX', function(value) {
#    elem.css('width', value+'px');
#});