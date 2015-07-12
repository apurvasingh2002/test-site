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
				<li><a onclick="javascript:void(0)">Rooster</a></li>
			</ul>
		</div>
	</div>
</div>
<g:if test="${flash.message}">
	<div class="message alert alert-success" role="status">${flash.message}</div>
</g:if>
<g:hasErrors bean="${errorInstance}">
	<ul class="errors" role="alert">
		<g:eachError bean="${errorInstance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
		</g:eachError>
	</ul>
</g:hasErrors>
<div id="body-container">

</div>
<script type="text/javascript">
	var tab = '${template}';

	$(document).ready(function(){
		var menuSection = $('.menu-section');
		$('nav').html(menuSection.html());
		menuSection.remove();

			$("#menu-top").find('li').each(function(){
				if($(this).children('a').html() == tab){
					$(this).children('a').click();
				}
			});




	});
	function getMenuContent(ele){
		$("#menu-top").find('li').each(function(){
			$(this).children('a').removeAttr('style');
		});
		ele.css({'background-color':'#C36464'});
		var data = {template:ele.text()};
		var url = '${createLink(action: 'renderTemplate')}';
		makeAjaxCall(url,data,$("#body-container"));
	}
	function getForm(template,id){
		var url = '${createLink(action: 'renderFormTemplate')}';
		var data = {template:template,id:id};
		makeAjaxCall(url,data,$("#modalBox"),null,function(){$("#modalBox").modal()});
	}




</script>
</body>
</html>
