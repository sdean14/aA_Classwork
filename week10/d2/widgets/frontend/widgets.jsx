import React from 'react';
import ReactDOM from 'react-dom';
import Root from './root'

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root/>,root);
})
//this is entry point and thats all it does.
//this gets html's <div id='root'></div>  id root,
//we want to keep this file small and clean, so we create root.jsx file,
//this file cllect all the info of all other files 