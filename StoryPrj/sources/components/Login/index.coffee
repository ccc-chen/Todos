import { ddbs as dd } from 'ddeyes'
import React, { Component } from 'react'
import { Login } from 'StoryView'
import { prefixDom } from 'cfx.dom'

CFX = prefixDom {
  Login
}

export default ->

  render: ->

    {
      c_Login
    } = CFX

    c_Login {}