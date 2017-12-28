import { ddbs as dd } from 'ddeyes'

import React, { Component } from 'react'
import Input from '../../../StoryView/src/components/input'
import List from '../../../StoryView/src/components/list'
import Title from '../../../StoryView/src/components/title'
import { prefixDom } from 'cfx.dom'

import { connect } from 'cfx.react-redux'
import { store } from 'ReduxServ'
{ actions } = store
console.log actions
import {
  getState
} from './components'

CFX = prefixDom {
  Title
  Input
  List
  'div'
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
      c_div
      c_Title
      c_Input
      c_List
    } = CFX


    c_div {}
    ,
      c_Title {}
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
            console.log @props.actions.create todo: v
        ).bind @
      
      c_List
        data: [
            value: 0
            label: '完成1'
          ,
            value: 1
            label: '完成2'
          ,
        ]
        
        creatList: (data) ->
          console.log 'hello'
          
        isClick: false
        str: ' '
        
        hasClick: (str) ->
          console.log 'key:'
          console.log str         

mapStateToProps = (state) ->
  getState state.todosApp.todos
  getState state.todosApp.todosFilter

mapActionToProps =
  filterSave: actions.filterSave
  create: actions.todosCreate
  fetch: actions.todosFetch

export default connect(
  mapStateToProps
  mapActionToProps
  StoryTodos
)




