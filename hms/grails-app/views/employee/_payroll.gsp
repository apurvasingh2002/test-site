<div id="list-employee" class="content scaffold-list" role="main">
    <h1>Payroll</h1>
    <div class="panel panel-default">
        <div class="panel-heading">
            <a onclick="getForm('PayRollForm')">Add PayRoll</a>
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
                    <g:each in="${payRollInstanceList}" status="i" var="payRollInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td> ${payRollInstance.employee.getFullName()}</td>
                            <td>${fieldValue(bean: payRollInstance, field: "salary")}</td>
                            <td>${fieldValue(bean: payRollInstance, field: "promotionDate")}</td>
                            <td><a href="#" class="fa fa-edit" onclick="getForm('PayRollForm',${payRollInstance.id})"  title="Edit" /></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="pagination">
        <g:paginate total="${payRollCount ?: 0}" />
    </div>
</div>