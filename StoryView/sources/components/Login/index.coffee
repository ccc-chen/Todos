import React, { Component } from 'react'
import { prefixDom } from 'cfx.dom'

CFX = prefixDom {
  'div'
  'form'
}

export default ->
  render: ->

    {
      c_div
      c_form     
    } = CFX

    c_div