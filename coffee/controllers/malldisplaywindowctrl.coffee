'use strict'
define [
  'angularMaterial'
  'angularChartjs'
  'chartjs'
], ->
  [
    '$scope'
    '$mdSidenav'
    '$log'
    '$mdComponentRegistry'
    '$commonUtils'
    '$state'
    '$mdToast'
    ($scope, $mdSidenav, $log, $mdComponentRegistry, $utils, $state, $mdToast) ->
      $scope.panels = [
        title: '手环追踪'
        state: 'mall.m2d'
        module: 'bandtracking'
      ]
      $scope.depPanels = [
        {
          title: '楼层人数排名'
          state: 'mall.m3d'
          module: 'floorrank'
        }
        {
          title: '进店数排名'
          state: 'mall.m3d'
          module: 'entersrank'
        }
        {
          title: '店内停留时间排名'
          state: 'mall.m3d'
          module: 'stayinshoprank'
        }
        {
          title: '二次进店人数排名'
          state: 'mall.m3d'
          module: 'reentersrank'
        }
        {
          title: '店内客流量统计'
          state: 'mall.m3d'
          module: 'inshopflowrank'
        }
        {
          title: '重点客户预警'
          state: 'mall.m3d'
          module: 'viptrack'
        }
        {
          title: '广告推送数据地图'
          state: 'mall.m3d'
          module: 'addatamap'
        }
        {
          title: '广告点击排行'
          state: 'mall.m3d'
          module: 'adclickrank'
        }
      ]
      $scope.isPanelCurrentState = (panel) ->
        panel.state is $state.current.name and $state.params.m and $state.params.m is panel.module

      $scope.selectPanel = (index) ->
        console.log $state.current.name, $state.params
        return

      $scope.toggleLeft = ->
        $mdSidenav('left').toggle().then ->

        return

      $scope.isHidden = ->
        not $mdComponentRegistry.get('left').isLockedOpen()

      $scope.bottom_height = $utils.getDomElementHeight(document.getElementById('statistics_scroller_panel'))
      $scope.$on 'window_resize', ->
        $scope.bottom_height = $utils.getDomElementHeight(document.getElementById('statistics_scroller_panel'))
        return

      $scope.bottom_width = 1200
      $scope.getCurrentPanelIndex = ->
        for key of $scope.panels
          panel = $scope.panels[key]
          return key  if panel.state is $state.current.name and $state.params.m and $state.params.m is panel.module
        return

      $scope.scrollDown = ->
        selected = $scope.getCurrentPanelIndex()
        if selected + 1 isnt $scope.panels.length
          selected++
          $scope.manuallySelectPanelByIndex selected
        return

      $scope.scrollUp = ->
        selected = $scope.getCurrentPanelIndex()
        if selected isnt 0
          selected--
          $scope.manuallySelectPanelByIndex selected
        return

      $scope.jumpToPanel = (panel) ->
        $state.go panel.state + '({m:' + panel.module + '})'
        return

      $scope.manuallySelectPanelByIndex = (index) ->
        $state.go $scope.panels[index].state,
          m: $scope.panels[index].module

        return
  ]
