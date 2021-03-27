import React from 'react';
import { Provider } from 'react-redux';
// Provider gives all of components the potential to access store,
// allowing them to read the application state and dispatch actions
import App from './app'

const Root = ({ store }) => (
    <Provider store={store}>
      <App />
    </Provider>
  );

export default Root;