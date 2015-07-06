<%@ page import="hrm.Employee" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<style type="text/css">
		#menu-top li a{
			padding-top: 5px;
			padding-bottom: 5px;
			color: #fff;
		}
		#menu-top li a:hover{
			color: #000;
		}
	</style>
</head>
<body>
<div class="menu-section">
	<div class="menu-container">
		<div class="navbar-collapse">
			<ul id="menu-top" class="nav navbar-nav">
				<li><g:link class="menu-top-active" controller="employee">Employee</g:link></li>
				<li><g:link class="" controller="leaveSetting">Leave</g:link></li>
				<li><g:link class="" controller="payroll">Payroll</g:link></li>
				<li><g:link class="" controller="rooster">Rooster</g:link></li>
			</ul>
		</div>
	</div>
</div>
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
<script type="text/javascript">
	$(document).ready(function(){
		var menuSection = $('.menu-section');
		$('nav').html(menuSection.html());
		menuSection.remove();
		getMenuContent()
	});
	function getMenuContent(ele){

	}
</script>
</body>
</html>
