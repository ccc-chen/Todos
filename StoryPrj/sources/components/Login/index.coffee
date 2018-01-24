import { ddbs as dd } from 'ddeyes'
import React, { Component } from 'react'
import { Login } from 'StoryView'
import { prefixDom } from 'cfx.dom'

CFX = prefixDom {
  Login
}

class StoryTodos extends Component

  constructor: (props) ->
    super props
    @

  render: ->

    {
      c_Login
    } = CFX
    console.log @props
    c_Login {}

export default StoryTodos  