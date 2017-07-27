import React from 'react'

const DownvoteTile = props => {
  return(
    <button className={`panel ${props.selected}`} onClick={props.downvote}>
      Downvote
    </button>
  )
}

export default DownvoteTile
