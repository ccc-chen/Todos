import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'
import 'antd-mobile/dist/antd-mobile.css'
import Input from '../../components/Todos/input'

CFX = prefixDom {
  Input
}


export default ->

  storiesOf 'TodosState', module

  .add 'Completed'

  , =>

    {
      c_Input
    } = CFX

    c_Input
      filter: 'completed' 
      selector: (filter) ->
        console.log filter
      # blur: (v) ->
      #   console.log v 
      
