package hms

import grails.transaction.Transactional
import hrm.Employee
import um.Role
import um.User
import um.UserRole

@Transactional
class EmployeeService {

    def grailsApplication

    def saveEmployee(def params){
        def map = [:]
        params?.each{ key ,value ->
            map.put(key,value)
        }
        if(!map.isEmpty()) {
            def newUser = new User(params.email,"password").save(flush: true);
            UserRole.create(newUser,new Role("ROLE_EMPLOYEE").save(flush: true));
            return genericSave(new Employee(), params)
        }else
            return [false,"Passed Data Empty"]
    }

    def updateEmployee(def employee,def params){
        if(params instanceof HashMap)
            genericSave(new Employee(),params)
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

    def genericSave(Employee object,map){
        map.each{ key , value ->
            println "==>> $key , $value"
            if(object.getProperty(key))
                object.(key) = map.get(value)
        }
        try {
            object.save(flush: true)
            return [true,object.getClass().toString()+' saved']
        }catch (Exception e){
            def msg = "Exception occurred while saving "+object.getClass().toString()+" :: "+e.getMessage()
            return [false,msg]
        }
    }

}
