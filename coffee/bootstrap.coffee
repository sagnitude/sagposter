'use strict'
require [
  'angular'
  'app'
  'domReady'
], (angular, app, domReady) ->
  
  #angular.element().ready(function() {
  #    angular.resumeBootstrap([app.name]);
  #});
  require ['domReady!'], (document) ->
    angular.bootstrap document, [app.name]  if document.getElementsByTagName('html')[0].attributes['webdriver'] is `undefined`
    return

  return
