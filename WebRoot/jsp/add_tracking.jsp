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
       	 DWZ.ajaxDone(json);
     	 if (json.statusCode == DWZ.statusCode.ok){
            if ("tracking_list"){ //把指定navTab页面标记为需要“重新载入”。注意navTabId不能是当前navTab页面的
                  navTab.reloadFlag("tracking_list");
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
</script>
</head>
<body>
	<div class="pageContent">
		<form method="post" action="add_tracking"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, navTabAjaxDone);">
			<input type="hidden" value="${tracking.projectId}" name="projectId">
			<div class="pageFormContent nowrap" layoutH="56">
				<dl id="title_div">
					<dt>标题：</dt>
					<dd>
						<input name="title" class="required" maxlength="25"
							type="text"  id="title" />
					</dd>
				</dl>
				<dl id="textDesc_div">
					<dt>内容：</dt>
					<dd>
						<textarea rows="2" cols="100" name="content" maxlength="200"></textarea>
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