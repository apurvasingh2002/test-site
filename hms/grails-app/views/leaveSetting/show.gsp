
<%@ page import="hrm.LeaveSetting" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'leaveSetting.label', default: 'LeaveSetting')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-leaveSetting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-leaveSetting" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list leaveSetting">
			
				<g:if test="${leaveSettingInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="leaveSetting.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${leaveSettingInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${leaveSettingInstance?.reason}">
				<li class="fieldcontain">
					<span id="reason-label" class="property-label"><g:message code="leaveSetting.reason.label" default="Reason" /></span>
					
						<span class="property-value" aria-labelledby="reason-label"><g:fieldValue bean="${leaveSettingInstance}" field="reason"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${leaveSettingInstance?.approveBy}">
				<li class="fieldcontain">
					<span id="approveBy-label" class="property-label"><g:message code="leaveSetting.approveBy.label" default="Approve By" /></span>
					
						<span class="property-value" aria-labelledby="approveBy-label"><g:link controller="employee" action="show" id="${leaveSettingInstance?.approveBy?.id}">${leaveSettingInstance?.approveBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				%{--<g:if test="${leaveSettingInstance?.duration}">--}%
				<li class="fieldcontain">
					<span id="first-label" class="property-label"><g:message code="leaveSetting.first.label" default="Duration" /></span>
					
						<span class="property-value" aria-labelledby="first-label">${leaveSettingInstance?.duration}</span>
					
				</li>
				%{--</g:if>--}%
			
				<g:if test="${leaveSettingInstance?.days}">
				<li class="fieldcontain">
					<span id="days-label" class="property-label"><g:message code="leaveSetting.days.label" default="Days" /></span>
					
						<span class="property-value" aria-labelledby="days-label"><g:fieldValue bean="${leaveSettingInstance}" field="days"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${leaveSettingInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="leaveSetting.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${leaveSettingInstance?.employee?.id}">${leaveSettingInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${leaveSettingInstance?.fromDate}">
				<li class="fieldcontain">
					<span id="fromDate-label" class="property-label"><g:message code="leaveSetting.fromDate.label" default="From Date" /></span>
					
						<span class="property-value" aria-labelledby="fromDate-label"><g:formatDate date="${leaveSettingInstance?.fromDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${leaveSettingInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="leaveSetting.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${leaveSettingInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${leaveSettingInstance?.toDate}">
				<li class="fieldcontain">
					<span id="toDate-label" class="property-label"><g:message code="leaveSetting.toDate.label" default="To Date" /></span>
					
						<span class="property-value" aria-labelledby="toDate-label"><g:formatDate date="${leaveSettingInstance?.toDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:leaveSettingInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${leaveSettingInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
