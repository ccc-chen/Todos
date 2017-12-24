import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'


import ListHave from '../../components/list'

CFX = prefixDom {
  ListHave
}

export default ->

  storiesOf 'TodosState', module

  .add 'Have'

  , =>

    {
      c_ListHave
    } = CFX

    c_ListHave
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
      str: ''
      
      hasClick: (str) ->
        console.log 'key:'
        console.log str                                                                                                                                                
