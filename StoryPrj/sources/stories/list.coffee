import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'
import 'antd-mobile/dist/antd-mobile.css'
import List from '../components/list'
import { Provider } from 'cfx.react-redux'
import { store } from 'ReduxServ'

todosStore = store.store
{ actions } = store
console.log store.actions

CFX = prefixDom {
  List
  Provider
}


export default ->

  storiesOf 'Todos', module

  .addDecorator (story) ->

    # todosStore.dispatch store.actions.todosCreate
    #   id: 1
    #   todo: '123'
    #   isCompleted: false

    { c_Provider } = CFX
    c_Provider
      store: todosStore
    , story()

  # .add 'Input'

  .add 'List'
  , =>

    {
      c_List
    } = CFX

    c_List {}

  # .add 'App'
