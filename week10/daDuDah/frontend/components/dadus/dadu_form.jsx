import React from 'react';

class DaduForm extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      id: Math.floor(Math.random()*100000000),
      title: '',
      body: ''
    }
   this.handleSubmit = this.handleSubmit.bind(this);
   this.updateTitle = this.updateTitle.bind(this);
   this.updateBody = this.updateBody.bind(this);
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.receiveDadu(this.state)
    this.setState({
      id: Math.floor(Math.random()*100000000),
      title: '',
      body: ''
    })
  }

  updateTitle(e){
    this.setState({ title: e.target.value})
  }
  
  updateBody(e){
    this.setState({ body: e.target.value})
  }


  render(){
    return(
      <div>
        <form onSubmit={this.handleSubmit}>
          <label>Title:
            <input type="text" value={this.state.title} onChange={this.updateTitle}/>
          </label>
          <label>Body:
            <textarea value={this.state.body} onChange={this.updateBody}/>
          </label>
          <input type="submit" value="add dadu"/>
        </form>
        
      </div>
      )
    }
      
}
export default DaduForm;