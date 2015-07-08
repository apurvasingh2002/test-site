<%@ page import="hrm.LeaveSetting" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'leaveSetting.label', default: 'LeaveSetting')}" />
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
<div id="list-leaveSetting" class="content scaffold-list" role="main">
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
						<th>Type</th>
						<th>Reason</th>
						<th>Approved By</th>
						<th>Duration</th>
						<th>Days</th>
					</tr>
					</thead>
					<tbody>
					<g:each in="${leaveSettingInstanceList}" status="i" var="leaveSettingInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td><g:link action="show" id="${leaveSettingInstance.id}">${fieldValue(bean: leaveSettingInstance, field: "employee.fullName")}</g:link></td>
							<td>${fieldValue(bean: leaveSettingInstance, field: "type")}</td>
							<td>${fieldValue(bean: leaveSettingInstance, field: "reason")}</td>
							<td>${fieldValue(bean: leaveSettingInstance, field: "approveBy")}</td>
							<td>${leaveSettingInstance.duration?((leaveSettingInstance.duration==1.0)?"Second Half":"First Half"):"Full Day"}</td>
							<td>${fieldValue(bean: leaveSettingInstance, field: "days")}</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="pagination">
		<g:paginate total="${leaveSettingInstanceCount ?: 0}" />
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var menuSection = $('.menu-section');
		$('nav').html(menuSection.html());
		menuSection.remove();
		$("#menu-top").find('li:nth-child(2)').css({'background-color':'#C36464'});
	});
</script>
</body>
</html>
