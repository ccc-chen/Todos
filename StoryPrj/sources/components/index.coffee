import React, { Component } from 'react'
import Input from '../../../StoryView/src/components/input'
import { prefixDom } from 'cfx.dom'

import { store } from 'ReduxServ'
{ actions } = store

import { connect } from 'cfx.react-redux'

import {
  render
  getState
} from './components'


CFX = prefixDom {
  Input
}

class StoryTodos extends Component

  constructor: (props) ->
    super props
    console.log props
    @state = 
      filter: props.state.filter
    @

 
  componentWillReceiveProps: (nextProps) ->
    {
      filter
    } = nextProps.state
    @setState {
      filter
    }
    @

  render: ->

    {
      c_Input
    } = CFX

    c_Input
      selector: (filter) ->
        console.log filter
        @state.actions.save
          filter: filter

mapStateToProps = (state) ->
  getState state.todosApp.todos

mapActionToProps =
  save: actions.visitorSave

export default connect(
  mapStateToProps
  mapActionToProps
  StoryTodos
)




