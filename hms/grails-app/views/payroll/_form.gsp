<%@ page import="hrm.Payroll" %>



<div class="fieldcontain ${hasErrors(bean: payrollInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="payroll.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${hrm.Employee.list()}" optionKey="id" optionValue="firstName" required="" value="${payrollInstance?.employee?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: payrollInstance, field: 'promotionDate', 'error')} required">
	<label for="promotionDate">
		<g:message code="payroll.promotionDate.label" default="Promotion Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="promotionDate" precision="day"  value="${payrollInstance?.promotionDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: payrollInstance, field: 'salary', 'error')} required">
	<label for="salary">
		<g:message code="payroll.salary.label" default="Salary" />
		<span class="required-indicator">*</span>
	</label>

	<g:field name="salary" value="${fieldValue(bean: payrollInstance, field: 'salary')}" required=""/>

</div>

