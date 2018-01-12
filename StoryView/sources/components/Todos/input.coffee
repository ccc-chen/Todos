import React, { Component } from 'react'
import { prefixDom } from 'cfx.dom'

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
  List
}

export default ->

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
    onSelect = (opt) =>
      selector opt.props.value

    selectStyl = (filter, itemValue) ->
      color: 'red' if filter is itemValue

    c_NavBar
      mode: 'light'
      rightContent:
        c_Popover
          overlayClassName: 'fortest'
          onSelect: onSelect
          overlayStyle:
            color: 'currentColor'

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
        ,
          c_div
            style:
              height: '100%'
              padding: '0 15px'
              marginRight: '-15px'
              display: 'flex'
              alignItems: 'center'

            c_Icon
              type: 'ellipsis'

      c_InputItem {
        ref: 'RefInput'
        placeholder: 'What needs to be done'
        (
          if @props.onBlur
          then onBlur: @props.onBlur
          else {}
        )...
        (
          if @props.onFocus
          then onFocus: @props.onFocus
          else {}
        )...
        (
          if @props.onChange
          then onChange: @props.onChange
          else {}
        )...
        (
          if @props.value
          then value: @props.value
          else {}
        )...
        clear: true
      }
