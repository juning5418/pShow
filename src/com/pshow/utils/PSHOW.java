package com.pshow.utils;

public class PSHOW {
	/** ajax请求返回的RESULT **/
	public final static String OPERATION_DONE = "/jsp/ajaxDone";

	/** 请求错误状态码 **/
	public final static int STATUS_CODE_ERROR = 300;

	/** 请求错误状态码 **/
	public final static int STATUS_CODE_SUCCESS = 200;

	/** 文件类型，对应数据库字段 这个是 doc **/
	public final static String VIEW_TYPE_DOC = "1";

	/** 文件类型，对应数据库字段 这个是 ppt **/
	public final static String VIEW_TYPE_PPT = "2";

	/** 文件类型，对应数据库字段 这个是 video **/
	public final static String VIEW_TYPE_VIDEO = "3";

	public final static int CUT_PIC_HEIGHT = 300;// 截图高

	public final static String LOGIN_USER = "login_user";

	public final static String LOGIN_ROLE = "login_role";
	
	public final static int STATUS_CODE_LOGIN = 301;
	
	public final static int STATUS_CODE_ROLE = 300;
	
	public final static String[] PROJECT_ARRAY = {"项目名称","项目代号","客户","联系人","联系方式","创建时间","开始时间","截止时间","备注"};
}
