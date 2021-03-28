import React from 'react'
import ReactDom from 'react-dom'
import configureStore from './store/store'
import {receiveDadu} from './actions/dadudah_actions'

document.addEventListener("DOMContentLoaded", () =>{
  const hi = <h1>i am g..rooot</h1>
  const root = document.getElementById('root');
 
  ReactDom.render(hi, root);
})
console.log('toto')


const store = configureStore();
window.store = store;
window.receiveDadu = receiveDadu;