import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './Containers/App'

$(function() {
  ReactDOM.render(
    <App />,
    document.getElementById('app')
  );
});

//change the h3 to <App/> to enable react!
