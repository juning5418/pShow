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
</head>
<script type="text/javascript">
 function navTabAjaxDone(json){
       	 DWZ.ajaxDone(json);
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
</script>
<body>
	<div class="pageContent">
		<form method="post" action="add_project"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, navTabAjaxDone);">

			<div class="pageFormContent nowrap" layoutH="56">
				<dl id="title_div">
					<dt>项目名称：</dt>
					<dd>
						<input name="projectName" class="required" maxlength="25"
							type="text"  id="title" />
					</dd>
				</dl>
				<dl id="textDesc_div">
					<dt>项目代号：</dt>
					<dd>
						<input name="projectNo" maxlength="25">
					</dd>
				</dl>
				<dl id="videoPic_div">
					<dt>客户名称：</dt>
					<dd>
						<input type="text" name="company" id="videoPic_upload">
					</dd>
				</dl>
				<dl id="contact_div">
					<dt>联系人：</dt>
					<dd>
						<input type="text" id="contactUS" name="contactPerson"
							maxlength="50"  >
					</dd>
				</dl>
				<dl id="pictures_div">
					<dt>联系方式：</dt>
					<dd>
						<input type="text" name="contact" id="imgs_upload">
					</dd>
				</dl>
				<dl id="headPic_div">
					<dt>开始时间：</dt>
					<dd>
						<input type="text" name="startDate" id="headPic_upload" dateFmt="yyyy-MM-dd " readonly="true" class="date"/> 
					</dd>
				</dl>
				<dl id="personName_div">
					<dt>结束时间：</dt>
					<dd>
						<input name="endDate" id="personName" type="text" dateFmt="yyyy-MM-dd " readonly="true" class="date"/>
					</dd>
				</dl>
				<dl id="personDesc_div">
					<dt>备注：</dt>
					<dd>
						<input type="text" id="personDesc" name="remarks"
							maxlength="100"  size="100">
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