import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'
import 'antd-mobile/dist/antd-mobile.css'
import Login from '../../components/Login/Form'

CFX = prefixDom {
  Login
}

export default ->

  storiesOf 'Login', module

  .add 'Index'

  , =>

    {
      c_Login
    } = CFX

    c_Login {}