import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'
import 'antd-mobile/dist/antd-mobile.css'
import Todos from '../components'
import { Provider } from 'cfx.react-redux'
import { store } from 'ReduxServ'

todosStore = store.store

CFX = prefixDom {
  Todos
  Provider
}


export default ->

  storiesOf 'Todos', module

  .addDecorator (story) ->

    { c_Provider } = CFX
    c_Provider
      store: todosStore
    , story()  
  .add 'Todos'

  , =>

    {
      c_Todos
    } = CFX

    c_Todos {}
      

          