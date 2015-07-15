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
    def messageSource
    def locale = Locale.default

    def index() {
          model:[template: (session.activeTab ? session.activeTab : 'Employee')]
//        params.max = Math.min(params.max ?: 10, 100)
//        respond Employee.list(params), model:[employeeInstanceCount: Employee.count()]
    }

    def renderTemplate(){
        session.activeTab = params.template
        redirect(action: 'render'+(params.template),params: params)
    }

    def renderFormTemplate(){
        redirect(action: 'render'+(params.template),params: params)
    }

    def renderEmployee(){
        render template: 'employee' , model:[employeeInstanceList:Employee.list(params),employeeInstanceCount: Employee.count()]
    }

    def renderLeave(){
        render template: 'leave' , model: [leaveInstanceList:LeaveSetting.list(params),leaveCount: LeaveSetting.count()]
    }

    def renderPayroll(){
        render template: 'payroll' , model: [payRollInstanceList:Payroll.list(params),payRollCount: Payroll.count()]
    }

    def renderEmployeeForm() {
        def employee;
        if(params.id)
            employee=Employee.get(params.id)
        else
            employee=new Employee()

        render template: 'employeeForm' ,model:[employeeInstance:employee]
    }


    def renderLeaveForm() {
        def leaveSettingInstance;
        if(params.id)
            leaveSettingInstance=LeaveSetting.get(params.id)
        else
            leaveSettingInstance=new LeaveSetting(params)

        render template: 'leaveForm' ,model:[leaveSettingInstance:leaveSettingInstance]
    }


    def renderPayRollForm() {
        def payRollInstance;
        if(params.id)
            payRollInstance=Payroll.get(params.id)
        else
            payRollInstance=new Payroll(params)
        render template: 'payRollForm' ,model:[payRollInstance:payRollInstance]
    }

//    @Transactional
    def saveEmployee() {
        println params
        def (status,message) = employeeService.saveEmployee(params)
        println "status :: "+status+" message :: "+message
        if(status){
                flash.message = message(code: 'default.created.message', args: ['Employee'])
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
        params.toDate=params.date('toDate', 'dd/MM/yyyy')
        params.fromDate=params.date('fromDate', 'dd/MM/yyyy')
        params.days=  params.toDate -  params.fromDate
        leaveSettingInstance.status=LeaveStatus.UNAPPROVED;
        leaveSettingInstance.validate()

        def map=[:]
        if (leaveSettingInstance == null) {
            map.state=0
            map.msg="Not Found"
        }

        if (leaveSettingInstance.hasErrors()) {
            map.state=0
            map.msg=[]
            for (fieldErrors in leaveSettingInstance.errors) {
                for (error in fieldErrors.allErrors) {
                    map.msg << messageSource.getMessage(error, locale)
                }
            }
        }

        if(leaveSettingInstance.save(flush: true)){
            map.state=1
            map.msg="Leave successfully created for "+leaveSettingInstance.employee.getFullName();
        }
        render map as JSON

    }


    @Transactional
    def updateLeave(LeaveSetting lins) {

        def leaveSettingInstance=LeaveSetting.get(params.id)
        params.toDate=params.date('toDate', 'dd/MM/yyyy')
        params.fromDate=params.date('fromDate', 'dd/MM/yyyy')
        params.days=  params.toDate -  params.fromDate
        leaveSettingInstance.properties=params
        leaveSettingInstance.validate()

        def map=[:]

        if (leaveSettingInstance == null) {
            map.state=0
            map.msg="Not Found"
        }

        if (leaveSettingInstance.hasErrors()) {
            map.state=0
            map.msg=[]
            for (fieldErrors in leaveSettingInstance.errors) {
                for (error in fieldErrors.allErrors) {
                    map.msg << messageSource.getMessage(error, locale)
                }
            }
        }

        if(leaveSettingInstance.save(flush: true)){
            map.state=1
            map.msg="Leave successfully updated for "+leaveSettingInstance.employee.getFullName();
        }
        render map as JSON
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
