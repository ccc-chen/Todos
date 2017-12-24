import { prefixDom } from 'cfx.dom'
import {
  List
  Checkbox
  SwipeAction
} from 'antd-mobile'

{ CheckboxItem } = Checkbox

CFX = prefixDom {
  List
  SwipeAction
  CheckboxItem
}

export default ->

  {
    c_List
    c_CheckboxItem
    c_SwipeAction
  } = CFX

  c_List
    renderHeader: ' '
    className: 'my-list'
  ,
    c_SwipeAction
      right: [
        text: 'Cancel'
        style:
          background: '#ddd'
          color: 'white'
      ,
        text: 'delete'
        style:
          background: '#F4333C'
          color: 'white'
      ]
    ,
      c_CheckboxItem
        value: '0'
        label: '完成'
        defaultChecked: true
      , '完成'
    c_SwipeAction
      right: [
        text: 'Cancel'
        style:
          background: '#ddd'
          color: 'white'
      ,
        text: 'delete'
        style:
          background: '#F4333C'
          color: 'white'
      ]
    ,
      c_CheckboxItem
        style:
          color: 'red'
          textDecorationLine: 'line-through'
        value: '1'
        label: '完成'
        defaultChecked: false
      , '完成'