<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>登录</title>
<link href="./css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="./js/dwz/js/jquery-1.7.2.js"></script>
<script >
	$(document).ready(function(){
		var flag = true;//判断是否是第一次点击登录框
		$("#loginName").click(function(){
			if(flag)
			{
				$("#loginName").val("");//第一次点击时清除内容
				$("#loginName").css("color","black");//修改字体颜色
				flag = false;
			}
			});
		var SubmitOrHidden = function(evt){
		    evt = window.event || evt;
		    if(evt.keyCode==13){//如果取到的键值是回车
		          //do something		
		          validAdd();
		     }else{
		        //其他键  dosomething
		    }
		};
	window.document.onkeydown=SubmitOrHidden;//当有键按下时执行函数
	});
	function validAdd(){
		if($("#loginName").val() == null || $("#loginName").val() == ""){
			alert("请输入用户名");
			return false;
		}else
		if($("#loginPass").val() == null || $("#loginPass").val() == ""){
			alert("请输入用户名");
			return false;
		}else{
			$("#loginForm").submit();
		}
	}
</script>
</head>

<body>
	<div class="login">
		<div class="login_content">
			<form action="./login" method="post"
				id="loginForm" >
				<dl>
					<dd>用户名：</dd>
					<dd>
						<input class="kuang_1" name="userName" id="loginName" 
							maxlength="15" size="28" type="text" value="请输入用户名" style="color:gray;" />
					</dd>
					<dd>密&nbsp;&nbsp;码：</dd>
					<dd>
						<input class="kuang_2" name="password" id="loginPass" size="28"
							maxlength="15" type="password" />
					</dd>
					<dt>
						<a href="javascript:;" onclick="validAdd();"><img
							src="./images/btn.jpg" /> </a>
							<span style="color: red;">${login_info}</span>
					</dt>
				</dl>
			</form>
		</div>
	</div>


</body>
</html>