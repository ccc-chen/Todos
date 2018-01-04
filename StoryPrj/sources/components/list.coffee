import { ddbs as dd } from 'ddeyes'
import React, { Component } from 'react'
import List from '../../node_modules/StoryView/src/components/list'
import { prefixDom } from 'cfx.dom'
import { connect } from 'cfx.react-redux'
import { store } from 'ReduxServ'
{ 
  actions 
  reducers
} = store
import { getState } from './components'

CFX = prefixDom {
  List
  'div'
}

class StoryTodos extends Component
  constructor: (props) ->
    super props
    @state = 
      todos: props.state.todos
      filter: props.state.filter
    @

  componentWillReceiveProps: (nextProps) ->
    {
      todos
      filter
    } = nextProps.state
    @setState {
      todos
      filter
    }
    @

  render: ->
    {
      c_div
      c_List
    } = CFX

    Packet = (bool, data) ->
      console.log "hello"
      a = data.reduce (r, c) =>
        [
          r...
          (
            if c.isCompleted is false
            then [ c ]
            else []
          )...
        ]
      , []

    dd @state.filter
    c_div {}
    ,
      c_List

        # data: @state.todos
        data:
          if @state.filter is 'active'
          then Packet false, @state.todos
          else if @state.filter is 'completed'
          else @state.todos
        styleChange: (
          (id, isCompleted) ->
            textDecorationLine: 'line-through' if isCompleted is true
        ).bind @

        Delete: (
          (key) ->
            @props.actions.removeOne
              id: key
        ).bind @

        Patch: (
          (key, value) ->
            @props.actions.patch
              id: key
              todo: value
              isCompleted: false
        ).bind @

        hasClick: (
          (key, todo, isCompleted) ->
            @props.actions.patch
              id: key
              todo: todo
              isCompleted: !isCompleted
        ).bind @

mapStateToProps = (state) ->
  getState state.todosRedux

mapActionToProps =
  removeOne: actions.todosRemoveOne
  patch: actions.todosPatch
  save: actions.todosSave

export default connect(
  mapStateToProps
  mapActionToProps
  StoryTodos
)