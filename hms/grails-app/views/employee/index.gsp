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

<div class="message alert alert-success hide" role="status"></div>


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
		if('${flash.message}' != '') showNotification('${flash.message}');
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

	function submitForm(){
		var form=$('#gForm').serialize();
		var url=$('#gForm').attr('action');
		$(".alert-success").hasClass("hide")?$(".alert-success").html("") :$(".alert-success").html("").addClass("hide") ;
		$(".alert-danger").hasClass("hide")?$(".alert-danger").html("") :$(".alert-danger").html("").addClass("hide") ;
		var type='Leave';
		$.ajax({
			url:url,
			data:form?form:{},
			async:false,
			method:'POST',
			success:function(resp){
				if(resp.state==0){
					console.log(jQuery.type(resp.msg))
					if(jQuery.type(resp.msg)=="array"){
						$.each(resp.msg,function(i,value){
							$(".alert-danger").append(value).removeClass("hide");
						})
					}else{
						$(".alert-danger").append(resp.msg).removeClass("hide");;
					}

				}else if(resp.state==1){
					$("#modalBox").modal("hide");
					$(".alert-success").html(resp.msg).removeClass("hide");;
					makeAjaxCall(${createLink(action: 'renderTemplate')},type,$("#body-container"));
				}

			},
			error:function(){
				$("#modalBox").modal("hide")
			}
		});
	}
</script>
</body>
</html>
