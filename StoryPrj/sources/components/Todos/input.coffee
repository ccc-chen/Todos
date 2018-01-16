import { ddbs as dd } from 'ddeyes'
import React, { Component } from 'react'
import { HotKeys } from 'react-hotkeys'
import {
  Input
  Login
} from 'StoryView'
import { prefixDom } from 'cfx.dom'
import { connect } from 'cfx.react-redux'
import { store } from 'ReduxServ'
{
  actions
  reducers
  sagas
} = store
import { getState } from './components'

CFX = prefixDom {
  Input
  HotKeys
}

class StoryTodos extends Component

  constructor: (props) ->
    super props
    @state =
      todo: ''
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
      c_HotKeys
    } = CFX

    c_HotKeys
      keyMap:
        submit: 'enter'
      handlers:
        submit: ( ->
          @props.actions.create todo: @state.todo
          # @props.actions.save todo: @state.todo
          @refs.RefInput.refs.RefInput.clearInput()
        ).bind @
    ,
      c_Input
        ref: 'RefInput'
        filter: @state.filter
        selector: (
          (filter) ->
            @props.actions.filterSave
              filter: filter
        ).bind @
        onChange: (
          (v) ->
            @setState todo: v
        ).bind @

mapStateToProps = (state) ->
  getState state.todosRedux

mapActionToProps =
  filterSave: actions.filterSave
  create: actions.todoCreate
  # save: actions.todoSave

export default connect(
  mapStateToProps
  mapActionToProps
  StoryTodos
)