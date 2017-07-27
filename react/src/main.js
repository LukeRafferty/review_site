import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './Containers/App'

$(function() {
  let reactElement = document.getElementById('app')
  if (reactElement) {
    ReactDOM.render(
      <App />,
      document.getElementById('app')
    );
  }
});
