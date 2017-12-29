import dd from 'ddeyes'
import 'shelljs/make'

import { store } from 'ReduxServ'

{ 
  actions 
  reducers
  getStore
} = store

target.all = ->
  # dd 'Hello'

  myStore = getStore {
    appName: 'todosApp'
    reducers
    subscriber:
      sync: ->
        dd myStore.getState()
  }

  dd myStore.getState()

  myStore.dispatch actions.todosCreate
    todo: 'hello'

  dd myStore.getState()