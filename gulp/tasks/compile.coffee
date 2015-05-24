del         = require 'del'
path        = require 'path'
gulp        = require 'gulp'
gutil       = require 'gulp-util'
gulpIgnore  = require 'gulp-ignore'
coffee      = require 'gulp-coffee'
cjsx        = require 'gulp-cjsx'
gulpWebpack = require 'gulp-webpack'
webpack     = require 'webpack'
runSequence = require 'run-sequence'
config      = require '../config'


gulp.task 'compile', ->
  runSequence 'compile:clean', 'compile:server', 'compile:client', 'compile:copy', 'compile:webpack'


gulp.task 'compile:clean', ->
  del config.dest


gulp.task 'compile:server', ->
  target = path.join config.src, '**/*.coffee'
  gulp.src target
    # .pipe coffee bare: true
    .on 'error', gutil.log
    .pipe gulp.dest config.dest


gulp.task 'compile:client', ->
  target = path.join config.src, '**/*.cjsx'
  gulp.src target
    .pipe cjsx bare: true
    .on 'error', gutil.log
    .pipe gulp.dest config.destTempClient


gulp.task 'compile:copy', ->
  target = path.join config.src, '**/*'
  client = path.join config.src, '/client/**'
  gulp.src target
    .on 'error', gutil.log
    .pipe gulpIgnore.exclude client
    .pipe gulp.dest config.dest


gulp.task 'compile:webpack', ->
  target = config.webpackEntry
  gulp.src target
    .on 'error', gutil.log
    .pipe gulpWebpack config.webpackOption
    .pipe gulp.dest config.destClient
