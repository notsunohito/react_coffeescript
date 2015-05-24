React   = require 'react'


module.exports =
class CommentForm extends React.Component
  handleSubmit: (e) =>
    e.preventDefault()
    author = React.findDOMNode(@refs.author).value.trim()
    text = React.findDOMNode(@refs.text).value.trim()
    if not text or not author then return
    @props.onCommentSubmit author: author, text: text
    React.findDOMNode(@refs.author).value = ''
    React.findDOMNode(@refs.text).value = ''

  render: =>
    <form className="commentForm" onSubmit={@handleSubmit}>
      <input type="text" placeholder="Your name" ref="author" />
      <input type="text" placeholder="Say something..." ref="text" />
      <input type="submit" value="Post" />
    </form>
