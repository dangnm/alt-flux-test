class AdminIndexActions
  constructor: ->
    @generateActions(
      'initData',
      'updateAdmins',
      'updatePageInfo',
      'updateFormMessage'
    )

namespace 'TEST.Admin', (exports) ->
  exports.AdminIndexActions = alt.createActions(AdminIndexActions)
