import React, { Component } from 'react'
import UpvoteTile from './UpvoteTile'
import DownvoteTile from './DownvoteTile'

class RestaurantReviewTile extends Component {
  constructor(props) {
    super(props)
    this.state = {
      upvotes: null,
      downvotes: null
    }
    this.upvote = this.upvote.bind(this)
    this.downvote = this.downvote.bind(this)
  }


  upvote() {
    fetch(`/api/v1/votes`, {
      method: "POST",
      credentials: "same-origin",
      body: JSON.stringify({ review_id: this.props.id, up_down: true })
    }).then(response => {
      console.log(response)
      return(response.json())
    }).then(response => {
      console.log(response);
    });
  }

  downvote() {
    fetch(`/api/v1/votes`, {
      method: "POST",
      credentials: "same-origin",
      body: JSON.stringify({ review_id: this.props.id, up_down: false })
    }).then(response => {
      console.log(response)
      return(response.json())
    }).then(response => {
      console.log(response);
    });
  }

  render() {
    return(
      <div className="panel">
        <div>
          <UpvoteTile
            upvote={this.upvote}
          />
          <DownvoteTile
            downvote={this.downvote}
          />
        </div>
        <div>
          <p>{this.props.rating}</p>
          <p>{this.props.body}</p>
        </div>
      </div>
    )
  }

}


export default RestaurantReviewTile
