import React, { Component } from 'react'
import Input from '../../../StoryView/src/components/input'
import { prefixDom } from 'cfx.dom'

import { store } from 'ReduxServ'
{ actions } = store

import { connect } from 'cfx.react-redux'

import {
  getState
} from './components'

CFX = prefixDom {
  Input
}

class StoryTodos extends Component

  constructor: (props) ->
    console.log props
    super props
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
      filter: @state.filter
      selector: (
        (filter) ->
          @props.actions.save
            filter: filter
      ).bind @
      blur: (v) ->
        console.log v      

mapStateToProps = (state) ->
  getState state.todosApp.todos

mapActionToProps =
  save: actions.filterSave

export default connect(
  mapStateToProps
  mapActionToProps
  StoryTodos
)




