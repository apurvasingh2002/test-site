<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<style type="text/css">
	#menu-top li a{
		padding-top: 5px;
		padding-bottom: 5px;
		color: #fff;
	}
	#menu-top li a:hover{
		cursor: pointer;
		background-color: #F0677C;
	}
	</style>
</head>
<body>
<div class="menu-section">
	<div class="menu-container">
		<div class="navbar-collapse">
			<ul id="menu-top" class="nav navbar-nav">
				<li><a onclick="getMenuContent($(this));">Employee</a></li>
				<li><a onclick="getMenuContent($(this));">Leave</a></li>
				<li><a onclick="getMenuContent($(this));">Payroll</a></li>
				<li><a onclick="">Rooster</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="body-container">

</div>
<script type="text/javascript">
	$(document).ready(function(){
		var menuSection = $('.menu-section');
		$('nav').html(menuSection.html());
		menuSection.remove();
		$("#menu-top").find('li:first-child').find('a').click();
	});
	function getMenuContent(ele){
		$("#menu-top").find('li').each(function(){
			$(this).children('a').removeAttr('style');
		});
		ele.css({'background-color':'#C36464'});
		var data = {template:ele.html()};
		var url = '${createLink(action: 'renderTemplate')}';
		makeAjaxCall(url,data,$("#body-container"));
	}
	function getForm(template){
		var url = '${createLink(action: 'renderTemplate')}';
		var data = {template:template};
		makeAjaxCall(url,data,$("#modalBox"),null,function(){$("#modalBox").modal()});
	}
</script>
</body>
</html>
