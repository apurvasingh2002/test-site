<%@ page import="hrm.LeaveSetting" %>



<div class="fieldcontain ${hasErrors(bean: leaveSettingInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="leaveSetting.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${Enums.LeaveType?.values()}" keys="${Enums.LeaveType.values()*.name()}" required="" value="${leaveSettingInstance?.type?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: leaveSettingInstance, field: 'reason', 'error')} required">
	<label for="reason">
		<g:message code="leaveSetting.reason.label" default="Reason" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="reason" required="" value="${leaveSettingInstance?.reason}"/>

</div>




<div class="fieldcontain ${hasErrors(bean: leaveSettingInstance, field: 'first', 'error')} ">
	<label for="first">
		<g:message code="leaveSetting.first.label" default="Duration" />
		
	</label>

	<div>
	%{--<g:checkBox name="first" value="${leaveSettingInstance?.first}" />--}%
		<g:radioGroup name="duration"
					  labels="['First Half','Second Half','Full']"
					  values="[0.5,1.0,0.0]"
					  value="${leaveSettingInstance?.duration?leaveSettingInstance?.duration:0.0}">
		%{--<p>${it.label} ${it.radio}</p>--}%
			<label>
				<span class="radioSpan">${it.radio}</span>
				${it.label}
			</label>
		</g:radioGroup>

	</div>
	<div style="clear: both"></div>

</div>

<div class="fieldcontain ${hasErrors(bean: leaveSettingInstance, field: 'fromDate', 'error')} required">
	<label for="fromDate">
		<g:message code="leaveSetting.fromDate.label" default="From Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fromDate" precision="day"  value="${leaveSettingInstance?.fromDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: leaveSettingInstance, field: 'toDate', 'error')} required">
	<label for="toDate">
		<g:message code="leaveSetting.toDate.label" default="To Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="toDate" precision="day"  value="${leaveSettingInstance?.toDate}"  />

</div>
<g:if test="${params.id}">
	<div class="fieldcontain ${hasErrors(bean: leaveSettingInstance, field: 'type', 'error')} required">
		<label for="type">
			<g:message code="leaveSetting.type.label" default="Status" />
			<span class="required-indicator">*</span>
		</label>
		<g:select name="status" from="${Enums.LeaveStatus?.values()}" keys="${Enums.LeaveStatus.values()*.name()}" required="" value="${leaveSettingInstance?.status?.name()}" />

	</div>

	</g:if>

