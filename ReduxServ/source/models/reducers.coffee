import dd from 'ddeyes'

export default

  save: (
    state
    {
      payload: {
        filter
      }
    }
  ) ->
    {
      state...
      filter
    }
