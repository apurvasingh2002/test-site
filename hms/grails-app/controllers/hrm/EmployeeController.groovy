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

 /*   @Transactional
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
    }*/

    @Transactional
    def saveEmployee() {

        def employeeInstance=new Employee()
        params.effectiveDate=params.date('effectiveDate', 'dd/MM/yyyy')
        params.dateOfBirth=params.date('dateOfBirth', 'dd/MM/yyyy')
        params.joinDate=  params.date('joinDate', 'dd/MM/yyyy')
        params.terminatedDate=params.date('terminatedDate', 'dd/MM/yyyy')
        employeeInstance.properties=params;
        employeeInstance.validate()

        def map=[:]
        if (employeeInstance == null) {
            map.state=0
            map.msg="Not Found"
        }

        if (employeeInstance.hasErrors()) {
            map.state=0
            map.msg=[]
            for (fieldErrors in employeeInstance.errors) {
                for (error in fieldErrors.allErrors) {
                    map.msg << messageSource.getMessage(error, locale)
                }
            }
        }

        if(employeeInstance.save(flush: true)){
            map.state=1
            map.msg="Employee successfully created: "+employeeInstance.getFullName();
        }
        render map as JSON
    }

    def edit(Employee employeeInstance) {
        respond employeeInstance
    }

    @Transactional
    def updateEmployee() {
        def employeeInstance=Employee.get(params.id)
        params.effectiveDate=params.date('effectiveDate', 'dd/MM/yyyy')
        params.dateOfBirth=params.date('dateOfBirth', 'dd/MM/yyyy')
        params.joinDate=  params.date('joinDate', 'dd/MM/yyyy')
        params.terminatedDate=params.date('terminatedDate', 'dd/MM/yyyy')
        employeeInstance.properties=params;
        employeeInstance.validate()

        def map=[:]
        if (employeeInstance == null) {
            map.state=0
            map.msg="Not Found"
        }

        if (employeeInstance.hasErrors()) {
            map.state=0
            map.msg=[]
            for (fieldErrors in employeeInstance.errors) {
                for (error in fieldErrors.allErrors) {
                    map.msg << messageSource.getMessage(error, locale)
                }
            }
        }

        if(employeeInstance.save(flush: true)){
            map.state=1
            map.msg="Employee successfully updated: "+employeeInstance.getFullName();
        }
        render map as JSON
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
        def leaveSettingInstance=new LeaveSetting()
        params.toDate=params.date('toDate', 'dd/MM/yyyy')
        params.fromDate=params.date('fromDate', 'dd/MM/yyyy')
        params.days=  params.toDate -  params.fromDate
        params.status=LeaveStatus.UNAPPROVED;
        leaveSettingInstance.properties=params;
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
    def updateLeave() {
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
        def payrollInstance=new Payroll()
        params.promotionDate=params.date('promotionDate', 'dd/MM/yyyy')
        payrollInstance.properties=params
        payrollInstance.validate()


        def map=[:]
        if (payrollInstance == null) {
            map.state=0
            map.msg="Not Found"
        }

        if (payrollInstance.hasErrors()) {
            map.state=0
            map.msg=[]
            for (fieldErrors in payrollInstance.errors) {
                for (error in fieldErrors.allErrors) {
                    map.msg << messageSource.getMessage(error, locale)
                }
            }
        }

        if(payrollInstance.save(flush: true)){
            map.state=1
            map.msg="Leave successfully updated for "+payrollInstance.employee.getFullName();
        }

        render map as JSON
    }

    @Transactional
    def updatePayRoll() {
        def payrollInstance=Payroll.get(params.id)
        params.promotionDate=params.date('promotionDate', 'dd/MM/yyyy')
        payrollInstance.properties=params
        payrollInstance.validate()


        def map=[:]
        if (payrollInstance == null) {
            map.state=0
            map.msg="Not Found"
        }

        if (payrollInstance.hasErrors()) {
            map.state=0
            map.msg=[]
            for (fieldErrors in payrollInstance.errors) {
                for (error in fieldErrors.allErrors) {
                    map.msg << messageSource.getMessage(error, locale)
                }
            }
        }

        if(payrollInstance.save(flush: true)){
            map.state=1
            map.msg="Leave successfully updated for "+payrollInstance.employee.getFullName();
        }

        render map as JSON
    }


}
