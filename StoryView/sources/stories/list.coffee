import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'
import 'antd-mobile/dist/antd-mobile.css'

import List from '../components/list'

CFX = prefixDom {
  List
}

export default ->

  storiesOf 'Todos', module

  .add 'List'

  , =>

    {
      c_List
    } = CFX

    c_List
      data: [
          objectId: 0
          todo: '完成'
          isCompleted: true
        ,
          objectId: 1
          todo: '未完成'
          isCompleted: false        
      ]    
      styleChange: (
        (objectId, isCompleted) ->
          if isCompleted is true
            textDecorationLine: 'line-through'
            opacity: 0.4
        ).bind @
  
      hasClick: (str) ->
        console.log 'key:'
        console.log str
