package com.pshow.pojo;

import java.io.Serializable;

public class Tracking implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 278243123614264578L;
	
	private int id;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 介绍
	 */
	private String content;
	/**
	 * 增加时间
	 */
	private String addTime;
	/**
	 * 修改时间
	 */
	private String editTime;
	/**
	 * 删除状态，0/1,0为未删
	 */
	private String del;
	
	/**
	 * 项目Id
	 */
	private int projectId;
	
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAddTime() {
		return addTime;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	public String getEditTime() {
		return editTime;
	}
	public void setEditTime(String editTime) {
		this.editTime = editTime;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	
	
}
