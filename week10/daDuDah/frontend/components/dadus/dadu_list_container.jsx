// map the application state and the Store's dispatch
// function to a set of props that get passed to
// the presentational component.

import { connect } from "react-redux";
import daduList from "./dadu_list";
import {allDadus} from "../../reducers/selectors";
import { receiveDadu, removeDadu } from "../../actions/dadudah_actions";
//take in state
//write mapStateToProps, mapDispatchToProps
const mapStateToProps = state => {
  
  return ({
    dadus: allDadus(state),
  });
};

const mapDispatchToProps = dispatch => {
  return({
    receiveDadu: dadu => dispatch(receiveDadu(dadu)),
    removeDadu: dadu => dispatch(removeDadu(dadu))
  });
};

export default connect(mapStateToProps, mapDispatchToProps)(daduList);
