
<%@ page import="hrm.Payroll" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main_hrm">
		<g:set var="entityName" value="${message(code: 'payroll.label', default: 'Payroll')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#list-payroll" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>--}%
	<g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		<div id="list-payroll" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="payroll.employee.label" default="Employee" /></th>
					
						<g:sortableColumn property="promotionDate" title="${message(code: 'payroll.promotionDate.label', default: 'Promotion Date')}" />
					
						<g:sortableColumn property="salary" title="${message(code: 'payroll.salary.label', default: 'Salary')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${payrollInstanceList}" status="i" var="payrollInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${payrollInstance.id}">${fieldValue(bean: payrollInstance, field: "employee.fullName")}</g:link></td>
					
						<td><g:formatDate date="${payrollInstance.promotionDate}" /></td>
					
						<td>${fieldValue(bean: payrollInstance, field: "salary")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${payrollInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
