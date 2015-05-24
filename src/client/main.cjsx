App = require './components/app'

config =
  url: 'http://localhost:3000/api/comments'
  pollInterval: 2000

new App(config)
  .start()
