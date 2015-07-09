<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Profile</h4>
        </div>
        <div class="modal-body">
            <p>UserName: ${sec.loggedInUserInfo(field:"username")}</p>
            <p>Designation: someText</p>
            <p>Phone: 01-123456</p>
        </div>
        <div class="modal-footer">
            <form name="logout" method="POST" action="${createLink(controller:'logout') }">
                <g:link id="${sec.loggedInUserInfo(field:"id")}" controller="user" action="show"
                        class="btn btn-info btn-sm" style="float: left">Full Profile</g:link>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <input class="btn btn-danger btn-sm" type="submit" value="Logout">
            </form>
        </div>
    </div>
</div>