import { ddbs as dd } from 'ddeyes'
import React, { Component } from 'react'
import Input from '../../node_modules/StoryView/src/components/input'
import { prefixDom } from 'cfx.dom'
import { connect } from 'cfx.react-redux'
import { store } from 'ReduxServ'
{ 
  actions 
  reducers
} = store
import { getState } from './components'

CFX = prefixDom {
  Input
}

class StoryTodos extends Component
  constructor: (props) ->
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
          @props.actions.create todo: v
      ).bind @

      focus:(
        (v) ->
          console.log 'hello'
          v: ' '
      ).bind @

mapStateToProps = (state) ->
  getState state.todosRedux

mapActionToProps =
  filterSave: actions.filterSave
  create: actions.todosCreate

export default connect(
  mapStateToProps
  mapActionToProps
  StoryTodos
)  
   