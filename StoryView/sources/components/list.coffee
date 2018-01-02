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

    Patch =
      if @props.Patch?
      then @props.Patch
      else (Patch) =>
        console.log 'pls run Patch function!'
        console.log Patch

    styleChange =
      if @props.styleChange?
      then @props.styleChange
      else (styleChange) =>
        console.log 'pls run styleChange function!'
        console.log styleChange       
        
    onChange = (id, todo, isCompleted) ->
      hasClick id, todo, isCompleted
      styleComp id,isCompleted

    DeletePress = (id) ->
      Delete id

    PatchPress = (id, todo) ->
      Patch id, todo   

      
    onPressEdit = (id, todo) ->
      console.log id, todo
      prompt(
        'defaultValue'
        'defaultValue for prompt'
        [
            text: 'Cancel'
          ,
            text: 'Submit'
            onPress: (value) => PatchPress(id, value)
        ]
        'default'
      todo)
    
    onPressDelete = (id) ->
      console.log '删除的id是:', id
      alert(
        'Delete'
        'Are you sure???'
        [
          text: 'Cancel'
          onPress: () => console.log 'cancel'
        ,  
          text: 'Ok'
          onPress:() => DeletePress id
        ]
      )

    styleComp = (id,isCompleted) ->
      styleChange id, isCompleted

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
                onPress: () -> onPressEdit c.id, c.todo
                style:
                  background: '#ddd'
                  color: 'white'
              ,
                text: '删除'
                onPress: () -> onPressDelete c.id
                style:
                  background: '#F4333C'
                  color: 'white'
              ]
            ,
            c_CheckboxItem
              id: c.id
              style:
                styleComp c.id, c.isCompleted
              onChange: () -> onChange c.id, c.todo, c.isCompleted
              defaultChecked: false
            , c.todo
          ]
        , []
      )...
    ]


export default list