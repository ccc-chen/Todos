import React, { Component } from 'react'
import { prefixDom } from 'cfx.dom'
import { HotKeys } from 'react-hotkeys'
import {
  List
  InputItem
  Switch
  Stepper
  Range
  Button
  WingBlank
  WhiteSpace  
} from 'antd-mobile'
{ Item } = List

import { createForm } from 'rc-form'

CFX = prefixDom {
  'div'
  'form'
  List
  Item  
  InputItem
  Button
  WingBlank
  WhiteSpace  
}

export default ->
  render: ->

    {
      c_div
      c_form
      c_List
      c_Item      
      c_InputItem
      c_Button
      c_WingBlank
      c_WhiteSpace         
    } = CFX


    # c_form {}
    # ,
    #   c_List {}
    #   ,
    #     c_InputItem
    #       style:
    #         width: '80%'
    #         margin: '0 auto'
    #       rules: [
    #           require: true
    #           message: 'Please input account'
    #         ,
    #           validator: @validateAccount  
    #       ]
    #       clear: true
    #       placeholder: 'please input account'
    #     , 'Account'

    #     c_InputItem
    #       type: 'password'
    #       placeholder: 'please input password'
    #     , 'password'

    #     c_Item
    #     ,
    #       c_Button
    #         type: 'primary'
    #         size: 'small'
    #         inline: true
    #         # onClick: @onSubmit
    #       , 'Submit'

    #       c_Button
    #         size: 'small'
    #         inline: true
    #         style:
    #           marginLeft: '2.5px'
    #       , 'Reset'

