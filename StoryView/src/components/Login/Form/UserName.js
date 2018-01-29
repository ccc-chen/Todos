// Generated by CoffeeScript 2.1.1
var CFX, UserName;

import FormField from '../../Form/Field';

import {
  Input,
  Icon
} from 'antd';

import {
  prefixDom
} from 'cfx.dom';

CFX = prefixDom({Input, Icon, FormField});

UserName = ({decorator}) => {
  var c_FormField, c_Icon, c_Input;
  ({c_Icon, c_Input, c_FormField} = CFX);
  return c_FormField({}, {
    decorator: decorator,
    name: 'username',
    props: {
      rules: [
        {
          required: true,
          message: '请输入邮箱 / 手机号 / 用户名。'
        }
      ]
    },
    children: c_Input({
      prefix: c_Icon({
        type: 'user',
        style: {
          fontSize: 13
        }
      }),
      placeholder: 'Email / Phone / UserName'
    })
  });
};

export default UserName;
