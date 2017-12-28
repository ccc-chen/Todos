import { prefixDom } from 'cfx.dom'
import Title from './title'
import Input from './input'
import List from './list'

CFX = prefixDom {
  'div'
  Title
  Input
  List
}

export default ->

  {
    c_div
    c_Title
    c_Input
    c_List
  } = CFX

  c_div {}
  ,
    c_Title {}
    c_Input {}
    c_List
      data: [
            value: 0
            label: '完成1'
          ,
            value: 1
            label: '完成2'
        ]
