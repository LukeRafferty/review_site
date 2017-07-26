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



    return(
      <div className="panel">
        <div>
          {totalVotes}
        </div>
        <div>
          <UpvoteTile
            upvote={this.upvote}
            selected={upvoteSelected}
          />
          <DownvoteTile
            downvote={this.downvote}
            selected={downvoteSelected}
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
