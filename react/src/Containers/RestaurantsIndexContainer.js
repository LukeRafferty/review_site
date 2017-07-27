import React, { Component } from 'react'
import RestaurantIndexTile from '../Components/RestaurantIndexTile'

class RestaurantsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      restaurants: []
    }
  }

  componentDidMount() {
    fetch(`/api/v1/restaurants`)
    .then(response => {
      return response.json()
    })
    .then(response => response.restaurants)
    .then(restaurants => {
      this.setState({restaurants})
    })
  }
  render() {

    let restaurants = this.state.restaurants.map(restaurant => {
      return(
        <RestaurantIndexTile
          key={restaurant.id}
          id={restaurant.id}
          name={restaurant.name}
          address={restaurant.address}
          description={restaurant.description}
          img={"#"}
        />
      )
    })

    return(
      <div>
        <h1 className={'burgr_joints'}> Burgr Joints </h1>
        <div>
          {restaurants}
        </div>
      </div>
    )
  }
}

export default RestaurantsIndexContainer;
