import React, { Component } from 'react'
import RestaurantShowTile from '../Components/RestaurantShowTile'
import RestaurantReviewTile from '../Components/RestaurantReviewTile'

class RestaurantShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    }
  }

  componentDidMount() {
    fetch(`/api/v1/restaurants/${this.props.match.params.id}`)
    .then(response => {
      return( response.json() )
    })
    .then(reviews => {
      console.log('set state');
      console.log(reviews);
      this.setState({
        reviews: reviews.reviews
      })
    })
  }

  render() {
    console.log('log state');
    console.log(this.state);

    let reviews = this.state.reviews.map(review => {
      return(
        <RestaurantReviewTile
          id={review.id}
          key={review.id}
          rating={review.rating}
          body={review.body}
          votes={review.votes}
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
