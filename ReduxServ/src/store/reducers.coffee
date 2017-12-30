import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import dd from 'ddeyes'

import { mergeReduce } from 'cfx.redux'
import todosReducers from '../models/reducers'
import { store } from 'todosRedux'

{ todos } = store

initialState = {
  todos: store.initialState.todos
  filter: 'all'
}

todosFilter = handleActions

  FILTER_SAVE: todosReducers.save

, initialState.filter

export default mergeReduce {
  todos
  filter: todosFilter
}
, initialState
