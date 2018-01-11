import { prefixDom } from 'cfx.dom'
import Title from './title'
import Input from './input'
import List from './list'

CFX = prefixDom {
  'div'
  Title
  Input
  List
}

export default ->

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