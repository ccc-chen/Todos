import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'
import 'antd-mobile/dist/antd-mobile.css'
import Input from '../components/input'

CFX = prefixDom {
  Input
}

export default ->

  storiesOf 'Todos', module

  .add 'Input'

  , =>

    {
      c_Input
    } = CFX

    c_Input
      filter: 'all'
      selector: (filter) ->
        console.log filter
      onBlur: (v) ->
        console.log v
      focus: (v) ->
        console.log v
