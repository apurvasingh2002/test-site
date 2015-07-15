package hrm

import Enums.LeaveStatus

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//@Transactional(readOnly = true)
class EmployeeController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService
    def employeeService

    def index() {
          model:[tabTemplate: (session.activeTab ? session.activeTab : 'Employee')]
//        params.max = Math.min(params.max ?: 10, 100)
//        respond Employee.list(params), model:[employeeInstanceCount: Employee.count()]
    }

    def renderTemplate(){
        session.activeTab = params.tabTemplate
        println "==>>"+params
        String template = params.template
        String className = params.clazz ? params.clazz : template
        Class grailsClass = employeeService.getGrailsDomainClass(className)
        def objectInstance = params.id ? grailsClass.findById(params.id) : grailsClass.newInstance()
        render template: template ,
                model:[objectInstanceList:grailsClass.list(params),objectInstaceCount:grailsClass.count(),objectInstance:objectInstance]
    }

//    @Transactional
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

    def edit(Employee employeeInstance) {
        respond employeeInstance
    }

    @Transactional
    def update(Employee employeeInstance) {
        if (employeeInstance == null) {
            notFound()
            return
        }
        if (employeeInstance.hasErrors()) {
            respond employeeInstance.errors, view:'edit'
            return
        }
        employeeInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Employee.label', default: 'Employee'), employeeInstance.id])
                redirect employeeInstance
            }
            '*'{ respond employeeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Employee employeeInstance) {
        if (employeeInstance == null) {
            notFound()
            return
        }
        employeeInstance.delete flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Employee.label', default: 'Employee'), employeeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


    @Transactional
    def saveLeave() {
        def leaveSettingInstance=new LeaveSetting(params)
        leaveSettingInstance.employee=Employee.findByUser(springSecurityService.currentUser)
        leaveSettingInstance.days=  params.toDate -  params.fromDate
        leaveSettingInstance.status=LeaveStatus.UNAPPROVED;
        leaveSettingInstance.validate()

        if (leaveSettingInstance == null) {
            notFound()
            return
        }



        if (leaveSettingInstance.hasErrors()) {
            render  view: 'index',model: [errorInstance:leaveSettingInstance.errors,template:session.activeTab]
           // respond leaveSettingInstance.errors, view: 'create'
            return
        }



        leaveSettingInstance.save flush: true
        flash.message="Leave successfully created for "+leaveSettingInstance.employee.getFullName()
        redirect(action: "index")
       /* request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'leaveSetting.label', default: 'LeaveSetting'), leaveSettingInstance.id])
                redirect leaveSettingInstance
            }
//            '*' { respond leaveSettingInstance, [status: CREATED] }

        }*/
    }


    @Transactional
    def updateLeave(LeaveSetting leaveSettingInstance) {
        leaveSettingInstance.days=  leaveSettingInstance.toDate -  leaveSettingInstance.fromDate
        leaveSettingInstance.validate()

        if (leaveSettingInstance == null) {
            notFound()
            return
        }

        if (leaveSettingInstance.hasErrors()) {
            render  view: 'index',model: [errorInstance:leaveSettingInstance.errors,template:session.activeTab]
            return
        }

        leaveSettingInstance.save flush: true
        flash.message="Leave successfully updated for "+leaveSettingInstance.employee.getFullName()
        redirect(action: "index")

        /*request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LeaveSetting.label', default: 'LeaveSetting'), leaveSettingInstance.id])
                redirect leaveSettingInstance
            }
//            '*' { respond leaveSettingInstance, [status: OK] }
            redirect(action: "index")
        }*/
    }


    @Transactional
    def savePayRoll() {
        def payrollInstance=new Payroll(params)

        if (payrollInstance == null) {
            notFound()
            return
        }

        if (payrollInstance.hasErrors()) {

            render  view: 'index',model: [errorInstance:payrollInstance.errors,template:session.activeTab]
          //  respond payrollInstance.errors, view: 'create'
            return
        }

        payrollInstance.save flush: true
        flash.message="PayRoll successfully created for "+payrollInstance.employee.getFullName()
        redirect(action: "index")

        /*request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'payroll.label', default: 'Payroll'), payrollInstance.id])
                redirect payrollInstance
            }
            '*' { respond payrollInstance, [status: CREATED] }
        }*/
    }

    @Transactional
    def updatePayRoll(Payroll payrollInstance) {
        if (payrollInstance == null) {
            notFound()
            return
        }

        if (payrollInstance.hasErrors()) {
            render  view: 'index',model: [errorInstance:payrollInstance.errors,template:session.activeTab,openForm:"PayRollForm"]
           // respond payrollInstance.errors, view: 'edit'
            return
        }

        payrollInstance.save flush: true

        flash.message="PayRoll successfully updated for "+payrollInstance.employee.getFullName()
        redirect(action: "index")
        /*request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Payroll.label', default: 'Payroll'), payrollInstance.id])
                redirect payrollInstance
            }
            '*' { respond payrollInstance, [status: OK] }
        }*/
    }


}
