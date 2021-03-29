//I am the presentational component
import React from 'react';
import DaDuListItem from './dadu_list_item'
import DaduForm from './dadu_form'

export default ({dadus, receiveDadu, removeDadu}) => {
  // console.log(receiveDadu)
  return (
    <div>
      <h3>Dadu List goes here!</h3>
        <DaDuListItem dadus={dadus} removeDadu={removeDadu}/>
        <DaduForm receiveDadu={receiveDadu} />
    </div>
  )
};

