<%@ page import="Enums.*;java.util.EnumSet;hrm.Employee;hrm.Designation;hrm.Departments" %>
<div class="modal-dialog" style="width: 800px;">
    <div class="modal-content">

        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Employee</h4>
            </div>
        <div class="message alert alert-danger hide" role="status">

        </div>
            <div class="modal-body">
        <g:uploadForm id="gForm" url="[controller: 'employee', action:employeeInstance.id?'updateEmployee':'saveEmployee',params:[id:employeeInstance.id] ]"  method="${employeeInstance.id?'POST':'PUT'}" >

            <table class="form-table">
                    <tr>
                        <td><label>First Name: <input type="text" name="firstName" value="${employeeInstance?.firstName}"/></label></td>
                        <td><label>Middle Name: <input type="text" name="middleName" value="${employeeInstance?.middleName}"/></label></td>
                        <td><label>Last Name: <input type="text" name="lastName" value="${employeeInstance?.lastName}"/></label></td>
                    </tr>
                    <tr>
                        <td><label>Date Of Birth:<input  name="dateOfBirth" id="dateOfBirth" data-date-format="dd/mm/yyyy" data-provide="datepicker" value="${formatDate(format: 'dd/MM/yyyy', date: employeeInstance?.dateOfBirth)}" ></label></td>
                        <td><label>Gender:
                        <g:select noSelection="${[null:'Select One...']}" name="gender" class="form-control" from="${Employee.constraints.gender.inList}" required="" value="${employeeInstance?.gender}" />
                        </label></td>
                        <td><label>Martial Status:
                            %{--<input type="text" name="maritalStatus" value="${employeeInstance?.maritalStatus}" />--}%
                            <g:select noSelection="${[null:'Select One...']}" name="maritalStatus" class="form-control" from="${Employee.constraints.maritalStatus.inList}" required="" value="${employeeInstance?.maritalStatus}" />
                        </label></td>
                    </tr>
                    <tr>
                        <td><label>Nationality: <input type="text" name="nationality"  value="${employeeInstance?.nationality}"/></label></td>
                        <td><label>Country: <input type="text" name="country"  value="${employeeInstance?.country}"/></label></td>
                        <td><label>Permanent Address: <input type="text" name="permanentAddress" value="${employeeInstance?.permanentAddress}" /></label></td>
                    </tr>
                    <tr>
                        <td><label>Temporary Address: <input type="text" name="temporaryAddress"  value="${employeeInstance?.temporaryAddress}"/></label></td>
                        <td><label>Mobile: <input type="text" name="mobile" value="${employeeInstance?.mobile}" /></label></td>
                        <td><label>Work Phone: <input type="text"  name="workPhone" value="${employeeInstance?.workPhone}" /></label></td>
                    </tr>
                    <tr>
                        <td><label>Home Phone: <input type="text" name="homePhone"  value="${employeeInstance?.homePhone}"/></label></td>
                        <td><label>Email Address: <input type="text" name="email"  value="${employeeInstance?.email}" /></label></td>
                        <td><label>Alternate Email Address: <input type="text" name="alterEmail" value="${employeeInstance?.alterEmail}" /></label></td>
                    </tr>
                    <tr>
                        <td><label>Status: %{--<g:select noSelection="${[null:'Select One...']}" name="status" from="${EnumSet.allOf(EmployeeStatus).value}"  value="${employeeInstance?.status}"/>--}%
                        <g:select noSelection="${[null:'Select One...']}" name="status" class="form-control" from="${Enums.EmployeeStatus?.values()}" keys="${Enums.EmployeeStatus.values()*.name()}" required="" value="${employeeInstance?.status?.name()}" />
                        </label></td>
                        <td><label>Department: <g:select noSelection="${[null:'Select One...']}" name="department" from="${Departments.list()}" optionKey="id" optionValue="name" value="${employeeInstance?.departments?.id}"/></label></td>
                        <td><label>Designation: <g:select noSelection="${[null:'Select One...']}" name="designation" from="${Designation.list()}" optionKey="id" optionValue="name"   value="${employeeInstance?.designation?.id}"/></label></td>
                    </tr>
                    <tr>
                        <td><label>Effective Date: <input  name="effectiveDate"  id="effectiveDate" data-date-format="dd/mm/yyyy" data-provide="datepicker" value="${formatDate(format: 'dd/MM/yyyy', date: employeeInstance?.effectiveDate)}" ></label></td>
                        <td><label>Join Date: <input  name="joinDate"  id="joinDate" data-date-format="dd/mm/yyyy" data-provide="datepicker" value="${formatDate(format: 'dd/MM/yyyy', date: employeeInstance?.joinDate)}" ></label></td>
                        <td><label>Termination Date:  <input  name="terminatedDate"  id="terminatedDate" data-date-format="dd/mm/yyyy" data-provide="datepicker" value="${formatDate(format: 'dd/MM/yyyy', date: employeeInstance?.terminatedDate)}" >
                        </label></td>
                    </tr>
                    <tr>
                       <td><label style="text-align: left;">Supervisor: <g:select noSelection="${[null:'Select One...']}" name="supervisor" from="${Employee.list()}" optionValue="firstName" optionKey="id"   value="${employeeInstance?.supervisor?.id}"/></label></td>
                       <td><label>File Name: <input type="file" name="filename"  value="${employeeInstance?.filename}" /></label></td>
                       <td></td>
                    </tr>
                </table>
        </g:uploadForm>
            </div>



        <div class="modal-footer">
            %{--<g:submitButton name="create" class="save btn btn-primary"
                            value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
            <button type="button" class="save btn btn-primary" onclick="submitForm('Employee')" >${(employeeInstance?.id)?'Update':'Save'}</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        </div>
    </div>
</div>