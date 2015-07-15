<%@ page import="Enums.*;java.util.EnumSet;hrm.Employee;hrm.Designation;hrm.Departments" %>
<div class="modal-dialog" style="width: 800px;">
    <div class="modal-content">
        <div class="message alert alert-danger hide" role="status">

        </div>
        %{--<g:form url="[resource:leaveSettingInstance, controller: 'employee', action:leaveSettingInstance.id?'update':'save' ]"  method="${leaveSettingInstance.id?'POST':'PUT'}" >--}%

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create PayRoll</h4>
            </div>
            <div class="modal-body">
        <g:form id="gForm" url="[controller: 'employee', action:objectInstance.id?'updatePayRoll':'savePayRoll',params:[id:objectInstance.id] ]"  method="${objectInstance.id?'POST':'PUT'}" >

            <g:hiddenField name="version" value="${objectInstance?.version}" />
                <table class="form-table">
                    <tr>


                        <td><label>Employee: <g:select name="employee" from="${hrm.Employee.list()}" optionValue="firstName" optionKey="id" required="" value="${objectInstance?.employee?.id}" noSelection="${[null:'Select One...']}"></g:select></label></td>
                        <td></td>


                    </tr>
                    <tr>
                        <td><label>Promotion Date:
                            <input  name="promotionDate" placeholder="Promotion Date" id="promotionDate" data-date-format="dd/mm/yyyy" data-provide="datepicker" value="${formatDate(format: 'dd/MM/yyyy', date: objectInstance?.promotionDate)}" >
                        </label>
                        </td>
                        <td><label>Salary: <g:textField name="salary" required="" value="${objectInstance?.salary}"/></label></td>
                    </tr>

                </table>
        </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="save btn btn-primary" onclick="submitForm('Payroll')" >${objectInstance.id?'Update':'Save'}</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>

    </div>
</div>