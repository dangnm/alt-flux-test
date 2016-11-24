class RouterActions
  constructor: ->
    @generateActions(
      'initData',
      'updateRouteData',
      'updateQuery',
      'updatePathname',
      'updateState',
      'updateMainRouter'
    )

namespace 'TEST.Admin', (exports) ->
  exports.RouterActions = alt.createActions(RouterActions)
