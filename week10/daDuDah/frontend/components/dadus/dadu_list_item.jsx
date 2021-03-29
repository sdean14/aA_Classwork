import React from 'react';
import { render } from 'react-dom';


 export const DaDuListItem = (dadus) => { 
  return(
    dadus.dadus.map((dadu) => <li key={dadu.id}> {dadu.title} >
   <button type="submit" onClick={() => dadus.removeDadu(dadu)}>Delete Dadu</button>
   </li>
   )
   )   
}

//   class DaDuListItem extends React.Component {
//     constructor(props){
//       super(props);      
//     } 
//         render(){
//           return(      
//             this.props.dadus.map((dadu) =>  <li key={dadu.id}> {dadu.title}
//         <button type="submit" onClick={() => this.props.removeDadu(dadu)}>Delete Dadu</button>
//        </li>
//        )   
//        )     
//   }
// }

 export default DaDuListItem;