import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import dd from 'ddeyes'

import { mergeReduce } from 'cfx.redux'
import todosReducers from '../models/reducers'
import { store } from 'todosRedux'
{ todos } = store

initialState =
  filter: 'active'

todosFilter = handleActions

  FILTER_SAVE: todosReducers.save

, initialState

export default mergeReduce {
  todos
  todosFilter
}
, initialState
