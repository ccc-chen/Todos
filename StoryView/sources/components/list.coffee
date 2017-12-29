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

    Delete =
      if @props.Delete?
      then @props.Delete
      else (Delete) =>
        console.log 'pls run Delete function!'
        console.log Delete
        
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
    
    onPressDelete = (id) ->
      # console.log 'props', pro      
      alert(
        'Delete'
        'Are you sure???'
        [
          text: 'Cancel'
          onPress: () => console.log('cancel')
        ,  
          text: 'Ok'
          onPress:() => DeletePress(id)
        ]
      )
    
    DeletePress = (id) ->
      Delete id
      


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
                onPress: () -> onPressDelete(c.id)
                style:
                  background: '#F4333C'
                  color: 'white'
              ]
            ,
            c_CheckboxItem
              id: c.id
              style:
                styleComp @props.isClick
              onChange: () -> onChange(c.id)
              defaultChecked: false
            , c.todo
          ]
        , []
      )...
    ]


export default list