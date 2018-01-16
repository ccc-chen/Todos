import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'
import 'antd-mobile/dist/antd-mobile.css'
import List from '../components/Todos/list'
import Input from '../components/Todos/input'
import { Title } from 'StoryView'
import { Provider } from 'cfx.react-redux'
import { store } from 'ReduxServ'
todosStore = store.store
{ actions } = store


CFX = prefixDom {
  'div'
  Title
  Input
  List
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

  .add 'List'
  , =>

    {
      c_List
    } = CFX

    c_List {}

  .add 'App'
  , =>

    {
      c_div
      c_Title
      c_Input
      c_List
    } = CFX

    c_div {}
    ,
      c_Title {}
      c_Input {}
      c_List {}
