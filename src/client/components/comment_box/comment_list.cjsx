React   = require 'react'
Comment = require './comment'


module.exports =
class CommentList extends React.Component
  render: =>
    commentNodes = @props.data.map (comment) ->
      <Comment author={comment.author}>
          {comment.text}
      </Comment>
    <div className="commentList">
        {commentNodes}
    </div>
