// Generated by CoffeeScript 2.1.1
var CFX;

import {
  storiesOf
} from '@storybook/react';

import {
  prefixDom
} from 'cfx.dom';

import 'antd-mobile/dist/antd-mobile.css';

import Input from '../components/input';

CFX = prefixDom({Input});

export default function() {
  return storiesOf('Todos', module).add('Input', () => {
    var c_Input;
    ({c_Input} = CFX);
    return c_Input({
      filter: 'all',
      selector: function(filter) {
        return console.log(filter);
      },
      onBlur: function(v) {
        return console.log(v);
      },
      focus: function(v) {
        return console.log(v);
      }
    });
  });
};