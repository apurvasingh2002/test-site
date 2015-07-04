<%@ page import="hrm.Employee" %>

<div class="row">

	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'username', 'error')} required">
			<label class="col-xs-4 control-label">Username *</label>
			%{--<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>--}%
		<div class="col-md-6">
			<g:textField name="username" required="" value="${employeeInstance?.user?.username}" class="form-control" placeholder="Username"/>


		</div>
		</div>
	</div>
	%{--<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} required">
			<label class="col-xs-4 control-label" >Password</label>

			<div class="col-md-6">
				<g:passwordField name="password" required="" value="${employeeInstance?.employeeId}" class="form-control" placeholder="Password"/>
			</div>

		</div>
	</div>--}%

	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'employeeId', 'error')} required">
			%{--<label for="employeeId">
                <g:message code="employee.employeeId.label" default="Employee Id" />
                <span class="required-indicator">*</span>
            </label>--}%

			<label class="col-xs-4 control-label">Employee ID *</label>
			<div class="col-md-6">
			<g:textField name="employeeId" required="" value="${employeeInstance?.employeeId}" class="form-control" placeholder="Employee ID"/>


		</div>
		</div>
	</div>
</div>
<hr>

<div class="row">
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'firstName', 'error')} required">


			<label class="col-xs-4 control-label">First Name *</label>
<div class="col-md-6">
			<g:textField name="firstName" required="" value="${employeeInstance?.firstName}" class="form-control" placeholder="First Name"/>

		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'middleName', 'error')} required">
			<label class="col-xs-4 control-label">M. Name</label>
			<div class="col-md-6">
			<g:textField name="middleName" value="${employeeInstance?.middleName}" class="form-control" placeholder="Middle Name"/>


		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastName', 'error')} required">
			<label class="col-xs-4 control-label">Last Name *</label>
			<div class="col-md-6">
			<g:textField name="lastName" required=""  value="${employeeInstance?.lastName}" class="form-control" placeholder="Last Name"/>


		</div>
		</div>
	</div>
</div>
<hr>


<div class="row">
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'email', 'error')} required">


			<label class="col-xs-4 control-label">Email *</label>

			<div class="col-md-6">
			<g:textField name="email" required="" value="${employeeInstance?.email}" class="form-control" placeholder="Email"/>

		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'updatedBy', 'error')} required">
			<label class="col-xs-4 control-label">Updated</label>
			<div class="col-md-6">
			<g:select  id="updatedBy" name="updatedBy.id" from="${hrm.Employee.list()}" optionKey="id" optionValue="firstName" value="${employeeInstance?.updatedBy?.id}" class="many-to-one form-control" noSelection="${[null:'Select One...']}" />



		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'supervisor', 'error')} required">
			<label class="col-xs-4 control-label">Supervisor</label>
			<div class="col-md-6">
			<g:select id="supervisor" name="supervisor.id" from="${hrm.Employee.list()}" optionKey="id" optionValue="firstName" value="${employeeInstance?.supervisor?.id}" class="many-to-one form-control" noSelection="${[null:'Select One...']}" />


		</div>
		</div>
	</div>
</div>
<hr>


<div class="row">
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'alterEmail', 'error')} required">


			<label class="col-xs-4 control-label">Alt</label>
<div class="col-md-6">
			<g:textField name="alterEmail" value="${employeeInstance?.alterEmail}" class="form-control" placeholder="Alter Email"/>

		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'filename', 'error')} required">
			<label class="col-xs-4 control-label">File</label>
			<div class="col-md-6">
			<g:textField name="filename" value="${employeeInstance?.filename}" class="form-control" placeholder="File "/>


		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'workPhone', 'error')} required">
			<label class="col-xs-4 control-label">Work Phone</label>
			<div class="col-md-6">
			<g:textField name="workPhone" value="${employeeInstance?.workPhone}" class="form-control" placeholder="Work Phone"/>

		</div>
		</div>
	</div>
</div>
<hr>



<div class="row">
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'temporaryAddress', 'error')} required">


			<label class="col-xs-4 control-label">T. Address</label>

<div class="col-md-6">
			<g:textField name="temporaryAddress" value="${employeeInstance?.temporaryAddress}" class="form-control" placeholder="Temp Address"/>

		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'country', 'error')} required">
			<label class="col-xs-4 control-label">Country *</label>
			<div class="col-md-6">
			<g:textField name="country" required="" value="${employeeInstance?.country}" class="form-control" placeholder="Country"/>


		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'dateOfBirth', 'error')} required">
			<label class="col-xs-2 control-label">DOB</label>
			<g:datePicker name="dateOfBirth" precision="day"  value="${employeeInstance?.dateOfBirth}"   />

		</div>
	</div>
