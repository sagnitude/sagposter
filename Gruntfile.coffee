module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffee:
      compile:
        options: bare: true
        cwd: './coffee'
        src: [ '**/*.coffee' ]
        dest: './app'
        ext: '.js'
        expand: true
        flatten: false
      compileWithMaps:
        options:
          bare: true
          sourceMaps: true
          sourceMapDir: './maps'
        cwd: './coffee'
        src: [ '**/*.coffee' ]
        dest: './app'
        ext: '.js'
        expand: true
        flatten: false
      compileUnitTests:
        options: bare: true
        cwd: './test/dist/unit/spec'
        src: ['**/*.coffee']
        dest: './test/dist/unit/spec'
        ext: '.spec.js'
        expand: true
        flatten: false
      compileE2ETests:
        options: bare: true
        cwd: './test/dist/e2e/spec'
        src: ['**/*.coffee']
        dest: './test/dist/e2e/spec'
        ext: '.spec.js'
        expand: true
        flatten: false
      compileE2EConfig:
        options: bare: true
        src: ['./test/dist/e2e/e2e.coffee']
        dest: './test/dist/e2e/e2e.conf.js'
      compileUnitConfig:
        options: bare: true
        cwd: './test/dist/unit'
        src: ['*.coffee']
        dest: './test/dist/unit'
        ext: '.conf.js'
        expand: true
    js2coffee: each: files: [ {
      expand: true
      flatten: false
      cwd: './app'
      src: [
        '**/*.js'
        '!libs/*.js'
      ]
      dest: './coffee'
      ext: '.coffee'
    } ]
    copy:
      imgs:
        expand: true
        flatten: false
        cwd: 'app/img'
        src: '**/*'
        dest: 'dist/img'
      html: files: [ {
        src: 'app/index.html'
        dest: 'dist/index.html'
      } ]
      css:
        expand: true
        flatten: false
        cwd: 'app/css'
        src: '*.css'
        dest: 'dist/css'
      builds: files: [ {
        src: 'builds/main.js'
        dest: 'dist/main.js'
      } ]
    bowercopy:
      options: {}
      shared:
        options: destPrefix: 'shared'
        files:
          'angular.min.js': 'angular/angular.min.js'
          'ui-bootstrap-tpls.min.js': 'angular-bootstrap/ui-bootstrap-tpls.min.js'
          'angular-cookies.min.js': 'angular-cookies/angular-cookies.min.js'
          'angular-route.min.js': 'angular-route/angular-route.min.js'
          'angular-sanitize.min.js': 'angular-sanitize/angular-sanitize.min.js'
          'angular-mocks.js': 'angular-mocks/angular-mocks.js'
          'domReady.js': 'requirejs-domready/domReady.js'
          'chart.min.js': 'Chart.js/Chart.min.js'
          'angular-chart.js': 'angular-chart.js/dist/angular-chart.js'
          'jquery.min.js': 'jquery/dist/jquery.min.js'
          'underscore-min.js': 'underscore/underscore-min.js'
          'angular-material.min.js': 'angular-material/angular-material.min.js'
          'angular-aria.min.js': 'angular-aria/angular-aria.min.js'
          'angular-animate.min.js': 'angular-animate/angular-animate.min.js'
          'randomColor.js': 'randomcolor/randomColor.js'
          'angular-ui-router.min.js': 'angular-ui-router/release/angular-ui-router.min.js'
          'chartjs-directive.min.js': 'angular-chartjs-directive/chartjs-directive.js'
      innerlibs:
        options: destPrefix: 'app/libs'
        files:
          'bootstrap.min.css': 'bootstrap/dist/css/bootstrap.min.css'
          'require.min.js': 'requirejs/require.js'
          'angular-material.min.css': 'angular-material/angular-material.min.css'
          'angular-chart.css.map': 'angular-chart.js/dist/angular-chart.css.map'
          'angular-chart.css': 'angular-chart.js/dist/angular-chart.css'
      buildinnerlibs:
        options: destPrefix: 'builds/libs'
        files:
          'bootstrap.min.css': 'bootstrap/dist/css/bootstrap.min.css'
          'require.min.js': 'requirejs/require.js'
          'angular-material.min.css': 'angular-material/angular-material.min.css'
          'angular-chart.css.map': 'angular-chart.js/dist/angular-chart.css.map'
          'angular-chart.css': 'angular-chart.js/dist/angular-chart.css'
      maps:
        options: destPrefix: 'shared'
        files:
          'angular.min.js.map': 'angular/angular.min.js.map'
          'angular-cookies.min.js.map': 'angular-cookies/angular-cookies.min.js.map'
          'angular-route.min.js.map': 'angular-route/angular-route.min.js.map'
          'angular-sanitize.min.js.map': 'angular-sanitize/angular-sanitize.min.js.map'
          'jquery.min.map': 'jquery/dist/jquery.min.map'
          'underscore-min.map': 'underscore/underscore-min.map'
          'angular-aria.min.js.map': 'angular-aria/angular-aria.min.js.map'
          'angular-animate.min.js.map': 'angular-animate/angular-animate.min.js.map'
          'angular-chart.js.map': 'angular-chart.js/dist/angular-chart.js.map'
    requirejs: compile:
      options:
        appDir: './app'
        dir: './dist'
        name: 'main'
        baseUrl: '.'
        mainConfigFile: './app/main.js'
        optimize: 'none'
        removeCombined: true
        preserveLicenseComments: false
        wrap:
          start: '(function() {\'use strict\';'
          end: '}());'
      dev: options: optimize: 'none'
      release: options:
        optimize: 'uglify'
        generateSourceMaps: false
        dir: './release'
      dist: options:
        optimize: 'uglify'
        generateSourceMaps: true
    protractor:
      options:
        configFile: 'test/dist/e2e/e2e.conf.js'
        keepAlive: true
        noColor: false
        args: {}
      dist: options:
        configFile: 'test/dist/e2e/e2e.conf.js'
        args: {}
      src: options:
        configFile: 'test/src/e2e/e2e.conf.js'
        args: {}
    protractor_webdriver: start: options: path: ''
    concat:
      dist:
        separator: ';'
        stripBanners: true
        src: [ 'shared/*.js' ]
        dest: 'dist/<%= pkg.name %>.js'
      combinecss:
        separator: ''
        stripBanners: true
        src: [
          'dist/css/*.css'
          '!dist/css/result.css'
        ]
        dest: 'dist/css/result.css'
    karma:
      unit:
        configFile: 'test/dist/unit/karma.conf.js'
        browsers: [
          'Firefox'
          'PhantomJS'
        ]
        singleRun: true
      unittesting:
        configFile: 'test/dist/unit/karma.conf.js'
        browsers: [
          'Firefox'
          'PhantomJS'
        ]
        singleRun: false
      srcunit:
        configFile: 'test/src/unit/karma.conf.js'
        browsers: [
          'Firefox'
          'PhantomJS'
        ]
        singleRun: true
    uglify:
      options: {}
      dist: files: './dist/main.min.js': [ './dist/main.js' ]
      innerlibs: files: './app/libs/require.min.js': [ './app/libs/require.min.js' ]
    jshint:
      files: [
        'gruntfile.js'
        'app/**/*.js'
        'test/**/*.js'
      ]
      options: globals:
        console: true
        module: true
        document: true
    clean:
      builtcoffee: [ 'dist/**/*.coffee' ]
      dist: [ 'dist' ]
      coffeecache: [ 'app/**/*.coffee' ]
      combinedcss: [
        'dist/css/*.css'
        '!dist/css/result.css'
      ]
      builtcss: [
        'dist/css/*.css'
        '!dist/css/app.css'
      ]
    watch:
      files: [ '<%= jshint.files %>' ]
      tasks: [
        'jshint'
        'qunit'
      ]
    concurrent:
      tests: [
        'karma:unit'
        'protractor:dist'
      ]
      testsrc: [
        'karma:srcunit'
        'protractor:src'
      ]
    htmlmin:
      dist:
        options:
          removeComments: true
          collapseWhitespace: true
        files: 'dist/index.html': 'dist/index.html'
      dev: files: 'dist/index.html': 'dist/index.html'
    cssmin: target:
      files: 'dist/css/app.css': [ 'dist/css/*.css' ]
      options:
        shorthandCompacting: false
        roundingPrecision: -1
    css_purge: custom:
      options:
        'verbose': false
        'no_duplicate_property': true
      files: 'dist/css/app.css': 'dist/css/result.css'
    less: dist:
      options: paths: [ 'app' ]
      files: [ {
        expand: true
        flatten: true
        cwd: 'app'
        src: [ '**/*.less' ]
        dest: 'dist/css'
        ext: '.css'
      } ]
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-bowercopy'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-protractor-webdriver'
  grunt.loadNpmTasks 'grunt-protractor-runner'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-js2coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-css-purge'
  grunt.registerTask 'preparelibs:nomaps', [
    'bowercopy:innerlibs'
    'uglify:innerlibs'
    'bowercopy:shared'
  ]
  grunt.registerTask 'preparelibs:maps', [
    'preparelibs:nomaps'
    'bowercopy:maps'
  ]
  grunt.registerTask 'buildcss', [
    'less:dist'
    'copy:css'
    'concat:combinecss'
    'clean:combinedcss'
    'css_purge:custom'
    'clean:builtcss'
  ]
  grunt.registerTask 'minifydist', [
    'uglify:dist'
    'htmlmin:dist'
    'cssmin'
  ]
  grunt.registerTask 'minifydist:nouglify', [
    'htmlmin:dist'
    'cssmin'
  ]
  grunt.registerTask 'clearcache', [
    'clean:dist'
    'clean:coffeecache'
  ]
  grunt.registerTask 'clearnoncoffeecache', [ 'clean:dist' ]
  grunt.registerTask 'lint', [ 'jshint' ]
  grunt.registerTask 'test', [ 'concurrent:tests' ]
  grunt.registerTask 'test:unit', [ 'karma:unit' ]
  grunt.registerTask 'test:e2e', [ 'protractor:dist' ]
  grunt.registerTask 'testing:unit', [ 'karma:unittesting' ]
  grunt.registerTask 'compileTestConfigs', [ 'coffee:compileE2EConfig', 'coffee:compileUnitConfig' ]
  grunt.registerTask 'compileTests', [ 'coffee:compileUnitTests', 'coffee:compileE2ETests' ]
  grunt.registerTask 'compileAllCoffees', [ 'coffee:compile' ]
  grunt.registerTask 'compileAllCoffeeWithMap', [ 'coffee:compileWithMaps' ]
  #dev
  grunt.registerTask 'default', [
    'clearcache'
    'preparelibs:maps'
    'compileAllCoffeeWithMap'
    'requirejs:compile:dev'
  ]
  #release
  grunt.registerTask 'release', [
    'clearcache'
    'preparelibs:nomaps'
    'compileAllCoffees'
    'requirejs:compile:release'
    'minifydist'
  ]
  #dist
  grunt.registerTask 'dist', [
    'clearcache'
    'preparelibs:maps'
    'compileAllCoffeeWithMap'
    'requirejs:compile:dist'
    'minifydist:nouglify'
  ]
  return