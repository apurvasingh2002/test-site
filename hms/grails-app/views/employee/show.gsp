
<%@ page import="hrm.Employee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main_hrm">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-employee" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list employee">
			
				<g:if test="${employeeInstance?.updatedBy}">
				<li class="fieldcontain">
					<span id="updatedBy-label" class="property-label"><g:message code="employee.updatedBy.label" default="Updated By" /></span>
					
						<span class="property-value" aria-labelledby="updatedBy-label"><g:link controller="employee" action="show" id="${employeeInstance?.updatedBy?.id}">${employeeInstance?.updatedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.supervisor}">
				<li class="fieldcontain">
					<span id="supervisor-label" class="property-label"><g:message code="employee.supervisor.label" default="Supervisor" /></span>
					
						<span class="property-value" aria-labelledby="supervisor-label"><g:link controller="employee" action="show" id="${employeeInstance?.supervisor?.id}">${employeeInstance?.supervisor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="employee.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${employeeInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.terminatedDate}">
				<li class="fieldcontain">
					<span id="terminatedDate-label" class="property-label"><g:message code="employee.terminatedDate.label" default="Terminated Date" /></span>
					
						<span class="property-value" aria-labelledby="terminatedDate-label"><g:formatDate date="${employeeInstance?.terminatedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.alterEmail}">
				<li class="fieldcontain">
					<span id="alterEmail-label" class="property-label"><g:message code="employee.alterEmail.label" default="Alter Email" /></span>
					
						<span class="property-value" aria-labelledby="alterEmail-label"><g:fieldValue bean="${employeeInstance}" field="alterEmail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.filename}">
				<li class="fieldcontain">
					<span id="filename-label" class="property-label"><g:message code="employee.filename.label" default="Filename" /></span>
					
						<span class="property-value" aria-labelledby="filename-label"><g:fieldValue bean="${employeeInstance}" field="filename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.workPhone}">
				<li class="fieldcontain">
					<span id="workPhone-label" class="property-label"><g:message code="employee.workPhone.label" default="Work Phone" /></span>
					
						<span class="property-value" aria-labelledby="workPhone-label"><g:fieldValue bean="${employeeInstance}" field="workPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.temporaryAddress}">
				<li class="fieldcontain">
					<span id="temporaryAddress-label" class="property-label"><g:message code="employee.temporaryAddress.label" default="Temporary Address" /></span>
					
						<span class="property-value" aria-labelledby="temporaryAddress-label"><g:fieldValue bean="${employeeInstance}" field="temporaryAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="employee.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${employeeInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="employee.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${employeeInstance?.dateOfBirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.departments}">
				<li class="fieldcontain">
					<span id="departments-label" class="property-label"><g:message code="employee.departments.label" default="Departments" /></span>
					
						<span class="property-value" aria-labelledby="departments-label"><g:link controller="departments" action="show" id="${employeeInstance?.departments?.id}">${employeeInstance?.departments?.name.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.designation}">
				<li class="fieldcontain">
					<span id="designation-label" class="property-label"><g:message code="employee.designation.label" default="Designation" /></span>
					
						<span class="property-value" aria-labelledby="designation-label"><g:link controller="designation" action="show" id="${employeeInstance?.designation?.id}">${employeeInstance?.designation?.name.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.effectiveDate}">
				<li class="fieldcontain">
					<span id="effectiveDate-label" class="property-label"><g:message code="employee.effectiveDate.label" default="Effective Date" /></span>
					
						<span class="property-value" aria-labelledby="effectiveDate-label"><g:formatDate date="${employeeInstance?.effectiveDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="employee.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${employeeInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.employeeId}">
				<li class="fieldcontain">
					<span id="employeeId-label" class="property-label"><g:message code="employee.employeeId.label" default="Employee Id" /></span>
					
						<span class="property-value" aria-labelledby="employeeId-label"><g:fieldValue bean="${employeeInstance}" field="employeeId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="employee.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${employeeInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="employee.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${employeeInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.homePhone}">
				<li class="fieldcontain">
					<span id="homePhone-label" class="property-label"><g:message code="employee.homePhone.label" default="Home Phone" /></span>
					
						<span class="property-value" aria-labelledby="homePhone-label"><g:fieldValue bean="${employeeInstance}" field="homePhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.joinDate}">
				<li class="fieldcontain">
					<span id="joinDate-label" class="property-label"><g:message code="employee.joinDate.label" default="Join Date" /></span>
					
						<span class="property-value" aria-labelledby="joinDate-label"><g:formatDate date="${employeeInstance?.joinDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="employee.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${employeeInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				%{--<g:if test="${employeeInstance?.leave}">
				<li class="fieldcontain">
					<span id="leave-label" class="property-label"><g:message code="employee.leave.label" default="LeaveSetting" /></span>
					
						<g:each in="${employeeInstance.leave}" var="l">
						<span class="property-value" aria-labelledby="leave-label"><g:link controller="leave" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>--}%
			
				<g:if test="${employeeInstance?.maritalStatus}">
				<li class="fieldcontain">
					<span id="maritalStatus-label" class="property-label"><g:message code="employee.maritalStatus.label" default="Marital Status" /></span>
					
						<span class="property-value" aria-labelledby="maritalStatus-label"><g:fieldValue bean="${employeeInstance}" field="maritalStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.mobile}">
				<li class="fieldcontain">
					<span id="mobile-label" class="property-label"><g:message code="employee.mobile.label" default="Mobile" /></span>
					
						<span class="property-value" aria-labelledby="mobile-label"><g:fieldValue bean="${employeeInstance}" field="mobile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.nationality}">
				<li class="fieldcontain">
					<span id="nationality-label" class="property-label"><g:message code="employee.nationality.label" default="Nationality" /></span>
					
						<span class="property-value" aria-labelledby="nationality-label"><g:fieldValue bean="${employeeInstance}" field="nationality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.permanentAddress}">
				<li class="fieldcontain">
					<span id="permanentAddress-label" class="property-label"><g:message code="employee.permanentAddress.label" default="Permanent Address" /></span>
					
						<span class="property-value" aria-labelledby="permanentAddress-label"><g:fieldValue bean="${employeeInstance}" field="permanentAddress"/></span>
					
				</li>
				</g:if>
			
				%{--<g:if test="${employeeInstance?.salary}">
				<li class="fieldcontain">
					<span id="salary-label" class="property-label"><g:message code="employee.salary.label" default="Salary" /></span>
					
						<g:each in="${employeeInstance.salary}" var="s">
						<span class="property-value" aria-labelledby="salary-label"><g:link controller="payroll" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>--}%
			
				<g:if test="${employeeInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="employee.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${employeeInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:employeeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${employeeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
