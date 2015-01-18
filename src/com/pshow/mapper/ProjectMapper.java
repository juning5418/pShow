package com.pshow.mapper;

import java.util.HashMap;
import java.util.List;

import com.pshow.pojo.Project;

public interface ProjectMapper {
	/**
	 * 增加一个项目
	 * @param project
	 * @return
	 */
	public int addProject(Project project);
	
	/**
	 * 删除一个项目
	 * @param project
	 * @return
	 */
	int delProject(Project project);
	
	/**
	 * 编辑一个项目
	 * @param project
	 * @return
	 */
	int editProject(Project project);
	
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
