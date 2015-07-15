package hms

class SessionFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                println 'controller:'+controllerName+' action:'+actionName
//               println request.getHeader("User-Agent")
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
