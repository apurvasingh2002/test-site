package hrm

class DashboardController {

    def index() {
        render view: 'dashboard'
    }

    def renderUserProfile(){
        render template: 'userProfile'
    }
}
