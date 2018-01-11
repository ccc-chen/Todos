import queryString from 'query-string'

import {
  models
  services as getTodosServ
} from 'ReduxServ'

{ reducers } = models

getEffects = models.effects

effects = getEffects
  type: {
    'todoCreate'
    'todoDelete'
    'todoUpdate'
    'todoFetchAll'
  }
  service: getTodosServ 'api'

export default {
  namespace: 'todos'

  state:
    filter: ''
    todos: ''

  reducers
  effects

  subscriptions:
    setup: ({
      dispatch
      history
    }) ->
      history.listen({ pathname, search }) =>
        query = queryString.parse search
        if pathname is './todos'
          dispatch
            type: 'todoFetchAll'
            payload: query
}
  