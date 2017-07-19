import React from 'react'
import {
  BrowserRouter as Router,
  Route,
  Link
} from 'react-router-dom'

import Homepage from './Homepage'

import RestaurantsIndexContainer from './RestaurantsIndexContainer'
import RestaurantShowContainer from './RestaurantShowContainer'
import RestaurantsNewContainer from './RestaurantsNewContainer'
import RestaurantEditContainer from './RestaurantEditContainer'

import RestaurantNewReviewContainer from './RestaurantNewReviewContainer'
import RestaurantEditReviewContainer from './RestaurantEditReviewContainer'

const App = props => {
  return(
    <Router>
      <div>

      <Route exact path='/' component={Homepage} />

      <Route exact path='/restaurants' component={RestaurantsIndexContainer} />
      <Route exact path='/restaurant/:id' component={RestaurantShowContainer} />

      </div>
    </Router>
  )
}



export default App

// to be added
// <Route exact path='/restaurants/new' component={RestaurantsNewContainer} />
// <Route exact path='/restaurants/:id/edit' component={RestaurantEditContainer} />
//
// <Route exact path='restaurants/:restaurant_id/reviews/new' component={RestaurantNewReviewContainer} />
// <Route exact path='restaurants/:restaurant_id/reviews/:id/edit' component={RestaurantEditReviewContainer} />
