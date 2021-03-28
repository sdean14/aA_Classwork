import { RECEIVE_DADUS, RECEIVE_DADU, REMOVE_DADU } from '../actions/dadudah_actions'

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

const dadusReducer = (state = initialState, action) => {
  Object.freeze(state);
  const nextState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_DADUS:
      let newList = {};
      for (let i = 0; i < action.dadus.length; i++) {
        newList[action.dadus[i].id] = action.dadus[i] 
      }
      return newList;
    case RECEIVE_DADU:
      nextState[action.dadu.id] = action.dadu;
      return nextState;
    case REMOVE_DADU:
      delete nextState[action.dadu.id];
      return nextState;
    default:
      return state;
  }
};

export default dadusReducer;