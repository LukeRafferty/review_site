import RestaurantShowTile from '../../src/Components/RestaurantShowTile'
import { mount } from 'enzyme'
import React from 'react'

describe('RestaurantShowTile', () => {
  let name,
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <RestaurantShowTile
        name="Archie's"
      />
    )
  })

  it('should render an h1 tag', () => {
    expect(wrapper.find('h1').length).toEqual(1);
  })

  it('should have a name prop', () => {
    expect(wrapper.find(RestaurantShowTile)).toHaveProp('name')
  })

})
