namespace 'TEST.Admin', (exports) ->
  class exports.AdminsService
    createAdmin: (admin)->
      $.ajax
        type: "POST"
        url: Routes.admin_admins_path()
        data: {
          admin: admin
        }
        success: (data)->
          TEST.Admin.RouterStore.getMainRouter().push({
            pathname: 'admins'
          })
          TEST.Admin.AdminIndexActions.updateFormMessage(data)
        error: (data)->
          console.log("Request data error")
      
    fetchAdmins: (page)->
      $.ajax
        type: "GET"
        url: Routes.admin_admins_path(page: page)
        success: (data)->
          TEST.Admin.AdminIndexActions.updateAdmins(data.data)
          TEST.Admin.AdminIndexActions.updatePageInfo(data.pageInfo)
        error: (data)->
          console.log("Request data error")

