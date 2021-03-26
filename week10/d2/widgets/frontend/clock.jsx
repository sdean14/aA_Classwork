import React from 'react';

class Clock extends React.Component {
    constructor(props){
        super(props);

        this.state = {
            time: new Date()
        }
        this.tick = this.tick.bind(this)
    }
    tick() {
        this.setState({ time: new Date() })
        
    }
    
    componentDidMount(){
      this.timerId = setInterval(this.tick, 1000)   
      //this has to be () =>  this.tick(), 1000
      // or setInterval( this.tick, 1000)  ...dont envoke callback
    }  

    componentWillUnmount() {
        clearInterval(this.timerId);
    }

    render(){
        let hours = this.state.time.getHours();
        let minutes = this.state.time.getMinutes(); 
        let seconds = this.state.time.getSeconds();

        return(
            <div>
            <h1 className='boxtitle'>Clock</h1>
            <div className='clock'>
              <p><span>Time:</span>
                 <span>
                   {hours}:{minutes}:{seconds} PDT
                 </span>
              </p>
              <p><span>Date:</span> 
                <span>
                    {this.state.time.toDateString()}
                </span>
              </p>

            </div>
          </div>          
        );          
    }
}

export default Clock;