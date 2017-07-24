import RestaurantReviewTile from '../../src/Components/RestaurantReviewTile'
import { mount } from 'enzyme'
import React from 'react'

describe('RestaurantReviewTile', () => {
  let name,
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <RestaurantReviewTile
        rating="5"
        body="very delicious"
      />
    )
  })

  it('should render a 2 p tags', () => {
    expect(wrapper.find('p').length).toEqual(4);
  })

  it('should have a body prop', () => {
    expect(wrapper.find(RestaurantReviewTile)).toHaveProp("body");
  })
  it('should have a rating prop', () => {
    expect(wrapper.find(RestaurantReviewTile)).toHaveProp("rating");
  })

})
