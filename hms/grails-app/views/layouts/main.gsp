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
	<script type="text/javascript" src="${resource(dir:'js',file:'default.js')}"></script>
	<link rel="stylesheet"  type="text/css"  href="${resource(dir:'css',file:'bootstrap.css')}" media="screen" />
	%{--<link rel="stylesheet"  type="text/css"  href="${resource(dir:'css',file:'style.css')}" media="screen" />--}%
	<link rel="stylesheet"  type="text/css"  href="${resource(dir:'css',file:'main-layout.css')}" media="screen" />
	<link rel="stylesheet"  type="text/css"  href="${resource(dir:'css',file:'default.css')}" media="screen" />
	<link rel="stylesheet"  type="text/css"  href="${resource(dir:'css',file:'font-awesome.css')}" media="screen" />
	<g:layoutHead/>
</head>
<body>
%{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>--}%
<header>
	<div class="notification-top">
		<span class="notification-container"></span>
	</div>
	<div class="logo">
		<a class="navbar-brand" href="#">
			<img src="${resource(dir: 'images', file:'logo.png')}" alt="Spastika"/>
		</a>
	</div>
	<g:if test="${sec.loggedInUserInfo(field:"username")}">
		<div class="user-profile">
			<span class="span-link" data-toggle="modal" data-target="#userProfileModal">
				<span class="glyphicon glyphicon-user" style="color: #fff"></span>
				Welcome Admin,</span>
			<a href="${createLink(controller: 'logout',action: 'index')}"> Logout</a>
		</div>
		<div id="userProfileModal" class="modal fade" role="dialog">
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
		</div>
	</g:if>
</header>
<nav>
</nav>
<section>
	<div id="loading-screen">Loading ....</div>
</section>
<div class="main-body-container">
	<g:layoutBody/>
</div>
<footer>
	<div class="footer-container">
		<span>
			Developed By :<a href="http://www.spastika.com/" target="_blank"> www.Spastika.com </a>| Contact: 01-4123456
		</span>
	</div>
</footer>
<script type="text/javascript">
	$('.notification-top').click(function(){
		$(this).animate({
			top: -$(this).outerHeight()
		});
	});
</script>
</body>
</html>
