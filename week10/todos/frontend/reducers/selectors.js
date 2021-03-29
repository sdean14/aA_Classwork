// Selectors are "getter" methods for the application state
// receive the state as arg and return a subset of the state data

// function to transform an object filled with todos into an array

export const allTodos = (state) => {
  return Object.values(state.todos);
};
