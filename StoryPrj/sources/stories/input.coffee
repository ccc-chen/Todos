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

    c_Todos
      Packet: (bool, data) ->
        console.log 'hello'
        data = store.store.getState().todosRedux.todos   
        newTemp = []
        data.reduce (r, c, _index, array) =>
          if c.isCompleted is bool
            temp = JSON.parse JSON.stringify array
            newTemp.push temp[_index]
          newTemp
        , null