export const RECEIVE_DADUS = 'RECEIVE_DADUS';
export const RECEIVE_DADU = 'RECEIVE_DADU';
export const REMOVE_DADU = 'REMOVE_DADU';


export const receiveDadus = (dadus) => {
  return {
    type: RECEIVE_DADUS,
    dadus,
  };
};

export const receiveDadu = (dadu) => {
  return {
    type: RECEIVE_DADU,
    dadu,
  };
};

export const removeDadu = (dadu) => {
  return {
    type: REMOVE_DADU,
    dadu,
  };
};
