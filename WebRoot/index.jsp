<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Huawei Service Tablet Marketing</title>

<link href="./js/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="./js/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="./js/dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="./js/dwz/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<!--[if IE]>
<link href="/js/dwz/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="/js/dwz/js/speedup.js" type="text/javascript"></script>
<![endif]-->
<!-- <script src="/js/jquery-1.8.3.min.js" type="text/javascript"/>-->
<script src="./js/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="./js/dwz/js/jquery.cookie.js" type="text/javascript"></script>
<script src="./js/dwz/js/jquery.validate.js" type="text/javascript"></script>
<script src="./js/dwz/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="./js/dwz/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
<script src="./js/dwz/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>

<!--<script type="/js/uploadify/jquery.uploadify.js" type="text/javascript"></script>-->
<script src="./js/dwz/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript" src="./js/dwz/chart/raphael.js"></script>
<script type="text/javascript" src="./js/dwz/chart/g.raphael.js"></script>
<script type="text/javascript" src="./js/dwz/chart/g.bar.js"></script>
<script type="text/javascript" src="./js/dwz/chart/g.line.js"></script>
<script type="text/javascript" src="./js/dwz/chart/g.pie.js"></script>
<script type="text/javascript" src="./js/dwz/chart/g.dot.js"></script>

<script src="./js/dwz/js/dwz.core.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.util.date.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.drag.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.tree.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.accordion.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.ui.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.theme.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.navTab.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.tab.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.resize.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.dialog.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.stable.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.ajax.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.pagination.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.database.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.effects.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.panel.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.history.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.combox.js" type="text/javascript"></script>
<script src="./js/dwz/js/dwz.print.js" type="text/javascript"></script>
<!--
<script src="bin/dwz.min.js" type="text/javascript"></script>
-->
<script src="./js/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	DWZ.init("./js/dwz/dwz.frag.xml", {
	//	loginUrl:"/js/dwz/login_dialog.html", loginTitle:"登录",	// 弹出登录对话框
			loginUrl:"./login",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});

