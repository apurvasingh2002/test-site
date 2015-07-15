<div id="list-employee" class="content scaffold-list" role="main">
    <h1>Leave List</h1>
    <div class="panel panel-default">
        <div class="panel-heading">
            <a onclick="getForm('leaveForm','LeaveSetting')">Apply Leave</a>
        </div>
        <div class="panel-body">
            <div class="table-responsive table-bordered">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Employee</th>
                        <th>Status</th>
                        <th>From</th>
                        <th>Days</th>
                        <th>Duration</th>
                        <th>Approved By</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${leaveInstanceList}" status="i" var="leaveInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td><g:link action="show" id="${leaveInstance.id}"> ${leaveInstance.employee.getFullName()} %{--${fieldValue(bean: leaveInstance, field: "employee.getFullName()")}--}%</g:link></td>
                            <td>${fieldValue(bean: leaveInstance, field: "status")}</td>
                            <td><g:formatDate format="dd/MM/yyyy" date="${leaveInstance.fromDate}"/></td>
                            <td>${fieldValue(bean: leaveInstance, field: "days")}</td>
                            <td>${(leaveInstance.duration==0.0)?'Full Day':(leaveInstance.duration==1.0)?'Second Half':'First Half'}</td>
                            <td>${fieldValue(bean: leaveInstance, field: "approveBy")}</td>
                            <td><a href="#" class="fa fa-edit" onclick="getForm('LeaveForm',${leaveInstance.id})"  title="Edit" /></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="pagination">
        <g:paginate total="${leaveCount ?: 0}" />
    </div>
</div>