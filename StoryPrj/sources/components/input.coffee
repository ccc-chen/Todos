import { ddbs as dd } from 'ddeyes'
import React, { Component } from 'react'
import { HotKeys } from 'react-hotkeys'
import { Input } from 'StoryView'
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
console.log actions
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
          # console.log @state.todo
          # @props.actions.create({todo: @state.todo}).then((result) =>{
          #   console.log(result)
          # })
          @refs.RefInput.refs.RefInput.clearInput()
          console.log @props
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
  # save: actions.todoSave
  create: actions.todoCreate

export default connect(
  mapStateToProps
  mapActionToProps
  StoryTodos
)