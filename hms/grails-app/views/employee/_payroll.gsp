<div id="list-employee" class="content scaffold-list" role="main">
    <h1>Payroll</h1>
    <div class="panel panel-default">
        <div class="panel-heading">
            <a onclick="getForm('payRollForm','Payroll')">Add PayRoll</a>
        </div>
        <div class="panel-body">
            <div class="table-responsive table-bordered">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Employee</th>
                        <th>Salary</th>
                        <th>Promotion Date</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${objectInstanceList}" status="i" var="payRollInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td> ${objectInstance.employee.getFullName()}</td>
                            <td>${fieldValue(bean: objectInstance, field: "salary")}</td>
                            <td>${fieldValue(bean: objectInstance, field: "promotionDate")}</td>
                            <td><a href="#" class="fa fa-edit" onclick="getForm('payRollForm','Payroll',${objectInstance.id})" title="Edit" ></a></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="pagination">
        <g:paginate total="${objectInstanceCount ?: 0}" />
    </div>
</div>