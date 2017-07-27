import React from 'react'

const RestaurantIndexTile = props => {
  return(
    <div className={'row small-8 columns small-centered index-container'}>
      <div className={'row'}>
        <div className={'index-link-and-info-container'}>
          <h3 className={'restaurant_link'}><a href={`/restaurants/${props.id}`}>{props.name}</a></h3>
          <div className={'index-info'}>
            <p>Address: {props.address}</p>
            <p>Description: {props.description}</p>
          </div>
        </div>
      </div>
    </div>
  )
}

export default RestaurantIndexTile;
