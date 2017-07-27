import React from 'react'

const UpvoteTile = props => {
  return(
    <button className={`panel ${props.selected}`} onClick={props.upvote}>
      Upvote
    </button>
  )
}

export default UpvoteTile
