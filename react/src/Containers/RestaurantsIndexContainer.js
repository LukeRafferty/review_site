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

    let restaurants = this.state.restaurants.map(r => {
      return(
        <RestaurantIndexTile
          key={r.id}
          id={r.id}
          name={r.name}
        />
      )
    })

    return(
      <div>
        <h1> Burgr Joints </h1>
        {restaurants}
      </div>
    )
  }
}

export default RestaurantsIndexContainer;
