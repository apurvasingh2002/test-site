<form>
<table width="100%">
    <tr>
        <td><label>First Name: <input type="text" name="firstName"/></label></td>
        <td><label>Middle Name: <input type="text" name="middleName"/></label></td>
        <td><label>Last Name: <input type="text" name="LastName"/></label></td>
    </tr>
    <tr>
        <td><label>Date Of Birth: <input type="text" /></label></td>
        <td><label>Gender: <input type="text" /></label></td>
        <td><label>Martial Status: <input type="text" /></label></td>
    </tr>
    <tr>
        <td><label>Nationality: <input type="text" /></label></td>
        <td><label>Country: <input type="text" /></label></td>
        <td><label>Permanent Address: <input type="text" /></label></td>
    </tr>
    <tr>
        <td><label>Temporary Address: <input type="text" /></label></td>
        <td><label>Mobile: <input type="text" /></label></td>
        <td><label>Work Phone: <input type="text" /></label></td>
    </tr>
    <tr>
        <td><label>Home Phone: <input type="text" /></label></td>
        <td><label>Email Address: <input type="text" /></label></td>
        <td><label>Alternate Email Address: <input type="text" /></label></td>
    </tr>
    <tr>
        <td><label>File Name: <input type="text" /></label></td>
        <td><label>Status: <select><option></option></select></label></td>
        <td><label>Last Name: <input type="text" /></label></td>
    </tr>
    <tr>
        <td><label>First Name: <input type="text" /></label></td>
        <td><label>Middle Name: <input type="text" /></label></td>
        <td><label>Last Name: <input type="text" /></label></td>
    </tr>
</table>
</form>
%{--<div class="row">--}%
    %{--<div class="col-xs-4">--}%
        %{--<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'username', 'error')} required">--}%
            %{--<label class="col-xs-4 control-label">Username *</label>--}%
            %{--<div class="col-md-6">--}%
                %{--<g:textField name="username" required="" value="${employeeInstance?.user?.username}" class="form-control" placeholder="Username"/>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</div>--}%
    %{--<div class="col-xs-4">--}%
        %{--<div class=" input-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'employeeId', 'error')} required">--}%
            %{--<label class="col-xs-4 control-label">Employee ID *</label>--}%
            %{--<div class="col-md-6">--}%
                %{--<g:textField name="employeeId" required="" value="${employeeInstance?.employeeId}" class="form-control" placeholder="Employee ID"/>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</div>--}%
%{--</div>--}%
%{--<hr>--}%