import dd from 'ddeyes'
import 'shelljs/make'

import { store } from '../../source'

{
  constants
  actions
  reducers
  getStore
} = store

# subscriber = (
#   prevState
#   nextState
#   action
#   dispatch
# ) ->
  # dd @getState()

target.static = ->
  dd {
    constants
    actions
  }

target.reducers = ->

  myStore = getStore {
    appName: 'todosApp'
    reducers
    subscriber:
      sync: ->
        dd myStore.getState()
  }

  # dd myStore.getState()

  myStore.dispatch actions.filterSave
    filter: '1'

  # myStore.onsubscribe()

