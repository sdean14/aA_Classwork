import React from 'react';

class TodoForm extends React.Component {
    constructor(props){
        super(props)

        this.state = {
            id: Math.floor(Math.random()*1000),
            title: "",
            body: "",
            done: false
        }
        this.updateTitle = this.updateTitle.bind(this)
        this.updateBody = this.updateBody.bind(this)
        this.updateDone = this.updateDone.bind(this)
    }

    updateTitle(e){
        this.setState({title: e.target.value})
    }

    updateBody(e){
        this.setState({body: e.target.value})
    }

    updateDone(e){
        this.setState({done: e.target.value})

    }

    handleSubmit(e){
        e.preventDefault();
        this.props.receiveTodo(this.state)
        this.setState({
            id: Math.floor(Math.random()*1000),
            title: "",
            body: "",
            done: false  
        })
    }

    render(){

        return(
            <form onSubmit={this.handleSubmit}>
                <h1>*.\\ All The Todos //.*</h1>
                <label>Title:
                    <input type="text" value={this.state.title} onChange={this.updateTitle}/>
                </label>
                <label>Body:
                    <textarea value={this.state.body} onChange={this.updateBody}/>
                </label>
                <label>Complete?
                    <div onChange={this.updateDone}>
                        <input type="radio" value="true" name="done" /> True
                        <input type="radio" value="false" name="done" /> False
                    </div>
                </label>
                <input type="submit" value="Add Todo!"/>
            </form>
        )
    }
}
export default TodoForm;