import React from 'react'

const UpvoteTile = props => {
  return(
    <div className={`panel ${props.selected}`} onClick={props.upvote}>
      <p>UpvoteTile</p>
    </div>
  )
}

export default UpvoteTile
