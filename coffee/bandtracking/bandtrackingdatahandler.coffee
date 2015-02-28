'use strict'
define [], ->
  [
    '$actionhandler'
    '$c'
    ($action, $c) ->
      $btservice = {}
      $btservice.getLatestBandDeviceTracks = (plazaId, shopId, startTime, endTime, count, devices, callback) ->
        $action.getLatestBandDeviceTracks $c.serverUrl, plazaId, shopId, startTime, endTime, count, devices, (result) ->
          callback result
          return

        return

      return $btservice
  ]
