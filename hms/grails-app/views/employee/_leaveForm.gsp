<%@ page import="Enums.*;java.util.EnumSet;hrm.Employee;hrm.Designation;hrm.Departments" %>
<div class="modal-dialog" style="width: 800px;">
    <div class="modal-content">
        %{--<g:form url="[resource:leaveSettingInstance, controller: 'employee', action:leaveSettingInstance.id?'update':'save' ]"  method="${leaveSettingInstance.id?'POST':'PUT'}" >--}%
        <g:form url="[controller: 'employee', action:objectInstance.id?'updateLeave':'saveLeave',params:[id:objectInstance.id] ]"  method="${objectInstance.id?'POST':'PUT'}" >

            <g:hiddenField name="version" value="${objectInstance?.version}" />
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Leave</h4>
            </div>
            <div class="modal-body">
                <table class="form-table">
                    <tr>
                        <td><label>Leave Type:<g:select noSelection="${[null:'Select One...']}" name="type" from="${LeaveType?.values()}"
                                            keys="${LeaveType.values()*.name()}" required="" value="${objectInstance?.type?.name()}"/>
                        </label></td>
                        <td>
                            <label>Leave Status:
                            <g:if test="${objectInstance.id}">
                                <g:select name="status" from="${LeaveStatus?.values()}" keys="${LeaveStatus.values()*.name()}" required="" value="${objectInstance?.status?.name()}" />
                            </g:if>
                            <g:else>
                                Pending
                            </g:else>


                        </label>

                        </td>

                    </tr>
                    <tr>
                        <td><label>From Date: <g:datePicker name="fromDate" precision="day"  value="${objectInstance?.fromDate}"  /></label></td>
                        <td><label>To Date: <g:datePicker name="toDate" precision="day"  value="${objectInstance?.toDate}"  /></label></td>
                    </tr>
                    <tr>
                        <td><label>Leave Duration:
                            <div>
                                <g:radioGroup name="duration"
                                              labels="['First Half','Second Half','Full']"
                                              values="[0.5,1.0,0.0]"
                                              value="${objectInstance?.duration?objectInstance?.duration:0.0}">
                                    <label  style="width: 100px !important">
                                        <span class="radioSpan" >${it.radio}${it.label}</span>
                                    </label>
                                </g:radioGroup>

                            </div>
                            <div style="clear: both"></div>
                        </label></td>

                        <td><label>Reason: <g:textArea name="reason" required="" value="${objectInstance?.reason}"/></label></td>


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