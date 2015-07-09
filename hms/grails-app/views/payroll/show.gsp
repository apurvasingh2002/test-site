
<%@ page import="hrm.Payroll" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'payroll.label', default: 'Payroll')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-payroll" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-payroll" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list payroll">
			
				<g:if test="${payrollInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="payroll.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${payrollInstance?.employee?.id}">${payrollInstance?.employee?.firstName.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${payrollInstance?.promotionDate}">
				<li class="fieldcontain">
					<span id="promotionDate-label" class="property-label"><g:message code="payroll.promotionDate.label" default="Promotion Date" /></span>
					
						<span class="property-value" aria-labelledby="promotionDate-label"><g:formatDate date="${payrollInstance?.promotionDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${payrollInstance?.salary}">
				<li class="fieldcontain">
					<span id="salary-label" class="property-label"><g:message code="payroll.salary.label" default="Salary" /></span>
					
						<span class="property-value" aria-labelledby="salary-label"><g:fieldValue bean="${payrollInstance}" field="salary"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:payrollInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${payrollInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
