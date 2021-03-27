import React from 'react'


export const TodoListItem = ({todos}) => {
    return todos.map((todo) => <li key={todo.id}> {todo.title} </li>);
}

