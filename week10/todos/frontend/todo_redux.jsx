import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store'
import { receiveTodos, receiveTodo, removeTodo  } from './actions/todo_actions';
import {receiveSteps, receiveStep, removeStep } from './actions/step_actions'
import App from './components/app'
import Root from './components/root'
import {allTodos} from './reducers/selectors'

document.addEventListener("DOMContentLoaded", () => {
  
  const root = document.getElementById("root");
  const todoApp = <h1>Todos App</h1>;
  // ReactDOM.render(todoApp, root);
  ReactDOM.render(<Root store={store}/>, root);

});

const store = configureStore();
window.store = store;
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.removeTodo = removeTodo;

window.receiveSteps = receiveSteps;
window.receiveStep = receiveStep;
window.removeStep = removeStep;

window.allTodos = allTodos;