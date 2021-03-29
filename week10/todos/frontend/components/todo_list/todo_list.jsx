// file to house the presentational component:
import React from 'react'
import TodoForm from './todo_form'
import TodoListItem from './todo_list_item'

export default ({todos, receiveTodo, removeTodo}) =>{
 return  ( 
   <div>
 <h3>Todo List goes here!</h3>
    <ul>
      <TodoListItem todos={todos} removeTodo ={removeTodo} />
    </ul>
    <TodoForm receiveTodo={receiveTodo} />
  </div>
  )
}