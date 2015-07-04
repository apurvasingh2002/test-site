package hrm

import Enums.LeaveStatus
import Enums.LeaveType

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LeaveSettingController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LeaveSetting.list(params), model: [leaveSettingInstanceCount: LeaveSetting.count()]
    }

    def show(LeaveSetting leaveSettingInstance) {
        respond leaveSettingInstance
    }

    def create() {
        respond new LeaveSetting(params)
    }

    @Transactional
    def save(LeaveSetting leaveSettingInstance) {

        leaveSettingInstance.employee=Employee.get(1);
        leaveSettingInstance.days=  leaveSettingInstance.toDate -  leaveSettingInstance.fromDate
        leaveSettingInstance.status=LeaveStatus.UNAPPROVED;



        leaveSettingInstance.validate()

        if (leaveSettingInstance == null) {
           // println "here 1"
            notFound()
            return
        }



        if (leaveSettingInstance.hasErrors()) {
            //println "here 2"
            respond leaveSettingInstance.errors, view: 'create'
            return
        }



        leaveSettingInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'leaveSetting.label', default: 'LeaveSetting'), leaveSettingInstance.id])
                redirect leaveSettingInstance
            }
            '*' { respond leaveSettingInstance, [status: CREATED] }
        }
    }

    def edit(LeaveSetting leaveSettingInstance) {
        respond leaveSettingInstance
    }

    @Transactional
    def update(LeaveSetting leaveSettingInstance) {

        leaveSettingInstance.days=  leaveSettingInstance.toDate -  leaveSettingInstance.fromDate
        leaveSettingInstance.validate()


        if (leaveSettingInstance == null) {
            notFound()
            return
        }

        if (leaveSettingInstance.hasErrors()) {
            respond leaveSettingInstance.errors, view: 'edit'
            return
        }

        leaveSettingInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LeaveSetting.label', default: 'LeaveSetting'), leaveSettingInstance.id])
                redirect leaveSettingInstance
            }
            '*' { respond leaveSettingInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LeaveSetting leaveSettingInstance) {

        if (leaveSettingInstance == null) {
            notFound()
            return
        }

        leaveSettingInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LeaveSetting.label', default: 'LeaveSetting'), leaveSettingInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'leaveSetting.label', default: 'LeaveSetting'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
