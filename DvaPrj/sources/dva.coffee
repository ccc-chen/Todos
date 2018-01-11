###
  eslint-disable import/first,
                 no-unused-vars
###
import {
  Menu
  Icon

  Table

  Popconfirm
  Modal
  Form
  Input
  Button
  Pagination
} from 'antd'

import { Link } from 'dva/router'
import { prefixDom } from 'cfx.dom'

MenuItem = Menu.Item
FormItem = Form.Item

CFX = prefixDom {
  Menu
  Icon

  Table

  Popconfirm
  Modal
  Form
  Input
  Button
  Pagination  

  Link
  MenuItem
  FormItem
}