package hms

class SessionFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                println 'controller:'+controllerName+' action:'+actionName
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
