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
				<li><a onclick="getMenuContent('Employee');">Employee</a></li>
				<li><a onclick="getMenuContent('Leave');">Leave</a></li>
				<li><a onclick="getMenuContent('Payroll');">Payroll</a></li>
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
		$("#menu-top").find('li:first-child').css({'background-color':'#C36464'}).find('a').click();
	});
	function getMenuContent(template){
		$.ajax({
			url:'${createLink(controller: 'employee' , action: 'renderTemplate')}',
			data:{template:template},
			method:'POST',
			beforeSend : function(){
				showLoadingScreen();
			},
			complete:function(){
				hideLoadingScreen();
			},
			success:function(data){
				$("#body-container").html(data);
			}
		});
	}
</script>
</body>
</html>
