
<%@ page import="hrm.LeaveSetting" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main_hrm">
		<g:set var="entityName" value="${message(code: 'leaveSetting.label', default: 'LeaveSetting')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#list-leaveSetting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>--}%
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
	</body>
</html>
