render = ( CFX ) ->
  { c_Input } = CFX
  c_Input {}

getState = (state) ->
  { 
    filter
  } = state
  
  { filter }

export {
  render
  getState
}
