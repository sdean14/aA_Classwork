import React from 'react'
import Board from './board'
import * as Mindsweeper from '../minesweeper'

export default class Game extends React.Component {
    constructor(props){
        super(props);
        this.state ={
            board : new Mindsweeper.Board(9, 6)
            // tile : new Tile( board, pos)
        }
        this.updateGame = this.updateGame.bind(this);
    }
    
    updateGame(){
        // this.setState({ board: new Board() })   
    }
    
    
    render(){

        
        return(
            
            <div>
                <Board
                    board ={this.state.board}
                    updateGame = {this.updateGame}
                />
            </div>
        )
    }



}