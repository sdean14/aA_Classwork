import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP} from '../actions/step_actions'

const stepsReducer = (state = {}, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);

    switch(action.type) {
        case RECEIVE_STEPS:
            let newLists = {}
            for (let i = 0; i < action.steps.length; i++) {
               newLists[action.steps[i].id] = action.steps[i]                
            }
            return newLists;
        case RECEIVE_STEP:
            nextState[action.step.id] = action.step;
            return nextState;
        case REMOVE_STEP:
            delete nextState[action.step.id];
            return nextState;
        default:
            return state;
    }

}

export default stepsReducer;