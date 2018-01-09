import { ddbs as dd } from 'ddeyes'
import React, { Component } from 'react'
import { HotKeys } from 'react-hotkeys'
import { Input } from 'StoryView'
import { prefixDom } from 'cfx.dom'
import { connect } from 'cfx.react-redux'
import {
  store
  services
  toolFunc
} from 'ReduxServ'
dd services
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
    dd props
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

    keyMap =
      clear: 'enter'
    handlers =
      clear: (
        -> @refs.RefInput.clearInput()
      ).bind @

    c_HotKeys {
      keyMap
      handlers
    }

    c_HotKeys
      keyMap:
        submit: 'enter'
      handlers:
        submit: ( ->
          # @props.actions.create todo: @state.todo
          @props.actions.create(toolFunc,{
            nickname: 'chenhuan'
            password: '111'
          }).then((result)=> {
            result
          })
          @refs.RefInput.refs.RefInput.clearInput()
          dd @refs
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
        value: @state.todo

mapStateToProps = (state) ->
  getState state.todosRedux

mapActionToProps =
  filterSave: actions.filterSave
  # create: actions.todosCreate
  create: services.lc.create

export default connect(
  mapStateToProps
  mapActionToProps
  StoryTodos
)
