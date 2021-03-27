import React from 'react'
import TodoListContainer from './todo_list/todo_list_container'
import TodoForm from './todo_list/todo_form'
const App = ()=> {
    return (
        <div>
            <h1>im app file</h1>
            <TodoListContainer />
            <TodoForm />
        </div>
    )
}

export default App;