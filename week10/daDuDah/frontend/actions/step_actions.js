export RECEIVE_STEPS = 'RECEIVE_STEPS';
export RECEIVE_STEP = 'RECEIVE_STEP';
export REMOVE_STEP = 'REMOVE_STEP';

export const receiveSteps = (steps) => {
  return {
    type: RECEIVE_STEPS,
    steps,
  }
}

export const receiveStep = (step) => {
  return {
    type: RECEIVE_STEP,
    step,
  }
}

export const removeStep = (step) => {
  return {
    type: REMOVE_STEP,
    step,
  }
}