class MenuStore
  @displayName: 'MenuStore'

  constructor: ->
    @bindActions(TEST.Admin.MenuActions)
    @user_session = {}

    @exportPublicMethods(
      {
        getUserSession: @getUserSession
      }
    )

  onInitData: (props)->
    @user_session = props.user_session


  getUserSession: ()->
    @getState().user_session

namespace 'TEST.Admin', (exports) ->
  exports.MenuStore = alt.createStore(MenuStore)
