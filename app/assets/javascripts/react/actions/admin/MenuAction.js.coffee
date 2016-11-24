class MenuActions
  constructor: ->
    @generateActions(
      'initData'
    )

namespace 'TEST.Admin', (exports) ->
  exports.MenuActions = alt.createActions(MenuActions)
