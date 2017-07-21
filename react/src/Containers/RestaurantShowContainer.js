import React, { Component } from 'react'
import RestaurantShowTile from '../Components/RestaurantShowTile'
import RestaurantReviewTile from '../Components/RestaurantReviewTile'

class RestaurantShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      restaurant: {},
      reviews: []
    }
  }

  componentDidMount() {
    fetch(`/api/v1/restaurants/${this.props.match.params.id}`)
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
    console.log(this.state);
    let reviews = this.state.reviews.map(review => {

      return(

        <RestaurantReviewTile
          key={review.id}
          rating={review.rating}
          body={review.body}
        />
      )
    })

    return(
      <div>
        {reviews}
      </div>
    )
  }
}

export default RestaurantShowContainer;
