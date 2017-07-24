import React from 'react'

const RestaurantIndexTile = props => {
  return(
    <div>
      <h3><a href={`/restaurants/${props.id}`}>{props.name}</a></h3>
    </div>
  )
}

export default RestaurantIndexTile;
