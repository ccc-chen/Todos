import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'
import 'antd-mobile/dist/antd-mobile.css'
import Input from '../components'
import { Provider } from 'cfx.react-redux'
import { store } from 'ReduxServ'

todosStore = store.store

CFX = prefixDom {
  Input
  Provider
}


export default ->

  storiesOf 'Todos', module

  .addDecorator (story) ->

    { c_Provider } = CFX
    c_Provider
      store: todosStore
    , story()  
  .add 'Input'

  , =>

    {
      c_Input
    } = CFX

    c_Input {}
      

          