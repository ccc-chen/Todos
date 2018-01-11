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