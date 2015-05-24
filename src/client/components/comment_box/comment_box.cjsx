request     = require 'superagent'
React       = require 'react'
CommentList = require './comment_list'
CommentForm = require './comment_form'

module.exports =
class CommentBox extends React.Component
  state:
    data: []

  loadCommentsFromServer: =>
    request
      .get @props.url
      .end (err, res) =>
        if err then return console.error @props.url, status, err.toString()
        @setState data: res.body

  handleCommentSubmit: (comment) =>
    request
      .post @props.url
      .set 'Content-Type', 'application/json'
      .send comment
      .end (err, res) =>
        if err then console.error @props.url, status, err.toString()
        @loadCommentsFromServer()

  componentDidMount: =>
    @loadCommentsFromServer()
    setInterval @loadCommentsFromServer, @props.pollInterval

  render: =>
    <div className="commentBox">
        <h1>Comments</h1>
        <CommentList data={@state.data} />
        <CommentForm onCommentSubmit={@handleCommentSubmit} />
    </div>
