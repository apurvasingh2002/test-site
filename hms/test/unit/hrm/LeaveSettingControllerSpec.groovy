package hrm


import grails.test.mixin.*
import spock.lang.*

@TestFor(LeaveSettingController)
@Mock(LeaveSetting)
class LeaveSettingControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.leaveSettingInstanceList
        model.leaveSettingInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.leaveSettingInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def leaveSetting = new LeaveSetting()
        leaveSetting.validate()
        controller.save(leaveSetting)

        then: "The create view is rendered again with the correct model"
        model.leaveSettingInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        leaveSetting = new LeaveSetting(params)

        controller.save(leaveSetting)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/leaveSetting/show/1'
        controller.flash.message != null
        LeaveSetting.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def leaveSetting = new LeaveSetting(params)
        controller.show(leaveSetting)

        then: "A model is populated containing the domain instance"
        model.leaveSettingInstance == leaveSetting
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def leaveSetting = new LeaveSetting(params)
        controller.edit(leaveSetting)

        then: "A model is populated containing the domain instance"
        model.leaveSettingInstance == leaveSetting
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/leaveSetting/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def leaveSetting = new LeaveSetting()
        leaveSetting.validate()
        controller.update(leaveSetting)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.leaveSettingInstance == leaveSetting

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        leaveSetting = new LeaveSetting(params).save(flush: true)
        controller.update(leaveSetting)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/leaveSetting/show/$leaveSetting.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/leaveSetting/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def leaveSetting = new LeaveSetting(params).save(flush: true)

        then: "It exists"
        LeaveSetting.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(leaveSetting)

        then: "The instance is deleted"
        LeaveSetting.count() == 0
        response.redirectedUrl == '/leaveSetting/index'
        flash.message != null
    }
}
