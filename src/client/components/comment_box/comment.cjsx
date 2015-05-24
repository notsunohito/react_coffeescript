React   = require 'react'
marked  = require 'marked'


module.exports =
class Comment extends React.Component
  render: =>
    rawMarkup = marked @props.children.toString(), sanitize: true
    <div className="comment">
      <h2 className="commentAuthor">
        {@props.author}
      </h2>
      <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
    </div>
