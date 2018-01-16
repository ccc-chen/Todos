import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'
import Login from '../components/Login'

CFX = prefixDom {
  'div'
  Login
}

export default ->

  storiesOf 'LoginForm', module

  .add 'index'
  , =>

    {
      c_Login
    } = CFX

    c_Login {}
