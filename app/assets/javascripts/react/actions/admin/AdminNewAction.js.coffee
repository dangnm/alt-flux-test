class AdminNewActions
  constructor: ->
    @generateActions(
      'initData',
      'updateFormMessage'
    )

  create: (admin)->
    adminsService = new TEST.Admin.AdminsService
    adminsService.createAdmin(admin)
    return admin

namespace 'TEST.Admin', (exports) ->
  exports.AdminNewActions = alt.createActions(AdminNewActions)
