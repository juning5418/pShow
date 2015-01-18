package com.pshow.mapper;

import java.util.HashMap;
import java.util.List;

import com.pshow.pojo.User;

public interface UserMapper {
	/**
	 * 增加一个用户
	 * @param user
	 * @return
	 */
	int addUser(User user);
	
	/**
	 * 删除一个用户
	 * @param user
	 * @return
	 */
	int delUser(User user);
	
	/**
	 * 编辑一个用户
	 * @param user
	 * @return
	 */
	int editUser(User user);
	
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
