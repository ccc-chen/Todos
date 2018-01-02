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
          value: 0
          label: '完成1'
        ,
          value: 1
          label: '完成2'
      ]
      
      creatList: (data) ->
        console.log 'hello'
        
      isClick: true
      str: ' '
      
      hasClick: (str) ->
        console.log 'key:'
        console.log str    


