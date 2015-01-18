<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>资料列表</title>
<script type="text/javascript">
            
       function navTabAjaxDone(json){
       	 DWZ.ajaxDone(json);
     	 if (json.statusCode == DWZ.statusCode.ok){
            if (false){ //把指定navTab页面标记为需要“重新载入”。注意navTabId不能是当前navTab页面的
                  navTab.reloadFlag("page_list");
            } else { //重新载入当前navTab页面
                  navTabPageBreak();
            }
      }

}
</script>
</head>
<body>
	<div class="pageHeader">
		<form rel="pagerForm" onsubmit="return navTabSearch(this);"
			action="project_list" method="post">
			<table style="margin-left: 30px;">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>项目名称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="projectName"
						type="text" size="30" maxlength="128" value="${projectName}" />
					</td>
	
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="submit">搜&nbsp;&nbsp;索</button></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</form>
		<!--
		<table class="searchContent">
			<tr>
				<td>
					我的客户：<input type="text"/>
				</td>
				<td>
					<select class="combox" name="province">
						<option value="">所有省市</option>
						<option value="北京">北京</option>
						<option value="上海">上海</option>
						<option value="天津">天津</option>
						<option value="重庆">重庆</option>
						<option value="广东">广东</option>
					</select>
				</td>
			</tr>
		</table>
		-->


	</div>
	<form id="pagerForm" method="post" action="#rel#">
		<input type="hidden" name="pageNum" value="1" /> <input type="hidden"
			name="numPerPage" value="20" /> <input type="hidden"
			name="orderField" value="${orderField}" />
		<!--【可选】查询排序字段-->
		<input type="hidden" name="orderDirection" value="${orderDirection}" />
		<!--【可选】升序|降序-->

	</form>
	<form rel="pagerForm" onsubmit="return navTabSearch(this);"
		action="project_list" method="post">
		<div class="pageContent">
			<div class="panelBar">
				<ul class="toolBar">
					<li><a class="add" href="add_project" target="navTab"><span>添加</span>
					</a></li>
					<li><a class="icon" href="export_project_list" title="实要导出这些记录吗?" target="dwzExport"><span>导出EXCEL</span></a></li>
					<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids"
						href="del_project" class="delete" postType="string"
						callback="navTabAjaxDone"><span>批量删除</span> </a></li>
				</ul>
			</div>
			<input type="hidden" name="pageNum" value="1" />
			<table class="table" width="98%" layoutH="138" asc="asc" desc="desc">
				<thead>
					<tr>
						<th width="2%"><input type="checkbox" group="ids"
							class="checkboxCtrl"></th> 
						<th width="" orderField="projectName" class="${orderDirection}">项目名称</th>
						<th width="" orderField="projectNo" class="${orderDirection}">项目代号</th>
						<th width="" orderField="company" class="${orderDirection}">客户名称</th>
						<th width="" orderField="contactPerson" class="${orderDirection}">联系人</th>
						<th width="" orderField="contact" class="${orderDirection}">联系方式</th>
						<th width="" orderField="createDate" class="${orderDirection}">创建时间</th>
						<th width="" orderField="startDate" class="${orderDirection}">启动时间</th>
						<th width="" orderField="endDate" class="${orderDirection}">截止时间</th>
						<th width="" orderField="remarks" class="${orderDirection}">备注</th>
						<th width="">操作</th>
					</tr>
				</thead>

				<tbody id="tbody">
					<c:forEach items="${proList}" var="pro">
						<tr target="sid_user" rel="1">
						<td><input name="ids" value="${pro.id}" type="checkbox">
							</td> 
							<td>${pro.projectName}</td>
							<td>${pro.projectNo}</td>
							<td>${pro.company}</td>
							<td>${pro.contactPerson }</td>
							<td>${pro.contact}</td>
							<td>${pro.createDate}</td>
							<td>${pro.startDate}</td>
							<td>${pro.endDate}</td>
							<td>${pro.remarks}</td>
							<td><a title="删除" target="ajaxTodo"
								href="del_project?ids=${pro.id}" class="btnDel"
								callback="navTabAjaxDone">删除</a> <a title="编辑" target="navTab"
								href="edit_project?id=${pro.id}" class="btnEdit">编辑</a> <a
								title="项目日志" target="navTab" href="tracking_list?projectId=${pro.id}" rel="tracking_list"
								class="add">项目日志</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="panelBar">
				<div class="pages">
					<span>显示</span>
					<!-- <select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value});">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select> -->
					<span>20条，共${totalCount}条</span>
				</div>
				<div class="pagination" targetType="navTab"
					totalCount="${totalCount}" numPerPage="20" pageNumShown="10"
					currentPage="${pageNum}"></div>
			</div>
		</div>
	</form>
</body>
</html>
