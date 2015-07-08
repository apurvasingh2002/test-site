<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Spastika HMS</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file:'tab.png')}" type="image/x-icon">
		%{--<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">--}%
		%{--<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">--}%
  		%{--<asset:stylesheet src="application.css"/>--}%
		%{--<asset:javascript src="application.js"/>--}%

	<script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.11.1.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js',file:'bootstrap.js')}"></script>
	<link rel="stylesheet"  type="text/css"  href="${resource(dir:'css',file:'bootstrap.css')}" media="screen" />
	<link rel="stylesheet"  type="text/css"  href="${resource(dir:'css',file:'style.css')}" media="screen" />
	<link rel="stylesheet"  type="text/css"  href="${resource(dir:'css',file:'font-awesome.css')}" media="screen" />
		<g:layoutHead/>
	</head>
	<body>
		%{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>--}%
	<header>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<strong>Email: </strong>info@spastika.com
				&nbsp;&nbsp;
					<strong>Support: </strong>+90-897-678-44
				</div>

			</div>
		</div>
	</header>

	<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/hms/">
					<img src="${resource(dir: 'images', file:'logo.png')}" alt="Spastika"/>
					%{--<img src="assets/img/logo.png" />--}%
				</a>

			</div>

			<div class="left-div">
				<div class="user-settings-wrapper">
					<ul class="nav">
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
								<span class="glyphicon glyphicon-user" style="font-size: 25px;"></span>
							</a>
							<div class="dropdown-menu dropdown-settings">
								<div class="media">
									<a class="media-left" href="#">
										<span class="glyphicon glyphicon-user" style="font-size: 25px;"></span>
										%{--<img src="assets/img/64-64.jpg" alt="" class="img-rounded" />--}%
									</a>
									<div class="media-body">
										<h4 class="media-heading">UserName:${sec.loggedInUserInfo(field:"username")}</h4>
										<h5>Phone:*******</h5>

									</div>
								</div>
								<hr />
								<h5><strong>Designation : *******</strong></h5>
								Type #####
								<hr />
								<g:link id="${sec.loggedInUserInfo(field:"id")}" controller="user" action="show" class="btn btn-info btn-sm">Full Profile</g:link>
								<div style="float: right">
								<form name="logout" method="POST" action="${createLink(controller:'logout') }"> <input class="btn btn-danger btn-sm" type="submit" value="Logout"></form>
							</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			</div>
			</div>

	<section class="menu-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="navbar-collapse collapse ">
						<ul id="menu-top" class="nav navbar-nav navbar-right">
							<li><g:link class="menu-top-active" controller="employee">Employee</g:link></li>
							<li><g:link class="" controller="leaveSetting">Leave</g:link></li>
							<li><g:link class="" controller="payroll">Payroll</g:link></li>
							<li><g:link class="" controller="rooster">Rooster</g:link></li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</section>

	<div class="content-wrapper">
		<div class="container">
		<g:layoutBody/>
		</div>
		</div>
		%{--<div class="footer" role="contentinfo"></div>--}%
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
				&copy; 2015 Spastika | By : <a href="http://www.spastika.com/" target="_blank">@Spastika</a>
				</div>
			</div>
		</div>
	</footer>
		%{--<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--}%
	</body>
</html>
