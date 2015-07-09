<div id="list-employee" class="content scaffold-list" role="main">
    <h1>Employee List</h1>
    <div class="panel panel-default">
        <div class="panel-heading">
            <g:link class="create" action="create">Add New Employee</g:link>
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