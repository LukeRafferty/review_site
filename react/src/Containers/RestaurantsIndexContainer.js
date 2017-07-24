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
          address={r.address}
          description={r.description}
          img={"https://pbs.twimg.com/profile_images/694921357864386563/p0nF8Bj8.jpg"}
        />
      )
    })

    return(
      <div>
        <h1 className={'text-center'}> Burgr Joints </h1>
        <div>
          {restaurants}
        </div>
      </div>
    )
  }
}

export default RestaurantsIndexContainer;
