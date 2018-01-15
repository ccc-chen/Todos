import React, { Component } from 'react'
import { prefixDom } from 'cfx.dom'
import nb from './style'
import star from '../../../public/assets/demo-1-bg.jpg'

CFX = prefixDom {
  'div'
  'form'
  'h3'
  'span'
  'input'
  'img'
  'a'
}

class Login extends Component

  render: ->

    {
      c_div
      c_form
      c_h3
      c_span
      c_input
      c_a
      c_img
    } = CFX

    c_div {}
    ,
      c_img
        src: star

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
              ref: 'userinput'
              type: 'text'
              placeholder: '请输入账户'
              style:
                color: '#FFFFFF'
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
                color: '#FFFFFF'                
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

export default Login