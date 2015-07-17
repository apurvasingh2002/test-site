package hrm

import Enums.LeaveStatus
import grails.converters.JSON
import um.Role
import um.User
import um.UserRole

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//@Transactional(readOnly = true)
class EmployeeController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService
    def employeeService

    def index() {
        model:
        [tabTemplate: (session.activeTab ? session.activeTab : 'Employee')]
//        params.max = Math.min(params.max ?: 10, 100)
//        respond Employee.list(params), model:[employeeInstanceCount: Employee.count()]
    }

    def renderTemplate() {
        session.activeTab = params.tabTemplate
        String template = params.template
        String className = params.clazz ? params.clazz : template
        Class grailsClass = employeeService.getGrailsDomainClass(className)
        def objectInstance = params.id ? grailsClass.findById(params.id) : grailsClass.newInstance()
        render template: template,
                model: [objectInstanceList: grailsClass.list(params), objectInstaceCount: grailsClass.count(), objectInstance: objectInstance,className:className]
    }


    def save() {
        Class grailsClass = employeeService.getGrailsDomainClass(params.className)
        def objectInstance = params.id ? grailsClass.findById(params.id) : grailsClass.newInstance()
        def status=employeeService.saveInstance(objectInstance,params)
        render status as JSON
    }

    /*   @Transactional
       def saveEmployee() {
           println params
           def (status,message) = employeeService.saveEmployee(params)
           println "status :: "+status+" message :: "+message
           if(status){
                   flash.message = 'New Employee create'
                   redirect(index());
           }else {
               flash.message = message
               redirect(action: 'index')
           }
       }


    @Transactional
    def delete(Employee employeeInstance) {
        if (employeeInstance == null) {
            notFound()
            return
        }
        employeeInstance.delete flush: true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Employee.label', default: 'Employee'), employeeInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
*/

}
