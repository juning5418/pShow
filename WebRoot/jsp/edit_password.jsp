<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" import="com.pshow.pojo.*"%>
<html>
<head>
<title>HUAWEI</title>
<style type="text/css">
.my-uploadify-button {
	background: none;
	border: none;
	text-shadow: none;
	border-radius: 0;
}

.uploadify:hover .my-uploadify-button {
	background: none;
	border: none;
}

.fileQueue {
	width: 400px;
	height: 150px;
	overflow: auto;
	border: 1px solid #E5E5E5;
	margin-bottom: 10px;
}
#head_span{
	display: none;
}
#ppt_span{
	display: none;
}
#video_span{
	display: none;
}
#cover_span{
	display: none;
}
#doc_file{
	display: none;
}
#video_file{
	display: none;
}
#ppt_file{
	display: none;
}
</style>
<script type="text/javascript">
 function navTabAjaxDone(json){
       	 //DWZ.ajaxDone(json);
     	 if (json.statusCode == DWZ.statusCode.ok){
            if ("queryData"){ //把指定navTab页面标记为需要“重新载入”。注意navTabId不能是当前navTab页面的
                  navTab.reloadFlag("page_list");
            } else { //重新载入当前navTab页面
                  navTabPageBreak();
            }
            if ("closeCurrent" == json.callbackType) {
                  setTimeout(function(){navTab.closeCurrentTab();}, 100);
            } else if ("forward" == json.callbackType) {
                  navTab.reload(json.forwardUrl);
            }
      }
}
function saveForm(obj){
	if($("#password").val() != null && $("#password").val() != ""){
			if($("#password").val() == $("#password2").val()){
					return validateCallback(obj, navTabAjaxDone);
			}
			alert("两次输入的密码不匹配");
	}else{
		alert("密码不能为空");
	}
	return false;
}
</script>
</head>
<body>
	<div class="pageContent">
		<form method="post" action="edit_password"
			class="pageForm required-validate"
			onsubmit="return saveForm(this);">
			<input type="hidden" value="${user.id}" name="id">
			<div class="pageFormContent nowrap" layoutH="56">
				<dl id="title_div">
					<dt>用户名：</dt>
					<dd>
						<input name="userName" class="required" maxlength="25" value="${user.userName}" readonly="readonly"
							type="text"  id="title" />
					</dd>
				</dl>
				<dl id="textDesc_div">
					<dt>真实姓名：</dt>
					<dd>
						<input  name="name" type="text" class="required" value="${user.name}" readonly="readonly">
					</dd>
				</dl>
				<dl id="textDesc_div">
					<dt>密码：</dt>
					<dd>
						<input  name="password" type="password" class="required" id="password">
					</dd>
				</dl>
				<dl id="textDesc_div">
					<dt>确认密码：</dt>
					<dd>
						<input type="password" class="required"  id="password2">
					</dd>
				</dl>
			</div>
			<div class="formBar">
				<ul>
					<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">保存</button>
							</div>
						</div></li>
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="button" class="close">取消</button>
							</div>
						</div>
					</li>
				</ul>
			</div>

		</form>
	</div>
</body>
</html>