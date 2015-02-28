'use strict'
define [], ->
  ->
    $utils = {}
    $utils.arrayContains = _.contains or (array, item) ->
      i = 0

      while i < array.length
        return true  if array[i] is item
        i++
      false

    $utils.escape2Html = _.unescape or (str) ->
      arrEntities =
        lt: '<'
        gt: '>'
        nbsp: ' '
        amp: '&'
        quot: '"'

      str.replace /&(lt|gt|nbsp|amp|quot);/g, (all, t) ->
        arrEntities[t]


    $utils.translateFromWindowToCanvas = (canvas, x, y) ->
      bbox = canvas.getBoundingClientRect()
      x: x - bbox.left - (bbox.width - canvas.width) / 2
      y: y - bbox.top - (bbox.height - canvas.height) / 2

    $utils.getDomElementHeight = (ele) ->
      ele.clientHeight or ele.innerHeight

    $utils.getDomElementWidth = (ele) ->
      ele.clientWidth or ele.innerWidth

    $utils.pointInRect = (x, y, x0, y0, x1, y1) ->
      $utils.varInRange(x, x0, x1) and $utils.varInRange(y, y0, y1)

    $utils.varInRange = (v, v0, v1) ->
      if v0 > v1
        v2 = v0
        v0 = v1
        v1 = v2
      v > v0 and v < v1

    $utils.getPrettyJson = (jsonObject) ->
      JSON.stringify jsonObject, null, '\t'

    $utils.getUrlByParams = (server, action, params) ->
      paramUrl = ''
      for key of params
        paramUrl += '&' + key + '='
        p = ''
        if params[key] instanceof Array
          p = '['
          tr = ''
          for ele of params[key]
            tr += ','
            if params[key][ele] instanceof Boolean or params[key][ele] instanceof String or params[key][ele] instanceof Number or typeof params[key][ele] is 'string' or typeof params[key][ele] is 'number'
              tr += '"' + params[key][ele] + '"'
            else tr += params[key][ele]  if params[key][ele]
          p += tr.substr(1)
          p += ']'
        else
          p = params[key]
        paramUrl += p
      server + action + '?' + paramUrl.substr(1)

    $utils
