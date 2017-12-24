import { prefixDom } from 'cfx.dom'
import React, { Component } from 'react'
import {
  List
  Icon  
  NavBar
  Popover
  InputItem
} from 'antd-mobile'
import { store } from 'ReduxServ'

{
  constants
  actions
  reducers
  getStore
} = store

{ Item } = Popover

CFX = prefixDom {
  'div'
  Item
  Icon
  NavBar
  Popover
  InputItem
  List
}

class Input extends React.Component

  constructor: (props) ->
    super props

    @state =
      disalbe: true
    @

  render: ->

    {
      c_div
      c_Item
      c_Icon
      c_NavBar
      c_Popover
      c_InputItem
      c_List
    } = CFX

    selector =
      if @props.selector?
      then @props.selector
      else (selector) =>
        console.log 'Pls use props selector.'
        console.log selector

    blur =
      if @props.blur?
      then @props.blur
      else (blur) =>
        console.log 'Pls use props blur'     

    onSelect = (opt) =>
      selector opt.props.value
      console.log @state.disable

    onBlur = (v) =>
      blur v

    selectStyl = (filter, itemValue, opt) ->
      color: 'red' if filter is itemValue
        
    c_NavBar
      mode: 'light'
      rightContent:
        c_Popover
          overlayClassName: 'fortest'
          overlayStyle:
            color: 'currentColor'
          visible: @props.disable

          overlay: [
            c_Item
              key: '1'
              value: 'active'
              style: selectStyl @props.filter, 'active'
            , 'Active'
            c_Item
              key: '2'
              value: 'completed'
              style: selectStyl @props.filter, 'completed'
            , 'Completed'
            c_Item
              key: '3'
              value: 'all'
              style: selectStyl @props.filter, 'all'
            , 'All'
          ]
          # onVisibleChange: onVisibleChange
          onSelect: onSelect
        ,
          c_div
            style:
              height: '100%'
              padding: '0 15px'
              marginRight: '-15px'
              display: 'flex'
              alignItems: 'center'
          ,
            c_Icon
              type: 'ellipsis'

      c_InputItem
        placeholder: 'What needs to be done'
        
        onBlur: onBlur

export default Input