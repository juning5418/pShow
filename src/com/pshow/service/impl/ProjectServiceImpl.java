package com.pshow.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pshow.mapper.ProjectMapper;
import com.pshow.pojo.Project;
import com.pshow.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private ProjectMapper projectMapper;
	
	/**
	 * 增加一个项目
	 * @param project
	 * @return
	 */
	public boolean addProject(Project project){
		if(projectMapper.addProject(project) == 1)return true;
		return false;
	}
	
	/**
	 * 删除一个项目
	 * @param project
	 * @return
	 */
	public boolean delProject(Project project){
		if(projectMapper.delProject(project) > 0)return true;
		return false;
	}
	
	/**
	 * 编辑一个项目
	 * @param project
	 * @return
	 */
	public boolean editProject(Project project){
		if(projectMapper.editProject(project) == 1)return true;
		return false;
	}
	
	/**
	 * 得到一个项目
	 * @param project
	 * @return
	 */
	public Project loadProject(Project project){
		return projectMapper.loadProject(project);
	}
	
	/**
	 * 项目列表
	 * @param map
	 * @return
	 */
	public List<Project> queryProject(HashMap<String,Object> map){
		return projectMapper.queryProject(map);
	}
	
	/**
	 * 获取项目数量
	 * @param map
	 * @return
	 */
	public int queryProjectCount(HashMap<String,Object> map){
		return projectMapper.queryProjectCount(map);
	}
}
