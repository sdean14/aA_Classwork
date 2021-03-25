import React from 'react'
import Game from './game'
import Board from './board'

export default class Tile extends React.Component{ 
    constructor(props){ 
        super(props)
        this.state = {
            selectedTile : 'unrevealed'
        };
        this.selectTile = this.selectTile.bind(this);
    }

    selectTile(statusT){
        this.setState({ selectedTile: statusT})
    }
  

    render(){ 
      
        return( 
            <div className='tile' 
            onClick={() => this.selectTile(idx2)}>

                <p>T</p>
            </div>
        )
    }
} 