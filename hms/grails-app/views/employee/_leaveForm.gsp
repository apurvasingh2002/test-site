<%@ page import="Enums.*;java.util.EnumSet;hrm.Employee;hrm.Designation;hrm.Departments" %>
<div class="modal-dialog" style="width: 800px;">
    <div class="modal-content">
        %{--<g:form url="[resource:objectInstance, controller: 'employee', action:objectInstance.id?'update':'save' ]"  method="${objectInstance.id?'POST':'PUT'}" >--}%


        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Create Leave</h4>
        </div>

        <div class="message alert alert-danger hide" role="status">

        </div>

        <div class="modal-body">
            <g:form id="gForm"
                    url="[controller: 'employee', action: 'save', params: [id: objectInstance?.id]]"
                    method="POST">
                <g:hiddenField name="className" value="${className}"/>
                <table class="form-table">
                    <tr>
                        <td>
                            <div>
                                <g:radioGroup name="noOfDays"
                                              labels="['Single Day', 'Multiple Days']"
                                              values="[0,1]"
                                              value="${(objectInstance?.days>1)?1:0}">
                                    <label style="width: 100px !important">
                                        <span class="radioSpan">${it.radio}${it.label}</span>
                                    </label>
                                </g:radioGroup>

                            </div></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td><label>Employee:
                        %{--<g:select noSelection="${[null:'Select One...']}" name="employee.id" from="${hrm.Employee.list()}" optionValue="firstName" optionKey="id" required="" value="${objectInstance?.employee?.id}" />--}%
                        <g:select noSelection="${[null: 'Select One...']}" id="employee" name="employee"
                                  from="${hrm.Employee.list()}" optionKey="id" optionValue="firstName" required=""
                                  value="${objectInstance?.employee?.id}" class="many-to-one"/>
                        </label></td>
                        <td>

                        </td>

                    </tr>
                    <tr>
                        <td><label>Leave Type:<g:select noSelection="${[null: 'Select One...']}" name="type"
                                                        from="${Enums.LeaveType?.values()}"
                                                        keys="${Enums.LeaveType.values()*.name()}" required=""
                                                        value="${objectInstance?.type?.name()}"/></label></td>
                        <td>
                            <label>Leave Status:
                            <g:if test="${objectInstance.id}">
                                <g:select name="status" from="${Enums.LeaveStatus?.values()}"
                                          keys="${Enums.LeaveStatus.values()*.name()}" required=""
                                          value="${objectInstance?.status?.name()}"/>
                            </g:if>
                            <g:else>
                                Pending
                            </g:else>

                            </label>

                        </td>

                    </tr>
                    <tr>
                        <td><label>From Date:
                        %{--<g:datePicker name="fromDate" precision="day"  value="${objectInstance?.fromDate}"  />--}%
                            <input name="fromDate" placeholder="From Date" id="fromDate" data-date-format="dd/mm/yyyy"
                                   data-provide="datepicker"
                                   value="${formatDate(format: 'dd/MM/yyyy', date: objectInstance?.fromDate)}">

                        </label></td>
                        <td><label>To Date:
                            <input name="toDate" placeholder="To Date" id="toDate" data-date-format="dd/mm/yyyy"
                                   data-provide="datepicker"
                                   value="${formatDate(format: 'dd/MM/yyyy', date: objectInstance?.toDate)}">

                        </label></td>
                    </tr>
                    <tr>
                        <td><label>Leave Duration:
                            <div>
                                <g:radioGroup name="duration"
                                              labels="['First Half', 'Second Half', 'Full']"
                                              values="[0.5, 1.0, 0.0]"
                                              value="${objectInstance?.duration ? objectInstance?.duration : 0.0}">
                                    <label style="width: 100px !important">
                                        <span class="radioSpan">${it.radio}${it.label}</span>
                                    </label>
                                </g:radioGroup>

                            </div>

                            <div style="clear: both"></div>
                        </label></td>

                        <td><label>Reason: <g:textArea name="reason" required=""
                                                       value="${objectInstance?.reason}"/></label></td>

                    </tr>
                </table>
            </g:form>
        </div>

        <div class="modal-footer">
            %{--<g:submitButton name="create" class="save btn btn-primary"
                            value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
            <button type="button" class="save btn btn-primary"
                    onclick="submitForm('leaveSetting', 'LeaveSetting')">${objectInstance.id ? 'Update' : 'Save'}</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        </div>

    </div>
</div>