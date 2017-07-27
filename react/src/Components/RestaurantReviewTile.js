import React, { Component } from 'react'
import UpvoteTile from './UpvoteTile'
import DownvoteTile from './DownvoteTile'

class RestaurantReviewTile extends Component {
  constructor(props) {
    super(props)
    this.state = {
      totalVotes: 0,
      isUpvote: undefined
    }
    this.upvote = this.upvote.bind(this)
    this.downvote = this.downvote.bind(this)
    this.tallyVotes = this.tallyVotes.bind(this)
    this.deleteReview = this.deleteReview.bind(this)
  }


  upvote() {
    fetch(`/api/v1/votes`, {
      method: "POST",
      credentials: "same-origin",
      body: JSON.stringify({ review_id: this.props.id, up_down: true })
    }).then(response => {
      return(response.json())
    }).then(response => {
      this.setState({ isUpvote: "y" })
    });
  }

  downvote() {
    fetch(`/api/v1/votes`, {
      method: "POST",
      credentials: "same-origin",
      body: JSON.stringify({ review_id: this.props.id, up_down: false })
    }).then(response => {
      return(response.json())
    }).then(response => {
      this.setState({ isUpvote: "n" })
    });
  }

  tallyVotes() {
    let tally = 0;
    this.props.votes.forEach(vote => {
      if (vote.up_down) {
        tally += 1;
      } else {
        tally -=1;
      }
    })
    this.setState({
      totalVotes: tally
    })
  }


  deleteReview(id) {
    fetch(`/api/v1/reviews/${id}`, {
      method: "DELETE",
      credentials: "same-origin"
    }).then(response => {
      console.log(response);
    })

  }

  componentDidMount() {
    this.tallyVotes()
  }

  render() {
    //highlighting for votes
    let upvoteSelected = "";
    let downvoteSelected = "";
    let selected = this.state.isUpvote;

    if (selected === "y") {
      upvoteSelected = "upvote-selected"
      downvoteSelected = ""
    } else if (selected === "n") {
      upvoteSelected = ""
      downvoteSelected = "downvote-selected"
    }

    let totalVotes = this.state.totalVotes

    let destroy = () => {
      this.deleteReview(this.props.id)
    }

    return(
      <div className="panel"  id="descriptionBox">
        <div>
          {totalVotes}
        </div>
        <div className="text-center row">
          <div className='small-3 columns'>

            <UpvoteTile
              upvote={this.upvote}
              selected={upvoteSelected}
            />
          </div>

          <div className='small-6 columns'>
            <div className="text-center">
              <p>{this.props.rating}</p>
            </div>
            <div>
              <p>{this.props.body}</p>
            </div>
          </div>

          <div className='small-3 columns'>
            <DownvoteTile
              downvote={this.downvote}
              selected={downvoteSelected}
            />
          </div>
          <div className="button">
            <button onClick{destroy}>Delete</button>
          </div>
        </div>
      </div>
    )
  }

}


export default RestaurantReviewTile
