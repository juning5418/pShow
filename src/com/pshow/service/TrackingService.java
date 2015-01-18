package com.pshow.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pshow.mapper.TrackingMapper;
import com.pshow.pojo.Tracking;

@Service
public interface TrackingService {

	/**
	 * 增加一个项目跟踪记录
	 * 
	 * @param tracking
	 * @return
	 */
	boolean addTracking(Tracking tracking);

	/**
	 * 删除一个项目跟踪记录
	 * 
	 * @param tracking
	 * @return
	 */
	boolean delTracking(Tracking tracking);

	/**
	 * 编辑一个项目跟踪记录
	 * 
	 * @param tracking
	 * @return
	 */
	boolean editTracking(Tracking tracking);

	/**
	 * 得到一个项目跟踪记录
	 * 
	 * @param tracking
	 * @return
	 */
	Tracking loadTracking(Tracking tracking);

	/**
	 * 项目跟踪记录列表
	 * 
	 * @param map
	 * @return
	 */
	List<Tracking> queryTracking(HashMap<String, Object> map);

	/**
	 * 获取项目跟踪记录数量
	 * 
	 * @param map
	 * @return
	 */
	int queryTrackingCount(HashMap<String, Object> map);
}
