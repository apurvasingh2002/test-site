<%@ page import="Enums.*;java.util.EnumSet;hrm.Employee;hrm.Designation;hrm.Departments" %>
<div class="modal-dialog" style="width: 800px;">
    <div class="modal-content">
        %{--<g:form url="[resource:leaveSettingInstance, controller: 'employee', action:leaveSettingInstance.id?'update':'save' ]"  method="${leaveSettingInstance.id?'POST':'PUT'}" >--}%
        <g:form url="[controller: 'employee', action:payRollInstance.id?'updatePayRoll':'savePayRoll',params:[id:payRollInstance.id] ]"  method="${payRollInstance.id?'POST':'PUT'}" >

            <g:hiddenField name="version" value="${payRollInstance?.version}" />
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create PayRoll</h4>
            </div>
            <div class="modal-body">
                <table class="form-table">
                    <tr>


                        <td><label>Employee: <g:select name="employee" from="${hrm.Employee.list()}" optionValue="firstName" optionKey="id" required="" value="${payRollInstance?.employee?.id}" noSelection="${[null:'Select One...']}"></g:select></label></td>
                        <td></td>


                    </tr>
                    <tr>
                        <td><label>Promotion Date: <g:datePicker name="promotionDate" precision="day"  value="${payRollInstance?.promotionDate}"  /></label></td>
                        <td><label>Salary: <g:textField name="salary" required="" value="${payRollInstance?.salary}"/></label></td>
                    </tr>

                </table>
            </div>
            <div class="modal-footer">
                <g:submitButton name="create" class="save btn btn-primary"
                                value="${message(code: 'default.button.create.label', default: 'Create')}" />
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </g:form>
    </div>
</div>