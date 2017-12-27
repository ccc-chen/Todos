import { getStore } from 'cfx.redux'

import constants from './constants'
import actions from './actions'
import reducers from './reducers'
# import dd from 'ddeyes'

store = getStore {
  appName: 'todosApp'
  reducers
}

export {
  constants
  actions
  reducers
  getStore
  store
}
