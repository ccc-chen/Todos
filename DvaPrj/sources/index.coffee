import dva from 'dva'
import createHistory from 'history/createBrowserHistory'
import createLoading from 'dva-loading'
import { message } from 'antd'

import './index.css'
import './dva'

ERROR_MSG_DURATION = 3

confDva =
  history: createHistory()
  onError: (e) ->
    message.error e.message
    , ERROR_MSG_DURATION
