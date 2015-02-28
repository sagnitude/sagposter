'use strict'

###*
Handle actions & states about m2d view.
@param randomColor
@returns {*[]}
###
define ['randomColor'], (randomColor) ->
  [
    '$scope'
    '$m2ddraw'
    '$commonUtils'
    '$banddataservice'
    '$mdToast'
    ($scope, $m2ddraw, $utils, $bandservice, $mdToast) ->
      
      #
      #             * Fake Data
      #             
      $scope.tempBgMap = './img/band2d.png'
      $scope.availablePhones = [
        {
          number: '172XXXXXXXX'
          bands: [
            {
              type: 1
              name: 'IDSBand-1'
              color: randomColor()
            }
            {
              type: 2
              name: 'IDSBand-2'
              color: randomColor()
            }
          ]
        }
        {
          number: '189XXXXXXXX'
          bands: [
            {
              type: 1
              name: 'WD-MI-101'
              color: randomColor()
            }
            {
              type: 2
              name: 'WD-MI-493'
              color: randomColor()
            }
          ]
        }
      ]
      
      #
      #             * Selection & inblock routing
      #             
      $scope.isPhoneSelected = (phone) ->
        $scope.availablePhones[$scope.selectedPhoneIndex] is phone

      $scope.selectPhone = (index) ->
        $scope.selectedBandIndex = `undefined`  if index isnt $scope.selectedPhoneIndex
        $scope.selectedPhoneIndex = index
        $scope.trackingDevices = $scope.availablePhones[$scope.selectedPhoneIndex].bands.map((band) ->
          band.name
        ) or []
        return

      $scope.selectPhone 0
      $scope.selectBand = (index) ->
        $scope.selectedBandIndex = index
        return

      $scope.isBandSelected = (band) ->
        $scope.availablePhones[$scope.selectedPhoneIndex].bands[$scope.selectedBandIndex] is band

      
      #
      #             * Viewport & canvas appearence.
      #             
      $scope.wheight = 1000
      $scope.wwidth = 1000
      $scope.vxoff = 0
      $scope.vyoff = 0
      $scope.imgWidth = 1000
      $scope.imgHeight = 1000
      $scope.outerWidth = 1000
      $scope.outerHeight = 1000
      
      #@inner
      $scope.cxoff = 0
      $scope.cyoff = 0
      
      #data
      $scope.series = []
      
      #controls
      $scope.scaleEnabled = false
      $scope.readImage = (imgPath) ->
        $scope.bgimg = new Image()
        $scope.bgimg.src = imgPath
        $scope.bgimg.onload = ->
          $scope.updateSize $scope.canvas
          return

        return

      findBandByBandName = (name) ->
        $rp($scope.availablePhones).map((phone) ->
          phone.bands
        ).flatten().find((band) ->
          band.name is name
        ).value()

      findColorByBandName = (name) ->
        $rp($scope.availablePhones).map((phone) ->
          phone.bands
        ).flatten().find((band) ->
          band.name is name
        ).value().color or randomColor()

      $scope.handlePointList = (pList) ->
        
        #console.log(pList)
        $scope.series = _.map(pList, (listItem) ->
          tracks: listItem.trackList
          color: findColorByBandName(listItem.devName)
          updateTime: (new Date()).toLocaleString()
          type: findBandByBandName(listItem.devName).type
        )
        $scope.checkWarnings $scope.series
        $scope.draw $scope.canvas
        return

      
      #update canvas size
      $scope.updateSize = (canvas) ->
        $scope.canvas = canvas
        canvasHeight = $utils.getDomElementHeight(document.getElementById('mall_display_core'))
        canvasWidth = $utils.getDomElementWidth(document.getElementById('mall_display_core'))
        
        #calculate physical canvas size
        canvas.width = canvasWidth
        canvas.height = canvasHeight
        $scope.wwidth = canvasWidth
        $scope.wheight = canvasHeight
        
        #calculate bounding box
        $scope.imgWidth = $scope.bgimg.width
        $scope.imgHeight = $scope.bgimg.height
        if $scope.scaleEnabled
          
          #TODO: bounding box should be calculated while img is smaller than canvas
          $scope.scaleEnabled = $scope.scaleEnabled
        else
          $scope.cxoff = 0
          $scope.cyoff = 0
          $scope.outerWidth = $scope.imgWidth
          $scope.outerHeight = $scope.imgHeight
        $scope.viewPort = [
          $scope.vxoff
          $scope.vyoff
          $scope.wwidth
          $scope.wheight
        ]
        $scope.innerCanvas = [
          $scope.cxoff
          $scope.cyoff
          $scope.imgWidth
          $scope.imgHeight
        ]
        $scope.outerCanvas = [
          $scope.outerWidth
          $scope.outerHeight
        ]
        return

      $scope.toastPosition =
        bottom: false
        top: true
        left: false
        right: true

      $scope.getToastPosition = ->
        Object.keys($scope.toastPosition).filter((pos) ->
          $scope.toastPosition[pos]
        ).join ' '

      $scope.showDistanceWarningToast = (dist) ->
        dist += ''
        dist = dist.substring(0, dist.indexOf('.') + 3)
        $mdToast.show $mdToast.simple().content('手环距离过大！预计距离' + dist + '米').position($scope.getToastPosition()).action('OK').hideDelay(1000)
        return

      $scope.checkWarnings = (series) ->
        tracks = $rp(series).map((serie) ->
          x: serie.tracks[0].x
          y: serie.tracks[0].y
          type: serie.type
        )
        t1 = tracks.filter((track) ->
          track.type is 1
        ).value()[0]
        t2 = tracks.filter((track) ->
          track.type is 2
        ).value()[0]
        if t1 and t2
          dis = Math.sqrt(((t1.x - t2.x) * (t1.x - t2.x) + (t1.y - t2.y) * (t1.y - t2.y)))
          $scope.showDistanceWarningToast dis  if dis > 5
        return

      
      #
      #             * User-ViewController Interactions
      #             
      $scope.$on 'window_resize', (event, data) ->
        $scope.updateSize $scope.canvas
        $scope.draw $scope.canvas
        return

      $scope.$on 'move_event', (event, data) ->
        $scope.tryMoveViewPortByOffset data.x, data.y
        $scope.draw $scope.canvas
        return

      $scope.tryMoveViewPortByOffset = (vx, vy) ->
        tx = $scope.vxoff - vx
        ty = $scope.vyoff - vy
        
        #move x wards
        $scope.vxoff = tx  if $utils.varInRange(tx, 0, $scope.outerWidth - $scope.wwidth)
        
        #move y wards
        $scope.vyoff = ty  if $utils.varInRange(ty, 0, $scope.outerHeight - $scope.wheight)
        return

      
      #else: just ignore event.
      
      #
      #             * ViewController - DrawService Interactions
      #             
      $scope.draw = (canvas) ->
        $scope.updateSize $scope.canvas
        if $scope.bgimg
          $m2ddraw.drawFrame canvas, $scope.bgimg, $scope.series, $scope.outerCanvas, $scope.innerCanvas, $scope.viewPort
        else
          
          #TODO: how to deal with this?
          $scope.readImage $scope.tempBgMap
          $m2ddraw.drawFrame canvas, $scope.bgimg, $scope.series, $scope.outerCanvas, $scope.innerCanvas, $scope.viewPort
        return

      $scope.startDrawing = ->
        $scope.readImage $scope.tempBgMap
        timer = setInterval(->
          $bandservice.getLatestBandDeviceTracks 1176, 1176, 0, _.now() or (new Date()).getTime(), 1, $scope.trackingDevices, (result) ->
            
            #TODO: model layer is hidden
            $scope.handlePointList result
            return

          return
        , 2000)
        return
  ]
