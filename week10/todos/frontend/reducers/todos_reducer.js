import {RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions'

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);
    //this makes shallow copy

    switch (action.type) {
      case RECEIVE_TODOS:
        let newList = {};
        for (let i = 0; i < action.todos.length; i++) {
          newList[action.todos[i].id] = action.todos[i]; 
        }
        return newList;
      case RECEIVE_TODO:
        nextState[action.todo.id] = action.todo; 
        return nextState;
      case REMOVE_TODO:
        delete nextState[action.todo.id]; 
        return nextState
      default:
        return state;
    }
  };
  
  export default todosReducer;