
import React from 'react'
import {Board} from '../minesweeper'

export default class Game extends React.Component {
    constructor(props){
        super(props);
        this.state ={
            board : new Board(9, 6)
        }
        this.updateGame = this.updateGame.bind(this);
    }
    
    updateGame(){
        this.setState({ board: new Board() })   
    }
    
    
    render(props){
        debugger
        
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