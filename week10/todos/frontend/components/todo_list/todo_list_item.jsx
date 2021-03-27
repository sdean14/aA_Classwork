import React from 'react'


export const TodoListItem = (props) => {
    return (
        <ul>
            <li>{props.todo.title}</li>
        </ul>
    )
}

