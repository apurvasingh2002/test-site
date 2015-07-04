<%--
  Created by IntelliJ IDEA.
  User: nick
  Date: 6/22/2015
  Time: 4:52 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main_dash">
    <title>Dash Board</title>
</head>

<body>


        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line">Dashboard</h4>

            </div>

        </div>
        %{--<div class="row">
            <div class="col-md-12">
                <div class="alert alert-success">
                    This is a simple ERM Design.
                </div>
            </div>

        </div>--}%
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-6">
                <div class="dashboard-div-wrapper bk-clr-one">
                    <i  class="fa fa-venus dashboard-div-icon" ></i>
                    <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                        </div>

                    </div>
                   <g:link controller="employee"> <h5>Employee</h5></g:link>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-6">
                <div class="dashboard-div-wrapper bk-clr-two">
                    <i  class="fa fa-edit dashboard-div-icon" ></i>
                    <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                        </div>

                    </div>
                    <g:link controller="leaveSetting"> <h5>Clinical</h5></g:link>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-6">
                <div class="dashboard-div-wrapper bk-clr-three">
                    <i  class="fa fa-cogs dashboard-div-icon" ></i>
                    <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                        </div>

                    </div>
                    <g:link controller="payroll"> <h5>Pharmacy</h5></g:link>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-6">
                <div class="dashboard-div-wrapper bk-clr-four">
                    <i  class="fa fa-bell-o dashboard-div-icon" ></i>
                    <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                        </div>

                    </div>
                    <g:link controller="roster"> <h5>Account</h5></g:link>
                </div>
            </div>

        </div>



</body>
</html>