{ div, a, i, span, label, input  } = React.DOM

namespace 'TEST.Admin', (exports) ->
  exports.Layout = React.createClass
    componentWillMount: ->
      TEST.Admin.RouterStore.listen(@onChange)
      TEST.Admin.RouterActions.initData(@props)
      TEST.Admin.RouterActions.updateRouteData({
        query: @props.location.query
        pathname: @props.location.pathname,
        state: @props.location.state
      })
  
      TEST.Admin.RouterActions.updateMainRouter(@props.router)
  
      @props.router.listen(@browserHistoryChanged)
  
    browserHistoryChanged: (ev)->
      TEST.Admin.RouterActions.updateRouteData({
        query: ev.query
        pathname: ev.pathname,
        state: ev.state
      })
  
    componentWillUnmount: ->
      Store.unlisten(@onChange)
      @props.router.unregisterTransitionHook(@browserHistoryChanged)
  
    onChange: (state)->
      # console.log('state changed')
      # console.log(state.routeData)
      @setState(state)
  
    render: ->
      div {},
        @props.children
