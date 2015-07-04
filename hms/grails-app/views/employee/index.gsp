
<%@ page import="hrm.Employee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main_hrm">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		%{--<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>--}%
		<div id="list-employee" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

				<div class="panel panel-default">

					<div class="panel-heading">
						<g:link class="create" action="create">Add <g:message code="default.new.label" args="[entityName]" /></g:link>
					</div>

					<div class="panel-body">
						<div class="table-responsive table-bordered">
							<table class="table">
								<thead>
								<tr>
									<th>Employee</th>
									<th>Name</th>
									<th>Phone</th>
									<th>Email</th>
									<th>Department</th>
								</tr>
								</thead>
								<tbody>
								<g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

										<td><g:link action="show" id="${employeeInstance.id}">${fieldValue(bean: employeeInstance, field: "employeeId")}</g:link></td>

										<td>${fieldValue(bean: employeeInstance, field: "fullName")}</td>

										<td>${fieldValue(bean: employeeInstance, field: "mobile")}</td>

										<td>${fieldValue(bean: employeeInstance, field: "email")}</td>

										<td>${fieldValue(bean: employeeInstance, field: "departments.name")}</td>

									</tr>
								</g:each>
								</tbody>
							</table>
						</div>
					</div>
				</div>


			<div class="pagination">
				<g:paginate total="${employeeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
