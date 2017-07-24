import React from 'react'

const RestaurantIndexTile = props => {
  return(
    <div className={'row small-8 columns small-offset-2 index-container end'}>
      <div className={'row'}>
        <div className={'small-9 columns index-link-and-info-container'}>
          <h3 className={'index-link'}><a href={`/restaurants/${props.id}`}>{props.name}</a></h3>
          <div className={'row index-info'}>
            <p>Address: {props.address}</p>
            <p>Description: {props.description}</p>
          </div>
        </div>
        <div className={'small-3 columns'}>
          <img  className={'index-image'} src={props.img}/>
        </div>
      </div>
    </div>
  )
}

export default RestaurantIndexTile;
