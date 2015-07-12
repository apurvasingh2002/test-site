<div id="list-employee" class="content scaffold-list" role="main">
    <h1>Employee List</h1>
    <div class="panel panel-default">
        <div class="panel-heading">
            <a onclick="getForm('EmployeeForm')">Add New Employee</a>
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
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td>${fieldValue(bean: employeeInstance, field: "employeeId")}</td>
                            <td>${fieldValue(bean: employeeInstance, field: "fullName")}</td>
                            <td>${fieldValue(bean: employeeInstance, field: "mobile")}</td>
                            <td>${fieldValue(bean: employeeInstance, field: "email")}</td>
                            <td>${fieldValue(bean: employeeInstance, field: "departments.name")}</td>
                            <td><a href="#" class="fa fa-edit" onclick="getForm('EmployeeForm',${employeeInstance.id})"  title="Edit" /></td>
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