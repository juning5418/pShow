package com.pshow.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pshow.mapper.UserMapper;
import com.pshow.pojo.User;
import com.pshow.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 增加一个用户
	 * @param user
	 * @return
	 */
	public boolean addUser(User user){
		if(userMapper.addUser(user) == 1)return true;
		return false;
	}
	
	/**
	 * 删除一个用户
	 * @param user
	 * @return
	 */
	public boolean delUser(User user){
		if(userMapper.delUser(user) == 1)return true;
		return false;
	}
	
	/**
	 * 编辑一个用户
	 * @param user
	 * @return
	 */
	public boolean editUser(User user){
		if(userMapper.editUser(user) == 1)return true;
		return false;
	}
	
	/**
	 * 得到一个用户
	 * @param user
	 * @return
	 */
	public User loadUser(User user){
		return userMapper.loadUser(user);
	}
	
	/**
	 * 用户列表
	 * @param map
	 * @return
	 */
	public List<User> queryUser(HashMap<String,Object> map){
		return userMapper.queryUser(map);
	}
	
	/**
	 * 获取用户数量
	 * @param map
	 * @return
	 */
	public int queryUserCount(HashMap<String,Object> map){
		return userMapper.queryUserCount(map);
	}
}
