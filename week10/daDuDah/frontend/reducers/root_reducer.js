import {combineReducers} from 'redux';
import dadusReducer from './dadus_reducer';

const rootReducer = combineReducers ({
  dadus: dadusReducer,
})
export default rootReducer;