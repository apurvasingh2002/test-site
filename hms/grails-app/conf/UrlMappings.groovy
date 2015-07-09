class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/" (controller: 'dashboard' , action: "index")
        "/logout" (view: "/logout/logout")
        "500"(view:'/error')

        "/login/$action?"(controller: "login")
        "/logout/$action?"(controller: "logout")
	}
}
