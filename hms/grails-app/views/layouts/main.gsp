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
		<g:link class="navbar-brand" controller="dashboard" action="index">
			<img src="${resource(dir: 'images', file:'logo.png')}" alt="Spastika"/>
		</g:link>
	</div>
	<g:if test="${sec.loggedInUserInfo(field:"username")}">
		<div class="user-profile">
			<span class="span-link" onclick="getUserProfile($(this));">
				<span class="glyphicon glyphicon-user" style="color: #fff"></span>
				Welcome Admin,</span>
			<a href="${createLink(controller: 'logout',action: 'index')}"> Logout</a>
		</div>
		<div id="modalBox" class="modal fade" role="dialog">

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
			Developed By :<a href="http://www.spastika.com/" target="_blank"> www.spastika.com </a>| Contact: 01-4123456
		</span>
	</div>
</footer>
<script type="text/javascript">
	$('.notification-top').click(function(){
		$(this).animate({
			top: -$(this).outerHeight()
		});
	});
	function getUserProfile(ele){
		var url = '${createLink(controller: 'dashboard' , action: 'renderUserProfile')}';
		makeAjaxCall(url,null,$("#modalBox"),null,function(){$('#modalBox').modal();});
	}
</script>
</body>
</html>
