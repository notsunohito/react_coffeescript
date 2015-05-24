gulp        = require 'gulp'
runSequence = require 'run-sequence'

require('require-dir')('gulp/tasks')


gulp.task 'default', ->
    runSequence 'compile'
