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
        
    onChange = (objectId, todo, isCompleted) =>
      hasClick objectId, todo, isCompleted
      styleComp objectId, isCompleted

    DeletePress = (objectId) =>
      Delete objectId

    PatchPress = (objectId, todo, isCompleted) =>
      Patch objectId, todo, isCompleted

    onPressEdit = (objectId, todo, isCompleted) =>
      prompt(
        'defaultValue'
        'defaultValue for prompt'
        [
            text: 'Cancel'
          ,
            text: 'Submit'
            onPress: (value) => PatchPress(objectId, value, isCompleted)
        ]
        'default'
      todo)

# 删除 
    onPressDelete = (objectId) =>
      console.log '删除的id是:', objectId
      alert(
        'Delete'
        'Are you sure???'
        [
          text: 'Cancel'
          onPress: () => console.log 'cancel'
        ,  
          text: 'Ok'
          onPress:() => DeletePress objectId
        ]
      )

    styleComp = (objectId, isCompleted) ->
      styleChange objectId, isCompleted

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
                onPress: () => onPressEdit c.objectId, c.todo, c.isCompleted
                style:
                  background: '#ddd'
                  color: 'white'
              ,
                text: '删除'
                onPress: () => onPressDelete c.objectId
                style:
                  background: '#F4333C'
                  color: 'white'
              ]
            ,
            c_CheckboxItem
              objectid: c.objectId
              style:
                styleComp c.objectId, c.isCompleted
              onChange: () => onChange c.objectId, c.todo, c.isCompleted
              checked: c.isCompleted
            , c.todo
          ]
        , []
      )...
    ]

export default list