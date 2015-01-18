package com.pshow.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pshow.mapper.UserMapper;
import com.pshow.pojo.User;

@Service
public interface UserService {
	
	/**
	 * 增加一个用户
	 * @param user
	 * @return
	 */
	boolean addUser(User user);
	
	/**
	 * 删除一个用户
	 * @param user
	 * @return
	 */
	boolean delUser(User user);
	
	/**
	 * 编辑一个用户
	 * @param user
	 * @return
	 */
	boolean editUser(User user);
	
	/**
	 * 得到一个用户
	 * @param user
	 * @return
	 */
	User loadUser(User user);
	
	/**
	 * 用户列表
	 * @param map
	 * @return
	 */
	List<User> queryUser(HashMap<String,Object> map);
	
	/**
	 * 获取用户数量
	 * @param map
	 * @return
	 */
	int queryUserCount(HashMap<String,Object> map);
}
