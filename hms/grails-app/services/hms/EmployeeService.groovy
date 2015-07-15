package hms

import grails.transaction.Transactional
import hrm.Employee
import um.Role
import um.User
import um.UserRole

@Transactional
class EmployeeService {

    def grailsApplication

    def getGrailsDomainClass(String className){
        Class grailsClass = grailsApplication.domainClasses.find{it.clazz.simpleName == className}.clazz
        return grailsClass
    }

    def saveEmployee(def params){
        def map = [:]
//        println(params)
        params?.each{ key ,value ->
            if(value && !value.equals('null') && !value.equals('')){
                map.put(key,value)
                println "$key,$value"
            }
        }
        if(!map.isEmpty()) {
            def newUser = new User(params.email,"password").save(flush: true);
            UserRole.create(newUser,Role.findByAuthority("ROLE_EMPLOYEE"),true);
            def employee = new Employee()
            setMap(employee, map.put("user_id",newUser.id))
            try {
                employee.save(flush: true)
                println(employee)
                return [true,employee.getClass().toString()+' saved']
            }catch (Exception e){
                def msg = "Exception occurred while saving "+employee.getClass().toString()+" :: "+e.getMessage()
                return [false,msg]
            }
        }else
            return [false,"Passed Data Empty"]
    }

    def updateEmployee(def employee,def params){
        if(params instanceof HashMap)
            setMap(new Employee(),params)
        else
            return "Passed Data not the instance of map"
    }

    def deleteEmployee(def id){

    }

    def savePayroll(def params){

    }

    def updatePayroll(def params){

    }

    def deletePayroll(def id){

    }

    def saveLeaveSettings(def params){

    }

    def updateLeaveSettings(def params){

    }

    def deleteLeaveSettings(def id){

    }

    def setMap(object,map){
        map.each{ key , value ->
            if(object.hasProperty(key.toString())) {
                println "$key == $value"
                object.(key.toString()) = value
            }
        }
    }

}
