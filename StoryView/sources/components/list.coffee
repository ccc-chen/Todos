import { prefixDom } from 'cfx.dom'
import React, { Component } from 'react'
import {
  List
  Checkbox
  SwipeAction
  Modal
} from 'antd-mobile'

{
  prompt
  alert
} = Modal

CheckboxItem = Checkbox.CheckboxItem

CFX = prefixDom {
  List
  SwipeAction
  CheckboxItem
  # prompt
}

class list extends Component
  
  render: ->

    {
      c_List
      c_CheckboxItem
      c_SwipeAction
    } = CFX                                
    
    hasClick =
      if @props.hasClick?
      then @props.hasClick
      else (hasClick) =>
        console.log 'pls run hasClick function!'
        console.log hasClick
        
    onChange = (val) ->
      hasClick val

    onPressEdit = () ->
      prompt(
        'defaultValue'
        'defaultValue for prompt'
        [
            text: 'Cancel'
          ,
            text: 'Submit'
            onPress: (value) => console.log "输入的内容:#{value}"
        ]
        'default'
        '100')

    onPressDelete = () ->
      alert(
        'Delete'
        'Are you sure???'
        [
          text: 'Cancel'
          onPress: () => console.log('cancel')
        ,  
          text: 'Ok'
          onPress: () => console.log('ok')
        ]
      )
    
    styleComp = (isClick) ->
      textDecorationLine: 'line-through' if isClick is true
        

    c_List.apply @, [
      renderHeader: ' '
      className: 'my-list'
      (
        @props.data.reduce (r, c) =>
          [
            r...
            c_SwipeAction
              right: [
                text: '编辑'
                onPress: onPressEdit
                style:
                  background: '#ddd'
                  color: 'white'
              ,
                text: '删除'
                onPress: onPressDelete
                style:
                  background: '#F4333C'
                  color: 'white'
              ]
            ,
            c_CheckboxItem
              key: c.value
              style:
                styleComp @props.isClick
              onChange: () -> onChange(c.value)
              defaultChecked: false
            , c.label
          ]
        , []
      )...
    ]


export default list