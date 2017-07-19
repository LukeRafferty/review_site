import React from 'react'

const RestaurantReviewTile = props => {
  return(
    <div>
      <p>{props.rating}</p>
      <p>{props.body}</p>
    </div>
  )
}


export default RestaurantReviewTile
