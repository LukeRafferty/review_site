import React from 'react'

const DownvoteTile = props => {
  return(
    <div className={`panel ${props.selected}`} onClick={props.downvote}>
      <p>DownvoteTile</p>
    </div>
  )
}

export default DownvoteTile
