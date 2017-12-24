import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'
import 'antd-mobile/dist/antd-mobile.css'

import Todos from '../components'

CFX = prefixDom {
  Todos
}

export default ->

  storiesOf 'Todos', module

  .add 'Index'

  , =>

    {
      c_Todos
    } = CFX

    c_Todos {}


