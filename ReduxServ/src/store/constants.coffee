import { toActionsTypes } from 'cfx.redux-types'
import { store } from 'todosRedux'
import dd from 'ddeyes'

Filter = toActionsTypes {
  'FILTER_SAVE'
}
export default {
  types: {
    Filter.types...
    store.constants.types...
  }
  actions: {
    Filter.actions...
    store.constants.actions...
  }
}
