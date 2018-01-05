// Generated by CoffeeScript 2.1.1
var CFX, StoryTodos, actions, mapActionToProps, mapStateToProps, reducers;

import {
  ddbs as dd
} from 'ddeyes';

import React, {
  Component
} from 'react';

import List from '../../node_modules/StoryView/src/components/list';

import {
  prefixDom
} from 'cfx.dom';

import {
  connect
} from 'cfx.react-redux';

import {
  store
} from 'ReduxServ';

({actions, reducers} = store);

import {
  getState
} from './components';

CFX = prefixDom({List, 'div': 'div'});

StoryTodos = class StoryTodos extends Component {
  constructor(props) {
    super(props);
    this.state = {
      todos: props.state.todos,
      filter: props.state.filter
    };
    this;
  }

  componentWillReceiveProps(nextProps) {
    var filter, todos;
    ({todos, filter} = nextProps.state);
    this.setState({todos, filter});
    return this;
  }

  render() {
    var Packet, c_List, c_div;
    ({c_div, c_List} = CFX);
    Packet = function(bool, data) {
      console.log("hello");
      return data.reduce((r, c) => {
        return [...r, ...(c.isCompleted === bool ? [c] : [])];
      }, []);
    };
    return c_div({}, c_List({
      data: (function() {
        switch (this.state.filter) {
          case 'active':
            return Packet(false, this.state.todos);
          case 'completed':
            return Packet(true, this.state.todos);
          case 'all':
            return this.state.todos;
        }
      }).call(this),
      styleChange: (function(id, isCompleted) {
        if (isCompleted === true) {
          return {
            textDecorationLine: 'line-through',
            opacity: 0.4
          };
        }
      }).bind(this),
      Delete: (function(key) {
        return this.props.actions.removeOne({
          id: key
        });
      }).bind(this),
      Patch: (function(key, value) {
        return this.props.actions.patch({
          id: key,
          todo: value,
          isCompleted: false
        });
      }).bind(this),
      hasClick: (function(key, todo, isCompleted) {
        return this.props.actions.patch({
          id: key,
          todo: todo,
          isCompleted: !isCompleted
        });
      }).bind(this)
    }));
  }

};

mapStateToProps = function(state) {
  return getState(state.todosRedux);
};

mapActionToProps = {
  removeOne: actions.todosRemoveOne,
  patch: actions.todosPatch,
  save: actions.todosSave
};

export default connect(mapStateToProps, mapActionToProps, StoryTodos);
