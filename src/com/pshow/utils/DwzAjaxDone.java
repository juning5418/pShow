package com.pshow.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class DwzAjaxDone {
	private int statusCode = PSHOW.STATUS_CODE_SUCCESS;// 请求状态码

	private String message = null;// 错误信息
	
	private String callbackType = null;
	
	private String forwardUrl = null;// 跳转URL

	private String ajaxForward(int statusCode, String message,String forwardUrl,String callbackType) {
		this.statusCode = statusCode;
		this.message = message;
		this.forwardUrl = forwardUrl;
		this.callbackType = callbackType;
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		request.setAttribute("statusCode", statusCode);
		request.setAttribute("message", message);
		request.setAttribute("forwardUrl", forwardUrl);
		request.setAttribute("callbackType", callbackType);
		return PSHOW.OPERATION_DONE;

	}

	/**
	 * ajax 提交后跳转
	 * 
	 * @param message
	 * @return
	 */
	protected  String ajaxForwardSuccess(String message) {
		return ajaxForward(PSHOW.STATUS_CODE_SUCCESS, message,"","");
	}

	/**
	 * ajax 提交失败后跳转
	 * 
	 * @param message
	 * @return
	 */
	protected String ajaxForwardError(String message) {
		return ajaxForward(PSHOW.STATUS_CODE_ERROR, message,"","");
	}
	
	protected String ajaxForwardLogin(String message,String forwardUrl,String callbackType){
		return ajaxForward(PSHOW.STATUS_CODE_LOGIN, message,forwardUrl,callbackType);
	}
	
	protected String ajaxForwardRole(String message,String forwardUrl,String callbackType){
		return ajaxForward(PSHOW.STATUS_CODE_ROLE, message,forwardUrl,callbackType);
	}

	public int getStatusCode() {

		return statusCode;

	}

	public String getMessage() {

		return message;

	}

	public String getForwardUrl() {

		return forwardUrl;

	}

	public void setForwardUrl(String forwardUrl) {

		this.forwardUrl = forwardUrl;

	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCallbackType() {
		return callbackType;
	}

	public void setCallbackType(String callbackType) {
		this.callbackType = callbackType;
	}
}
