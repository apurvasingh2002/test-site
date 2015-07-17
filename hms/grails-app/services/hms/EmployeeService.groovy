package hms

import Enums.LeaveStatus
import grails.transaction.Transactional
import hrm.Employee
import hrm.LeaveSetting
import hrm.Payroll
import um.Role
import um.User
import um.UserRole

@Transactional
class EmployeeService {

    def grailsApplication
    def messageSource
    def locale = Locale.default

    def getGrailsDomainClass(String className) {
        Class grailsClass = grailsApplication.domainClasses.find { it.clazz.simpleName == className }.clazz
        return grailsClass
    }

    def saveEmployee(def params) {
        def map = [:]
//        println(params)
        params?.each { key, value ->
            if (value && !value.equals('null') && !value.equals('')) {
                map.put(key, value)
                println "$key,$value"
            }
        }
        if (!map.isEmpty()) {
            def newUser = new User(params.email, "password").save(flush: true);
            UserRole.create(newUser, Role.findByAuthority("ROLE_EMPLOYEE"), true);
            def employee = new Employee()
            setMap(employee, map.put("user_id", newUser.id))
            try {
                employee.save(flush: true)
                println(employee)
                return [true, employee.getClass().toString() + ' saved']
            } catch (Exception e) {
                def msg = "Exception occurred while saving " + employee.getClass().toString() + " :: " + e.getMessage()
                return [false, msg]
            }
        } else
            return [false, "Passed Data Empty"]
    }

    def updateEmployee(def employee, def params) {
        if (params instanceof HashMap)
            setMap(new Employee(), params)
        else
            return "Passed Data not the instance of map"
    }


    def saveInstance(Employee employeeInstance, def params) {
        employeeInstance.properties = params
        def result=processObject(leaveSettingInstance);
        return result

    }

    def saveInstance(LeaveSetting leaveSettingInstance, def params) {
        params.days = params.date('toDate', 'dd/MM/yyyy') - params.date('fromDate', 'dd/MM/yyyy')
        if (!params.id)
            params.status = LeaveStatus.UNAPPROVED;
        leaveSettingInstance.properties = params;
        def result=processObject(leaveSettingInstance);
        return result
    }


    def saveInstance(Payroll payrollInstance, def params) {
        payrollInstance.properties = params
        def result=processObject(leaveSettingInstance);
        return result
    }

    def processObject={ obj->

        obj.validate()

        def map = [:]
        if (obj == null) {
            map.state = 0
            map.msg = "Not Found"
            return map
        }

        if (obj.hasErrors()) {
            map.state = 0
            map.msg = []
            for (fieldErrors in obj.errors) {
                for (error in fieldErrors.allErrors) {
                    map.msg << messageSource.getMessage(error, locale)
                }
            }

            return map
        }
        map.msg =obj.id?"Updated successful":"Created successful";
        map.state = 1
        obj.save()

        return map
    }


    def setMap(object, map) {
        map.each { key, value ->
            if (object.hasProperty(key.toString())) {
                println "$key == $value"
                object.(key.toString()) = value
            }
        }
    }

}
