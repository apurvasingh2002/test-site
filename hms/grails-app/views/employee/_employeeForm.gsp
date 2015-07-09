<%@ page import="Enums.*;java.util.EnumSet" %>
<div class="modal-dialog" style="width: 800px;">
    <div class="modal-content">
        <form>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Employee</h4>
            </div>
            <div class="modal-body">
                <table class="form-table">
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
                        <td><label>Status: <g:select name="status" from="${EnumSet.allOf(LeaveStatus).value}"/></label></td>
                        <td><label>Department: <g:select name="status" from="['Department A','Department B']"/></label></td>
                        <td><label>Designation: <g:select name="status" from="['Designation A','Designation B']"/></label></td>
                    </tr>
                    <tr>
                        <td><label>Effective Date: <input type="text" /></label></td>
                        <td><label>Join Date: <input type="text" /></label></td>
                        <td><label>Termination Date: <input type="text" /></label></td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <label style="text-align: left;">Supervisor: <input type="text" /></label>
                <label>File Name: <input type="text" /></label>
                <input type="button" value="Browse" style="margin-right: 20px; width: 100px;">
                <g:submitButton name="create" class="save btn btn-primary"
                                value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </div>
        </form>
    </div>
</div>