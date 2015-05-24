path        = require 'path'
jsonServer  = require 'json-server'
express     = require 'express'
consolidate = require 'consolidate'

app = jsonServer.create()
router = jsonServer.router 'dest/server/db.json'

# static
app.use '/', express.static path.join __dirname, '..', 'client'

# Views
app.engine 'mustache', consolidate.hogan
app.set 'view engine', 'mustache'
app.set 'views', path.join __dirname, '/views'

# Routes
app.get '/', (req, res) ->
  res.render 'index'
app.use '/api', router

app.listen 3000
console.log 'App started on port 3000'
