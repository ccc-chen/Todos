import { ddbs as dd } from 'ddeyes'
import React, { Component } from 'react'
import Input from '../../../StoryView/src/components/input'
import List from '../../../StoryView/src/components/list'
import Title from '../../../StoryView/src/components/title'
import { prefixDom } from 'cfx.dom'
import { connect } from 'cfx.react-redux'
import { store } from 'ReduxServ'
{ 
  actions 
  reducers
} = store
import { getState } from './components'

CFX = prefixDom {
  Title
  Input
  List
  'div'
}

class StoryTodos extends Component
  constructor: (props) ->
    super props
    @state = 
      filter: props.state.filter
      # todos: props.state.Packets
    @

  componentWillReceiveProps: (nextProps) ->
    {
      filter
      # todos
    } = nextProps.state
    @setState {
      filter
      # todos
    }
    @
    console.log nextProps
  render: ->

    {
      c_div
      c_Title
      c_Input
      c_List
    } = CFX

    c_div {}
    ,
      c_Title {}
      c_Input
        filter: @props.state.filter
        selector: (
          (filter) ->
            @props.actions.filterSave
              filter: filter
            if filter is 'active'
              @props.Packet false
            else if filter is 'completed'
              @props.Packet true
        ).bind @

        blur: (
          (v) ->
            @props.actions.create todo: v
        ).bind @

      c_List
        data: @props.state.todos
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
        ). bind @

mapStateToProps = (state) ->
  getState state.todosRedux

mapActionToProps =
  filterSave: actions.filterSave
  create: actions.todosCreate
  removeOne: actions.todosRemoveOne
  patch: actions.todosPatch
  save: actions.todosSave

export default connect(
  mapStateToProps
  mapActionToProps
  StoryTodos
)