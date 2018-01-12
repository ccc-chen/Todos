import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'
import 'antd-mobile/dist/antd-mobile.css'
import LoginForm from '../../components/Login/index'

CFX = prefixDom {
  LoginForm
}

export default ->

  storiesOf 'LoginForm', module

  .add 'Index'

  , =>

    {
      c_LoginForm
    } = CFX

    c_LoginForm {}