package com.pshow.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pshow.mapper.ProjectMapper;
import com.pshow.pojo.Project;

public interface ProjectService {
	
	/**
	 * 增加一个项目
	 * @param project
	 * @return
	 */
	boolean addProject(Project project);
	
	/**
	 * 删除一个项目
	 * @param project
	 * @return
	 */
	boolean delProject(Project project);
	
	/**
	 * 编辑一个项目
	 * @param project
	 * @return
	 */
	boolean editProject(Project project);
	
	/**
	 * 得到一个项目
	 * @param project
	 * @return
	 */
	Project loadProject(Project project);
	
	/**
	 * 项目列表
	 * @param map
	 * @return
	 */
	List<Project> queryProject(HashMap<String,Object> map);
	
	/**
	 * 获取项目数量
	 * @param map
	 * @return
	 */
	int queryProjectCount(HashMap<String,Object> map);
}
