import { ddbs as dd } from 'ddeyes'

import React, { Component } from 'react'
import Input from '../../../StoryView/src/components/input'
import { prefixDom } from 'cfx.dom'

import {
  store
  uuidFunc
} from 'ReduxServ'

{ actions } = store
console.log uuidFunc
import { connect } from 'cfx.react-redux'

import {
  getState
} from './components'

CFX = prefixDom {
  Input
}

class StoryTodos extends Component

  constructor: (props) ->
    # console.log props
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
          @props.actions.filterSave
            filter: filter
      ).bind @

      blur: (
        (v) ->
          console.log v
          @props.actions.create todo: v
      ).bind @

mapStateToProps = (state) ->
  getState state.todosApp.todos
  getState state.todosApp.todosFilter

mapActionToProps =
  filterSave: actions.filterSave
  create: actions.todosCreate

export default connect(
  mapStateToProps
  mapActionToProps
  StoryTodos
)




