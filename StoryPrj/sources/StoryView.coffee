import { prefixDom } from 'cfx.dom'
import React, { Component } from 'react'
import { store } from '../../ReduxServ/source/store/index.coffee'
import {
  List
  Icon  
  NavBar
  Popover
  InputItem
} from 'antd-mobile'

{ Item } = Popover

CFX = prefixDom {
  'div'
  Item
  Icon
  NavBar
  Popover
  InputItem  
}

class Input extends React.Component
    
  render: ->

    {
      c_div
      c_Item
      c_Icon
      c_NavBar
      c_Popover
      c_InputItem
    } = CFX

    selector =
      if @props.selector?
      then @props.selector
      else (selector) =>
        console.log 'Pls use props selector.'
        console.log selector

    onSelect = (opt) =>
      selector opt.props.value

    selectStyl = (filter, itemValue) ->
      color: 'red' if filter is itemValue

    c_NavBar
      mode: 'light'
      rightContent:
        c_Popover
          overlayClassName: 'fortest'
          overlayStyle:
            color: 'currentColor'
          # visible:
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
          # onVisibleChange: ->
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

export default Input