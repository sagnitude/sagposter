'use strict'
define [
  'angular'
  'directives/parsestyle'
  'directives/cstyle'
  'directives/resizex.js'
  'directives/resizey.js'
  'directives/noselect.js'
  'directives/cssloader.js'
], (angular, parseStyle, cStyle, resizeX, resizeY, noselect, cssloader) ->
  angular.module('ids2bweb.directives', []).directive('parseStyle', parseStyle).directive('cstyle', cStyle).directive('resizex', resizeX).directive('resizey', resizeY).directive('noselect', noselect).directive 'head', cssloader
