import React from 'react'

class TodoListItem extends React.Component {
    constructor(props) {
        super(props);
    }
    render() {
        return (
            this.props.todos.map((todo) => <li key={todo.id}> {todo.title}
                <button type="submit" onClick={() => this.props.removeTodo(todo)}>Delete todo</button>
            </li>
            )
        )
    }
}

//  const TodoListItem = (todos) => {
//     return( 
//         todos.todos.map((todo) => <li key={todo.id}> {todo.title}
//         <button type='submit' onClick={() => todos.removeTodo(todo)}>Delete Todo</button>
//         </li>
//     )
//     )
// }
export default TodoListItem;
