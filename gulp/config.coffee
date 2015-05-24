path = require 'path'

root = exports.root = path.resolve __dirname, '..'

src            = exports.src            = path.join root, 'src'
srcServer      = exports.srcServer      = path.join src, 'server'
srcClient      = exports.srcClient      = path.join src, 'client'

dest           = exports.dest           = path.join root, 'dest'
destServer     = exports.destServer     = path.join dest, 'server'
destClient     = exports.destClient     = path.join dest, 'client'
destTempClient = exports.destTempClient = path.join dest, '.webpack_temp'

webpackEntry   = exports.webpackEntry   = path.join destTempClient, 'client/main.js'
webpackOption  = exports.webpackOption  = output: { filename: 'bundle.js' }
