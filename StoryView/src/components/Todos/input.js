// Generated by CoffeeScript 2.1.1
var CFX, Item,
  _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

import React, {
  Component
} from 'react';

import {
  prefixDom
} from 'cfx.dom';

import {
  List,
  Icon,
  NavBar,
  Popover,
  InputItem
} from 'antd-mobile';

({Item} = Popover);

CFX = prefixDom({'div': 'div', Item, Icon, NavBar, Popover, InputItem, List});

export default function() {
  return {
    render: function() {
      var c_Icon, c_InputItem, c_Item, c_List, c_NavBar, c_Popover, c_div, onSelect, selectStyl, selector;
      ({c_div, c_Item, c_Icon, c_NavBar, c_Popover, c_InputItem, c_List} = CFX);
      selector = this.props.selector != null ? this.props.selector : (selector) => {
        console.log('Pls use props selector.');
        return console.log(selector);
      };
      onSelect = (opt) => {
        return selector(opt.props.value);
      };
      selectStyl = function(filter, itemValue) {
        if (filter === itemValue) {
          return {
            color: 'red'
          };
        }
      };
      return c_NavBar({
        mode: 'light',
        rightContent: c_Popover({
          overlayClassName: 'fortest',
          onSelect: onSelect,
          overlayStyle: {
            color: 'currentColor'
          },
          overlay: [
            c_Item({
              key: '1',
              value: 'active',
              style: selectStyl(this.props.filter,
            'active')
            },
            'Active'),
            c_Item({
              key: '2',
              value: 'completed',
              style: selectStyl(this.props.filter,
            'completed')
            },
            'Completed'),
            c_Item({
              key: '3',
              value: 'all',
              style: selectStyl(this.props.filter,
            'all')
            },
            'All')
          ]
        }, c_div({
          style: {
            height: '100%',
            padding: '0 15px',
            marginRight: '-15px',
            display: 'flex',
            alignItems: 'center'
          }
        }, c_Icon({
          type: 'ellipsis'
        })))
      }, c_InputItem(_extends({
        ref: 'RefInput',
        placeholder: 'What needs to be done'
      }, (this.props.onBlur ? {
        onBlur: this.props.onBlur
      } : {}), (this.props.onFocus ? {
        onFocus: this.props.onFocus
      } : {}), (this.props.onChange ? {
        onChange: this.props.onChange
      } : {}), (this.props.value ? {
        value: this.props.value
      } : {}), {
        clear: true
      })));
    }
  };
};
