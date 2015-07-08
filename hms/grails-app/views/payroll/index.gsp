<%@ page import="hrm.Payroll" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'payroll.label', default: 'Payroll')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="menu-section">
	<div class="menu-container">
		<div class="navbar-collapse">
			<ul id="menu-top" class="nav navbar-nav">
				<li><g:link class="" controller="employee">Employee</g:link></li>
				<li><g:link class="" controller="leaveSetting">Leave</g:link></li>
				<li><g:link class="" controller="payroll">Payroll</g:link></li>
				<li><g:link>Rooster</g:link></li>
			</ul>
		</div>
	</div>
</div>
<div id="list-payroll" class="content scaffold-list" role="main">
	<h1><g:message code="default.list.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<div class="panel panel-default">
		<div class="panel-heading">
			<g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div class="panel-body">
			<div class="table-responsive table-bordered">
				<table class="table">
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
			</div>
		</div>
	</div>
	<div class="pagination">
		<g:paginate total="${payrollInstanceCount ?: 0}" />
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var menuSection = $('.menu-section');
		$('nav').html(menuSection.html());
		menuSection.remove();
		$("#menu-top").find('li:nth-child(3)').css({'background-color':'#C36464'});
	});
</script>
</body>
</html>
