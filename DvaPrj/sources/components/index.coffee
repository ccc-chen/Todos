import { prefixDom } from 'cfx.dom'
import { connect } from 'dva'
import {
  Title 
  Input
  List
} from 'StoryView'

import getState from './common'

CFX = prefixDom {
  Title
  Input
  List
}

DvaTodos = ({
  dispatch
  
})