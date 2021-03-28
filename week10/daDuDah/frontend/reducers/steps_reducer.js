import { RECEIVE_DADU } from "../actions/dadudah_actions";
import {
  RECEIVE_STEPS,
  RECEIVE_STEP,
  REMOVE_STEP,
} from "../actions/step_actions";

const initial = {
  1: {
    // this is the step with id = 1
    id: 1,
    title: "walk to store",
    done: false,
    todo_id: 1,
  },
  2: {
    // this is the step with id = 2
    id: 2,
    title: "buy soap",
    done: false,
    todo_id: 1,
  },
};

const stepsReducer = (state = initial, action) => {
  Object.freeze(state);
  const nextState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_STEPS:
      let newSteps = {};
      for (let i = 0; i < action.steps.length; i++) {
        newSteps[action.steps[i].id] = action.step[i];
      }
      return newSteps;

    case RECEIVE_STEP:
      nextState[action.steps.id] = action.steps.id;
      return nextState;

    case REMOVE_STEP:
      delete nextState[action.steps.id];
      return nextState;

    default:
      return state;
  }
};

export default stepsReducer;
