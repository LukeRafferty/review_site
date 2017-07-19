import RestaurantIndexTile from '../../src/Components/RestaurantIndexTile'
import { mount } from 'enzyme'
import React from 'react'

describe('RestaurantIndexTile', () => {
  let name,
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <RestaurantIndexTile
        name="Archie's"
      />
    )
  })

  it('should render a p tag', () => {
    expect(wrapper.find('p').length).toEqual(1);
  })

  it('should render the correct text', () => {
    expect(wrapper.find('p').text()).toBe("Archie's")
  })

})
