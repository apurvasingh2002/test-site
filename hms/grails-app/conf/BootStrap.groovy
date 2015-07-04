import um.*

class BootStrap {

    def init = { servletContext ->

      //  if(User.count()<=0)
   // UserRole.create(new User(username:"admin",password:"admin").save(),new Role(authority:"ROLE_ADMIN").save())

        /*     for (String url in [
                    '/', '/index', '/index.gsp', '*//**//*favicon.ico',
                '/assets*//**', '*//**//*js*//**', '*//**//*css*//**', '*//**//*images*//**',
                '/login', '/login.*', '/login*//*',
                '/logout', '/logout.*', '/logout*//*']) {
            new RequestMap(url: url, configAttribute: 'permitAll').save()
        }

        new RequestMap(url: '/employee*//**',    configAttribute: 'ROLE_ADMIN').save()*/
       // new RequestMap(url: '/*', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save();
       // new RequestMap(url: '/logout/**', configAttribute: 'IS_AUTHENTICATED_REMEMBERED,IS_AUTHENTICATED_FULLY').save();
       // new RequestMap(url: '/login/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
       // new RequestMap(url: '/index/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save();

    }
    def destroy = {
    }
}
