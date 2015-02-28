'use strict'
define [], ->
  ($http, $commonUtils, $c) ->
    startHttpRequest = (url, callback) ->
      $http.get(url).success callback
      return

    $action = {}
    $action.startAction = (server, action, params, callback) ->
      startHttpRequest $commonUtils.getUrlByParams(server, action, params), callback
      return

    $action.startJsonAction = (server, action, params, callback) ->
      $action.startAction server, action, params, (response) ->
        callback JSON.parse(decodeURI(response.d))  if response.s is 0
        return

      return

    $action.getLatestBandDeviceTracks = (server, plazaId, storeId, beginTime, endTime, count, devs, callback) ->
      $action.startJsonAction server, $c.kListBandDevTracksActionUrl,
        plazaId: plazaId or 1176
        storeId: storeId or 1176
        beginTime: beginTime or 0
        endTime: endTime or _.now() or (new Date()).getTime()
        count: count or 1
        devNamesJson: devs
      , callback
      return

    $action
