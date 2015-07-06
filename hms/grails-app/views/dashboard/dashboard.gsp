<%--
  Created by IntelliJ IDEA.
  User: nick
  Date: 6/22/2015
  Time: 4:52 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css' , file: 'dashboard.css')}"/>
</head>
<body>
<div class="row">
    <div class="col-md-12" align="center" style="padding:10px;">
        <h2 class="page-head-line">Dashboard</h2>
    </div>
</div>
<div class="dashboard-container">
    <table>
        <tr>
            <td><g:link controller="employee"><span class="glyphicon glyphicon-user"><br/>Employee</span></g:link></td>
            <td><g:link controller="#"><span class="glyphicon glyphicon-user"><br/>Clinical</span></g:link></td>
            <td><g:link controller="#"><span class="glyphicon glyphicon-user"><br/>Pharmacy</span></g:link></td>
            <td><g:link controller="#"><span class="glyphicon glyphicon-user"><br/>Account</span></g:link></td>
        </tr>
    </table>
</div>
</body>
</html>