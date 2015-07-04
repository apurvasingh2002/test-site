package hrm


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PayrollController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Payroll.list(params), model: [payrollInstanceCount: Payroll.count()]
    }

    def show(Payroll payrollInstance) {
        respond payrollInstance
    }

    def create() {
        respond new Payroll(params)
    }

    @Transactional
    def save(Payroll payrollInstance) {
        if (payrollInstance == null) {
            notFound()
            return
        }

        if (payrollInstance.hasErrors()) {
            respond payrollInstance.errors, view: 'create'
            return
        }

        payrollInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'payroll.label', default: 'Payroll'), payrollInstance.id])
                redirect payrollInstance
            }
            '*' { respond payrollInstance, [status: CREATED] }
        }
    }

    def edit(Payroll payrollInstance) {
        respond payrollInstance
    }

    @Transactional
    def update(Payroll payrollInstance) {
        if (payrollInstance == null) {
            notFound()
            return
        }

        if (payrollInstance.hasErrors()) {
            respond payrollInstance.errors, view: 'edit'
            return
        }

        payrollInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Payroll.label', default: 'Payroll'), payrollInstance.id])
                redirect payrollInstance
            }
            '*' { respond payrollInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Payroll payrollInstance) {

        if (payrollInstance == null) {
            notFound()
            return
        }

        payrollInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Payroll.label', default: 'Payroll'), payrollInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'payroll.label', default: 'Payroll'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
