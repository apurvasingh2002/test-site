<%@ page import="Enums.*;java.util.EnumSet;hrm.Employee;hrm.Designation;hrm.Departments" %>
<div class="modal-dialog" style="width: 800px;overflow-y: initial;">
    <div class="modal-content">

        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Create Employee</h4>
        </div>

        <div class="message alert alert-danger hide" role="status">

        </div>

        <div class="modal-body" style="overflow-y: auto;height: 450px;">
            <g:uploadForm id="gForm"
                          url="[controller: 'employee', action: 'save', params: [id: objectInstance?.id]]"
                          method="POST">
                <g:hiddenField name="className" value="${className}"/>
                <table class="form-table">
                    <tr>
                        <td><label>First Name: <input type="text" name="firstName"
                                                      value="${objectInstance?.firstName}"/></label></td>
                        <td><label>Middle Name: <input type="text" name="middleName"
                                                       value="${objectInstance?.middleName}"/></label></td>
                        <td><label>Last Name: <input type="text" name="lastName" value="${objectInstance?.lastName}"/>
                        </label></td>
                    </tr>
                    <tr>
                        <td><label>Date Of Birth:<input name="dateOfBirth" id="dateOfBirth"
                                                        data-date-format="dd/mm/yyyy" data-provide="datepicker"
                                                        value="${formatDate(format: 'dd/MM/yyyy', date: objectInstance?.dateOfBirth)}">
                        </label></td>
                        <td><label>Gender:
                        <g:select noSelection="${[null: 'Select One...']}" name="gender" class="form-control"
                                  from="${Employee.constraints.gender.inList}" required=""
                                  value="${objectInstance?.gender}"/>
                        </label></td>
                        <td><label>Martial Status:
                        %{--<input type="text" name="maritalStatus" value="${objectInstance?.maritalStatus}" />--}%
                        <g:select noSelection="${[null: 'Select One...']}" name="maritalStatus" class="form-control"
                                  from="${Employee.constraints.maritalStatus.inList}" required=""
                                  value="${objectInstance?.maritalStatus}"/>
                        </label></td>
                    </tr>
                    <tr>
                        <td><label>Nationality: <input type="text" name="nationality"
                                                       value="${objectInstance?.nationality}"/></label></td>
                        <td><label>Country: <input type="text" name="country" value="${objectInstance?.country}"/>
                        </label></td>
                        <td><label>Permanent Address: <input type="text" name="permanentAddress"
                                                             value="${objectInstance?.permanentAddress}"/></label></td>
                    </tr>
                    <tr>
                        <td><label>Temporary Address: <input type="text" name="temporaryAddress"
                                                             value="${objectInstance?.temporaryAddress}"/></label></td>
                        <td><label>Mobile: <input type="text" name="mobile" value="${objectInstance?.mobile}"/></label>
                        </td>
                        <td><label>Work Phone: <input type="text" name="workPhone"
                                                      value="${objectInstance?.workPhone}"/></label></td>
                    </tr>
                    <tr>
                        <td><label>Home Phone: <input type="text" name="homePhone"
                                                      value="${objectInstance?.homePhone}"/></label></td>
                        <td><label>Email Address: <input type="text" name="email" value="${objectInstance?.email}"/>
                        </label></td>
                        <td><label>Alternate Email Address: <input type="text" name="alterEmail"
                                                                   value="${objectInstance?.alterEmail}"/></label></td>
                    </tr>
                    <tr>
                        <td><label>Status: %{--<g:select noSelection="${[null:'Select One...']}" name="status" from="${EnumSet.allOf(EmployeeStatus).value}"  value="${objectInstance?.status}"/>--}%
                        <g:select noSelection="${[null: 'Select One...']}" name="status" class="form-control"
                                  from="${Enums.EmployeeStatus?.values()}"
                                  keys="${Enums.EmployeeStatus.values()*.name()}" required=""
                                  value="${objectInstance?.status?.name()}"/>
                        </label></td>
                        <td><label>Department: <g:select noSelection="${[null: 'Select One...']}" name="department"
                                                         from="${Departments.list()}" optionKey="id" optionValue="name"
                                                         value="${objectInstance?.departments?.id}"/></label></td>
                        <td><label>Designation: <g:select noSelection="${[null: 'Select One...']}" name="designation"
                                                          from="${Designation.list()}" optionKey="id" optionValue="name"
                                                          value="${objectInstance?.designation?.id}"/></label></td>
                    </tr>
                    <tr>
                        <td><label>Effective Date: <input name="effectiveDate" id="effectiveDate"
                                                          data-date-format="dd/mm/yyyy" data-provide="datepicker"
                                                          value="${formatDate(format: 'dd/MM/yyyy', date: objectInstance?.effectiveDate)}">
                        </label></td>
                        <td><label>Join Date: <input name="joinDate" id="joinDate" data-date-format="dd/mm/yyyy"
                                                     data-provide="datepicker"
                                                     value="${formatDate(format: 'dd/MM/yyyy', date: objectInstance?.joinDate)}">
                        </label></td>
                        <td><label>Termination Date:  <input name="terminatedDate" id="terminatedDate"
                                                             data-date-format="dd/mm/yyyy" data-provide="datepicker"
                                                             value="${formatDate(format: 'dd/MM/yyyy', date: objectInstance?.terminatedDate)}">
                        </label></td>
                    </tr>
                    <tr>
                        <td><label style="text-align: left;">Supervisor: <g:select
                                noSelection="${[null: 'Select One...']}" name="supervisor" from="${Employee.list()}"
                                optionValue="firstName" optionKey="id"
                                value="${objectInstance?.supervisor?.id}"/></label></td>
                        <td><label>File Name: <input type="file" name="filename" value="${objectInstance?.filename}"/>
                        </label></td>
                        <td></td>
                    </tr>
                </table>
            </g:uploadForm>
        </div>


        <div class="modal-footer">
            %{--<g:submitButton name="create" class="save btn btn-primary"
                            value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
            <button type="button" class="save btn btn-primary"
                    onclick="submitForm('employee', 'Employee')">${(objectInstance?.id) ? 'Update' : 'Save'}</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        </div>
    </div>
</div>