// Provider lets components access Redux store
import React from 'react';
import  { Provider } from 'react-redux';
import App from './app';

const Root = ({ store }) => {
  return(
    <Provider store={store}>
      <App />
    </Provider>
  )  
};


export default Root;