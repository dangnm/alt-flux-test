{ div, table, thead, tr, th, tbody, td, tfoot, a, i } = React.DOM

namespace 'TEST.Admin', (exports) ->
  exports.AdminIndex = React.createClass
    getInitialState: ->
      {
        admins: [],
        pageInfo: {},
        form_messages: []
      }
  
    componentWillMount: ->
      TEST.Admin.AdminIndexStore.listen(@onChange)
      TEST.Admin.AdminIndexActions.initData(@props)

      TEST.Admin.RouterStore.listen(@onUrlChange)
  
      page = TEST.Admin.RouterStore.getRouteData().query.page
      adminsService = new TEST.Admin.AdminsService
      adminsService.fetchAdmins(page)
  
    componentWillUnmount: ->
      TEST.Admin.AdminIndexStore.unlisten(@onChange)
      TEST.Admin.RouterStore.unlisten(@onUrlChange)
  
    onChange: (state)->
      @setState(state)
  
    onUrlChange: (state)->
      if state.routeData.pathname == "/admins"
        adminService = new TEST.Admin.AdminsService
        adminService.fetchAdmins(state.routeData.query.page || 1)
  
  
    onPageChanged: (data)->
      query = TEST.Admin.RouterStore.getRouteData().query
      pathname = TEST.Admin.RouterStore.getRouteData().pathname
      state = TEST.Admin.RouterStore.getRouteData().state
  
      TEST.Admin.RouterStore.getMainRouter().push({
        query: $.extend({}, query, {page: data.currentPage}),
        pathname: pathname,
        state: state
      })

    onNew: ->
      TEST.Admin.RouterStore.getMainRouter().push({
        pathname: 'admins/new'
      })
  
    render: ->
      div className: 'admin-page-index',
        div className: 'ui right aligned grid action-box',
          div className: 'sixteen wide column',
            div className: 'ui button action-box__new-btn', onClick: @onNew, 'New admin'
        _.map @state.form_messages, (message) =>  
          FormMessageItem({key: message.id, content: message.content})
        table className: 'ui celled table',
          thead {},
            tr {},
              th {}, 'Id'
              th {}, 'Email'
              th {}, 'Created at'
          tbody {},
            _.map @state.admins, (admin) =>  
              tr {key: admin.id},
                td {}, admin.id
                td {}, admin.email
                td {}, admin.created_at
          tfoot {},
            tr {},
              th colSpan: '3',
                Pager($.extend({}, @state.pageInfo, {onPageChanged: @onPageChanged}))
  