</div>
<hr>



<div class="row">
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'departments', 'error')} required">


			<label class="col-xs-4 control-label">Departments *</label>

<div class="col-md-6">
			<g:select id="departments" name="departments.id" from="${hrm.Departments.list()}" optionKey="id" optionValue="name" required="" value="${employeeInstance?.departments?.id}" class="many-to-one form-control" noSelection="${[null:'Select One...']}" />


		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'designation', 'error')} required">
			<label class="col-xs-4 control-label">Designation *</label>
			<div class="col-md-6">
			<g:select id="designation" name="designation.id" from="${hrm.Designation.list()}" optionKey="id" optionValue="name" required="" value="${employeeInstance?.designation?.id}" class="many-to-one form-control" noSelection="${[null:'Select One...']}" />


		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'effectiveDate', 'error')} required">
			<label class="col-xs-2 control-label">E.Date</label>&nbsp;&nbsp;
			<g:datePicker name="effectiveDate" precision="day"  value="${employeeInstance?.effectiveDate}"  />

		</div>
	</div>
</div>
<hr>

<div class="row">
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'maritalStatus', 'error')} required">


			<label class="col-xs-4 control-label">Marital *</label>
<div class="col-md-6">


			<g:select name="maritalStatus" noSelection="${[null:'Select One...']}" from="${Employee.constraints.maritalStatus.inList}" required="" value="${employeeInstance?.maritalStatus}" class="form-control" />


		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'mobile', 'error')} required">
			<label class="col-xs-4 control-label">Mobile *</label>
			<div class="col-md-6">

				<g:textField name="mobile" required="" value="${employeeInstance?.mobile}" class="form-control" placeholder="Mobile"/>


		</div></div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'gender', 'error')} required">
			<label class="col-xs-4 control-label">Gender *</label>
			<div class="col-md-6">

				<g:textField name="gender" required="" value="${employeeInstance?.gender}" class="form-control" placeholder="Gender"/>
		</div>
		</div>
	</div>
</div>
<hr>


<div class="row">
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'homePhone', 'error')} required">


			<label class="col-xs-4 control-label">H. Phone</label>


<div class="col-md-6">

	<g:textField name="homePhone" required="" value="${employeeInstance?.homePhone}" class="form-control" placeholder="Home Phone"/>

		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'joinDate', 'error')} required">
			<label class="col-xs-4 control-label">Join Date</label>


				<g:datePicker name="joinDate" precision="day"  value="${employeeInstance?.joinDate}"  />



		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'nationality', 'error')} required">
			<label class="col-xs-4 control-label">Nationality *</label>
			<div class="col-md-6">

				<g:textField name="nationality" required="" value="${employeeInstance?.nationality}" class="form-control" placeholder="Nationality"/>
		</div>
		</div>
	</div>
</div>
<hr>



<div class="row">
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'permanentAddress', 'error')} required">


			<label class="col-xs-4 control-label">P. Address *</label>

<div class="col-md-6">

			<g:textField name="permanentAddress" required="" value="${employeeInstance?.permanentAddress}" class="form-control" placeholder="Permanent Address"/>

		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'status', 'error')} required">
			<label class="col-xs-4 control-label">EmployeeStatus *</label>
			<div class="col-md-6">

				<g:select noSelection="${[null:'Select One...']}" name="status" class="form-control" from="${Enums.EmployeeStatus?.values()}" keys="${Enums.EmployeeStatus.values()*.name()}" required="" value="${employeeInstance?.status?.name()}" />



		</div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'terminatedDate', 'error')} required">
			<label class="col-xs-2 control-label">Terminated Date</label>&nbsp;&nbsp;
			<g:datePicker name="terminatedDate" precision="day"  value="${employeeInstance?.terminatedDate}" default="none" noSelection="${[null:'Select One...']}" />

		</div>
	</div>
</div>
<hr>

%{--<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'leave', 'error')} ">
	<label for="leave">
		<g:message code="employee.leave.label" default="LeaveSetting" />

	</label>

<ul class="one-to-many">
<g:each in="${employeeInstance?.leave?}" var="l">
    <li><g:link controller="leave" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="leave" action="create" params="['employee.id': employeeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'leave.label', default: 'LeaveSetting')])}</g:link>
</li>
</ul>


</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'salary', 'error')} ">
	<label for="salary">
		<g:message code="employee.salary.label" default="Salary" />

	</label>

<ul class="one-to-many">
<g:each in="${employeeInstance?.salary?}" var="s">
    <li><g:link controller="payroll" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="payroll" action="create" params="['employee.id': employeeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'payroll.label', default: 'Payroll')])}</g:link>
</li>
</ul>


</div>--}%

