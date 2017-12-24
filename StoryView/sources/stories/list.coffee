import { storiesOf } from '@storybook/react'
import { prefixDom } from 'cfx.dom'
import 'antd-mobile/dist/antd-mobile.css'

import List from '../components/list'

CFX = prefixDom {
  List
}

export default ->

  storiesOf 'Todos', module

  .add 'List'

  , =>

    {
      c_List
    } = CFX

    c_List {}


