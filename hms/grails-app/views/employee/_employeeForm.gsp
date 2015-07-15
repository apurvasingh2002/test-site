<%@ page import="Enums.*;java.util.EnumSet;hrm.Employee;hrm.Designation;hrm.Departments" %>
<div class="modal-dialog" style="width: 800px;">
    <div class="modal-content">
        %{--<form>--}%
<g:form url="[resource:employeeInstance, action:'saveEmployee']" >
    %{--<g:form url="[resource:leaveSettingInstance, action:'update']" method="PUT" >--}%
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Employee</h4>
            </div>
            <div class="modal-body">
                <table class="form-table">
                    <tr>
                        <td><label>First Name: <input type="text" name="firstName" value="${objectInstance?.firstName}"/></label></td>
                        <td><label>Middle Name: <input type="text" name="middleName" value="${objectInstance?.middleName}"/></label></td>
                        <td><label>Last Name: <input type="text" name="lastName" value="${objectInstance?.lastName}"/></label></td>
                    </tr>
                    <tr>
                        <td><label>Date Of Birth: <input type="text" name="dateOfBirth"  value="${objectInstance?.dateOfBirth}" /></label></td>
                        <td><label>Gender: <input type="text" name="gender" value="${objectInstance?.gender}" /></label></td>
                        <td><label>Martial Status: <input type="text" name="maritalStatus" value="${objectInstance?.maritalStatus}" /></label></td>
                    </tr>
                    <tr>
                        <td><label>Nationality: <input type="text" name="nationality"  value="${objectInstance?.nationality}"/></label></td>
                        <td><label>Country: <input type="text" name="country"  value="${objectInstance?.country}"/></label></td>
                        <td><label>Permanent Address: <input type="text" name="permanentAddress" value="${objectInstance?.permanentAddress}" /></label></td>
                    </tr>
                    <tr>
                        <td><label>Temporary Address: <input type="text" name="temporaryAddress"  value="${objectInstance?.temporaryAddress}"/></label></td>
                        <td><label>Mobile: <input type="text" name="mobile" value="${objectInstance?.mobile}" /></label></td>
                        <td><label>Work Phone: <input type="text"  name="workPhone" value="${objectInstance?.workPhone}" /></label></td>
                    </tr>
                    <tr>
                        <td><label>Home Phone: <input type="text" name="homePhone"  value="${objectInstance?.homePhone}"/></label></td>
                        <td><label>Email Address: <input type="text" name="email"  value="${objectInstance?.email}" /></label></td>
                        <td><label>Alternate Email Address: <input type="text" name="alterEmail" value="${objectInstance?.alterEmail}" /></label></td>
                    </tr>
                    <tr>
                        <td><label>Status: <g:select noSelection="${[null:'Select One...']}" name="status" from="${EnumSet.allOf(LeaveStatus).value}"  value="${objectInstance?.status}"/></label></td>
                        <td><label>Department: <g:select noSelection="${[null:'Select One...']}" name="department" from="${Departments.list()}" optionKey="id" optionValue="name" value="${objectInstance?.departments}"/></label></td>
                        <td><label>Designation: <g:select noSelection="${[null:'Select One...']}" name="designation" from="${Designation.list()}" optionKey="id" optionValue="name"   value="${objectInstance?.designation}"/></label></td>
                    </tr>
                    <tr>
                        <td><label>Effective Date: <input type="text" name="effectiveDate"  value="${objectInstance?.effectiveDate}" /></label></td>
                        <td><label>Join Date: <input type="text" name="joinDate"  value="${objectInstance?.joinDate}"/></label></td>
                        <td><label>Termination Date: <input type="text" name="terminatedDate" value="${objectInstance?.terminatedDate}" /></label></td>
                    </tr>
                    <tr>
                       <td><label style="text-align: left;">Supervisor: <g:select noSelection="${[null:'Select One...']}" name="supervisor" from="${Employee.list()}" optionValue="firstName" optionKey="id"   value="${employeeInstance?.supervisor}"/></label></td>
                       <td><label>File Name: <input type="text" name="filename"  value="${objectInstance?.filename}" /></label></td>
                       <td><label><input type="button" value="Browse" %{--style="margin-right: 20px; width: 100px;"--}%></label></td>
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