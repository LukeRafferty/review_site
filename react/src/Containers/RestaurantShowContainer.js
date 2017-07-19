import React, { Component } from 'react'

class RestaurantShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      restaurant: {}
      reviews: []
    }
  }

  componentDidMount() {
    fetch(`/api/v1/restaurants/${this.props.params.id}`)
    .then(response => {
      return response.json()
    })
    .then(response => response.restaurant)
    .then(restaurant => {
      let reviews = restaurant.reviews
      this.setState({
        restaurant,
        reviews
      })
    })
  }

  render() {
    return(
      <p> nope </p>
    )
  }
}

export default RestaurantShowContainer;
