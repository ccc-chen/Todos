import dd from 'ddeyes'
import 'shelljs/make'

import { 
  store
} from '../../src'

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

target.all = ->
  dd store

target.static = ->
  dd {
    constants
    # actions
  }

target.reducers = ->

  myStore = getStore {
    appName: 'todosApp'
    reducers
    subscriber:
      sync: ->
        dd myStore.getState()
  }

  dd myStore.getState()

  # myStore.dispatch actions.todosCreateOne
  #   todo:
  #     objectId: 1
  #     company: '武汉举手帮租有限公司'
  #     main: '旅游、租房'
  #     location: '武汉'

  myStore.dispatch actions.filterSave
    filter: 'Hello World'

  # myStore.dispatch actions.filterSave
  #   filter: 'Hello World!!!'

  # myStore.onsubscribe()

