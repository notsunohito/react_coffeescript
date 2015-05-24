React = require 'react'
CommentBox = require './comment_box/comment_box'

module.exports =
class App

  constructor: (config)->
    @url = config.url
    @pollInterval = config.pollInterval

  start: ()->
    React.render <CommentBox url=@url pollInterval=@pollInterval />, document.getElementById 'app'
