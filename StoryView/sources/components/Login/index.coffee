import React, { Component } from 'react'
import { prefixDom } from 'cfx.dom'
import nb from './style'

CFX = prefixDom {
  'div'
  'form'
  'h3'
  'span'
  'input'
  'a'
}

export default ->
  render: ->

    {
      c_div
      c_form
      c_h3
      c_span
      c_input
      c_a
    } = CFX

    c_div {
      ( nb 'logo_box' )...
    }
    ,
      c_h3 {
        ( nb 'logo_box_h3' )...
      }
      , '欢迎登陆'
      c_form
        action: '#'
        name: 'f'
        method: 'post'
      ,  
        c_div {
          ( nb 'input_outer' )...
        }
        ,
          c_span {
            ( nb 'u_user' )...
          }
          c_input {
            type: 'text'
            placeholder: '请输入账户'            
            ( nb 'text' )...
          }
        c_div {
          ( nb 'input_outer' )...
        }
        ,
          c_span {
            ( nb 'us_uer' )...
          }
          c_input {
            type: 'password'
            placeholder: '请输入密码'
            style:
              position: 'absolute'
              zIndex: '100'
              value: ''    
            ( nb 'text' )...
          }
        c_div {
          ( nb 'mb2' )...
        }
        ,
          c_a {
            style:
              color: '#FFFFFF'
            href: '#'
            ( nb 'act_but' )...
            ( nb 'submit' )...
          }
          , '登录'

