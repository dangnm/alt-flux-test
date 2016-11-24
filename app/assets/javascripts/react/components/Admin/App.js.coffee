{ div, a, i, span, label, input  } = React.DOM

Router = React.createFactory ReactRouter.Router
Route = React.createFactory ReactRouter.Route
IndexRoute = React.createFactory ReactRouter.IndexRoute
hashHistory = ReactRouter.hashHistory 


namespace 'TEST.Admin', (exports) ->
  exports.App = React.createClass
    render: ->
      Router {history: hashHistory},
        Route path: '/', component: ReactRouter.withRouter(TEST.Admin.Layout),
          IndexRoute component: TEST.Admin.Dashboard
          Route path: '/dashboard', component: TEST.Admin.Dashboard
          Route path: '/admins', component: ReactRouter.withRouter(TEST.Admin.AdminIndex)
          Route path: '/admins/new', component: TEST.Admin.AdminNew