</script>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="http://j-ui.com">i标志</a>
				<ul class="nav">
					<!-- <li id="switchEnvBox"><a href="javascript:">（<span>深圳</span>）切换城市</a>
						<ul>
							<li><a href="/js/dwz/sidebar_1.html">深圳</a></li>
							<li><a href="/js/dwz/sidebar_2.html">上海</a></li>
							<li><a href="/js/dwz/sidebar_2.html">南京</a></li>
							<li><a href="/js/dwz/sidebar_2.html">北京</a></li>
							<li><a href="/js/dwz/sidebar_2.html">广州</a></li>
							<li><a href="/js/dwz/sidebar_2.html">天津</a></li>
							<li><a href="/js/dwz/sidebar_2.html">杭州</a></li>
						</ul>
					</li> -->
					<!-- <li><a href="https://me.alipay.com/dwzteam" target="_blank">捐赠</a></li>
					<li><a href="/js/dwz/changepwd.html" target="dialog" width="600">设置</a></li>
					<li><a href="http://www.cnblogs.com/dwzjs" target="_blank">博客</a></li>
					<li><a href="http://weibo.com/dwzui" target="_blank">微博</a></li>
					<li><a href="http://bbs.dwzjs.com" target="_blank">论坛</a></li> -->
					<li><a href="./logout">修改密码</a></li>
					<li><a href="./logout">退出</a></li>
				</ul>
			<!-- 	<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
				<li theme="red"><div>红色</div></li>
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul> -->
			</div>

			<!-- navMenu -->
			
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>

				<div class="accordion" fillSpace="sidebar">
					<div class="accordionContent">
						<ul class="tree treeFolder">
						
							<li><a href="javascript:;" >项目管理后台</a>
								<ul>
									<li><a href="./js/dwz/main.html" target="navTab" rel="main">秀软简介</a></li>
									<li><a href="./project_list" target="navTab" rel="page_list">项目管理</a></li>
								<!-- 	<li><a href="/jsp/category/add_category.jsp" target="navTab" rel="addcategory">增加分类</a></li> 
									<li><a href="/query_template" target="navTab" rel="querytemplate">模板列表</a></li>-->
								<!-- 	<li><a href="/js/dwz/chart/test/barchart.html" target="navTab" rel="chart">柱状图(垂直)</a></li>
									<li><a href="/js/dwz/chart/test/hbarchart.html" target="navTab" rel="chart">柱状图(水平)</a></li>
									<li><a href="/js/dwz/chart/test/linechart.html" target="navTab" rel="chart">折线图</a></li>
									<li><a href="/js/dwz/chart/test/linechart2.html" target="navTab" rel="chart">曲线图</a></li>
									<li><a href="/js/dwz/chart/test/linechart3.html" target="navTab" rel="chart">曲线图(自定义X坐标)</a></li>
									-->
									
								<!-- 	<li><a href="/js/dwz/demo_page2.html" target="navTab" rel="external" external="true">iframe navTab页面</a></li>
									<li><a href="/js/dwz/demo_page1.html" target="navTab" rel="page1" fresh="false">替换页面一</a></li>
									<li><a href="/js/dwz/demo_page2.html" target="navTab" rel="page2">页面二</a></li>
									<li><a href="/js/dwz/demo_page4.html" target="navTab" rel="page3" title="页面三（自定义标签名）">页面三</a></li>
									<li><a href="/js/dwz/demo_page4.html" target="navTab" rel="page4" fresh="false">测试页面（fresh="false"）</a></li>
									<li><a href="/js/dwz/w_editor.html" target="navTab">表单提交会话超时</a></li>
									<li><a href="/js/dwz/demo/common/ajaxTimeout.html" target="navTab">navTab会话超时</a></li>
									<li><a href="/js/dwz/demo/common/ajaxTimeout.html" target="dialog">dialog会话超时</a></li>
									<li><a href="/js/dwz/index_menu.html" target="_blank">横向导航条</a></li> -->
								</ul>
							</li>
							
							<li><a>用户管理</a>
							<ul>
									<c:if test="${login_user.userName=='admin'}">
										<li><a href="./user_list" target="navTab" rel="page_list">用户列表</a></li>
										<li><a href="./add_user" target="navTab" rel="addUser">添加用户</a></li>
									</c:if>
							</ul>
							</li>
							
							
	
							
							<!--  <li><a>常用组件</a>
								<ul>
									<li><a href="/js/dwz/w_panel.html" target="navTab" rel="w_panel">面板</a></li>
									<li><a href="/js/dwz/w_tabs.html" target="navTab" rel="w_tabs">选项卡面板</a></li>
									<li><a href="/js/dwz/w_dialog.html" target="navTab" rel="w_dialog">弹出窗口</a></li>
									<li><a href="/js/dwz/w_alert.html" target="navTab" rel="w_alert">提示窗口</a></li>
									<li><a href="/js/dwz/w_list.html" target="navTab" rel="w_list">CSS表格容器</a></li>
									<li><a href="/js/dwz/demo_page1.html" target="navTab" rel="w_table">表格容器</a></li>
									<li><a href="/js/dwz/w_removeSelected.html" target="navTab" rel="w_table">表格数据库排序+批量删除</a></li>
									<li><a href="/js/dwz/vw_tree.html" target="navTab" rel="w_tree">树形菜单</a></li>
									<li><a href="/js/dwz/w_accordion.html" target="navTab" rel="w_accordion">滑动菜单</a></li>
									<li><a href="/js/dwz/w_editor.html" target="navTab" rel="w_editor">编辑器</a></li>
									<li><a href="/js/dwz/w_datepicker.html" target="navTab" rel="w_datepicker">日期控件</a></li>
									<li><a href="/js/dwz/demo/database/db_widget.html" target="navTab" rel="db">suggest+lookup+主从结构</a></li>
									<li><a href="/js/dwz/demo/database/treeBringBack.html" target="navTab" rel="db">tree查找带回</a></li>
									<li><a href="/js/dwz/demo/sortDrag/1.html" target="navTab" rel="sortDrag">单个sortDrag示例</a></li>
									<li><a href="/js/dwz/demo/sortDrag/2.html" target="navTab" rel="sortDrag">多个sortDrag示例</a></li>
								</ul>
							</li>
									
							<li><a>表单组件</a>
								<ul>
									<li><a href="/js/dwz/w_validation.html" target="navTab" rel="w_validation">表单验证</a></li>
									<li><a href="/js/dwz/w_button.html" target="navTab" rel="w_button">按钮</a></li>
									<li><a href="/js/dwz/w_textInput.html" target="navTab" rel="w_textInput">文本框/文本域</a></li>
									<li><a href="/js/dwz/w_combox.html" target="navTab" rel="w_combox">下拉菜单</a></li>
									<li><a href="/js/dwz/w_checkbox.html" target="navTab" rel="w_checkbox">多选框/单选框</a></li>
									<li><a href="/js/dwz/demo_upload.html" target="navTab" rel="demo_upload">iframeCallback表单提交</a></li>
									<li><a href="/js/dwz/w_uploadify.html" target="navTab" rel="w_uploadify">uploadify多文件上传</a></li>
								</ul>
							</li>
							<li><a>组合应用</a>
								<ul>
									<li><a href="/js/dwz/demo/pagination/layout1.html" target="navTab" rel="pagination1">局部刷新分页1</a></li>
									<li><a href="/js/dwz/demo/pagination/layout2.html" target="navTab" rel="pagination2">局部刷新分页2</a></li>
								</ul>
							</li>
							<li><a>图表</a>
								<ul>
									<li><a href="/js/dwz/chart/test/barchart.html" target="navTab" rel="chart">柱状图(垂直)</a></li>
									<li><a href="/js/dwz/chart/test/hbarchart.html" target="navTab" rel="chart">柱状图(水平)</a></li>
									<li><a href="/js/dwz/chart/test/linechart.html" target="navTab" rel="chart">折线图</a></li>
									<li><a href="/js/dwz/chart/test/linechart2.html" target="navTab" rel="chart">曲线图</a></li>
									<li><a href="/js/dwz/chart/test/linechart3.html" target="navTab" rel="chart">曲线图(自定义X坐标)</a></li>
									<li><a href="/js/dwz/chart/test/piechart.html" target="navTab" rel="chart">饼图</a></li>
								</ul>
							</li>
							<li><a href="/js/dwz/dwz.frag.xml" target="navTab" external="true">dwz.frag.xml</a></li>-->
						</ul>
					</div>
					<!-- <div class="accordionHeader">
						<h2><span>Folder</span>典型页面</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder treeCheck">
							<li><a href="/js/dwz/demo_page1.html" target="navTab" rel="demo_page1">查询我的客户</a></li>
							<li><a href="/js/dwz/demo_page1.html" target="navTab" rel="demo_page2">表单查询页面</a></li>
							<li><a href="/js/dwz/demo_page4.html" target="navTab" rel="demo_page4">表单录入页面</a></li>
							<li><a href="/js/dwz/demo_page5.html" target="navTab" rel="demo_page5">有文本输入的表单</a></li>
							<li><a href="javascript:;">有提示的表单输入页面</a>
								<ul>
									<li><a href="javascript:;">页面一</a></li>
									<li><a href="javascript:;">页面二</a></li>
								</ul>
							</li>
							<li><a href="javascript:;">选项卡和图形的页面</a>
								<ul>
									<li><a href="javascript:;">页面一</a></li>
									<li><a href="javascript:;">页面二</a></li>
								</ul>
							</li>
							<li><a href="javascript:;">选项卡和图形切换的页面</a></li>
							<li><a href="javascript:;">左右两个互动的页面</a></li>
							<li><a href="javascript:;">列表输入的页面</a></li>
							<li><a href="javascript:;">双层栏目列表的页面</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>流程演示</h2>
					</div>
						 -->
					<div class="accordionContent">
						<ul class="tree">
							<li><a href="./js/dwz/newPage1.html" target="dialog" rel="dlg_page">列表</a></li>
							<li><a href="./js/dwz/newPage1.html" target="dialog" rel="dlg_page2">列表</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">华为简介</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox" style="margin:5px;">
			<p style="font-size: 24px;">
			<br/>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;深圳市秀软科技有限公司成立2012年，致力于移动应用定制开发服务，公司从事移动终 端应用软件开发，服务器平台开发。致力于将传统各行业与移动互联网相 结合，融入创新理念，增加产品价值。公司坚持“创新，高效，共赢，服 务”的企业精神，秉承科技为先，以人为本的管理理念，为每一位客户提 供优秀的产品，优质的服务，良好的合作共赢模式。 

			</p>
				</div>
			</div>
		</div>

	</div>

	<div id="footer">Copyright &copy; 2010 <a href="demo_page2.html" target="dialog">DWZ团队</a> 京ICP备05019125号-10</div>
</div>
</body>
</html>