package com.pshow.mapper;

import java.util.HashMap;
import java.util.List;

import com.pshow.pojo.Tracking;

public interface TrackingMapper {
	/**
	 * 增加一个项目跟踪记录
	 * @param tracking
	 * @return
	 */
	int addTracking(Tracking tracking);
	
	/**
	 * 删除一个项目跟踪记录
	 * @param tracking
	 * @return
	 */
	int delTracking(Tracking tracking);
	
	/**
	 * 编辑一个项目跟踪记录
	 * @param tracking
	 * @return
	 */
	int editTracking(Tracking tracking);
	
	/**
	 * 得到一个项目跟踪记录
	 * @param tracking
	 * @return
	 */
	Tracking loadTracking(Tracking tracking);
	
	/**
	 * 项目跟踪记录列表
	 * @param map
	 * @return
	 */
	List<Tracking> queryTracking(HashMap<String,Object> map);
	
	/**
	 * 获取项目跟踪记录数量
	 * @param map
	 * @return
	 */
	int queryTrackingCount(HashMap<String,Object> map);
}
