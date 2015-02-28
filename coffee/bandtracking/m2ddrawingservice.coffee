'use strict'
define [], ->
  ->
    $m2ddraw = {}
    $m2ddraw.drawFrame = (canvas, picEle, ptseries, outerCanvas, innerCanvas, viewPort) ->
      ctx = canvas.getContext('2d')
      ctx.clearRect 0, 0, outerCanvas[0], outerCanvas[1]
      
      #draw picture according to vx and vy
      imgOff = [
        innerCanvas[0] - viewPort[0]
        innerCanvas[1] - viewPort[1]
      ]
      ctx.drawImage picEle, imgOff[0], imgOff[1]
      
      #draw points according to cx and cy
      for series of ptseries
        ctx.fillStyle = ptseries[series].color
        upTime = ptseries[series].updateTime
        for pt of ptseries[series].tracks
          point = ptseries[series].tracks[pt]
          r = 17.81
          tx = r * point.x + imgOff[0]
          ty = r * point.y + imgOff[1]
          ctx.fillRect tx, ty, 10, 10
          ctx.fillStyle = '#000'
          ctx.fillText upTime, tx, ty
      return

    $m2ddraw
