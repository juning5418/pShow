package com.pshow.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pshow.mapper.TrackingMapper;
import com.pshow.pojo.Tracking;
import com.pshow.service.TrackingService;

@Service
public class TrackingServiceImpl implements TrackingService{
	
	@Autowired
	private TrackingMapper trackingMapper;
	
	/**
	 * 增加一个项目跟踪记录
	 * @param tracking
	 * @return
	 */
	public boolean addTracking(Tracking tracking){
		if(trackingMapper.addTracking(tracking) == 1)return true;
		return false;
	}
	
	/**
	 * 删除一个项目跟踪记录
	 * @param tracking
	 * @return
	 */
	public boolean delTracking(Tracking tracking){
		if(trackingMapper.delTracking(tracking) == 1)return true;
		return false;
	}
	
	/**
	 * 编辑一个项目跟踪记录
	 * @param tracking
	 * @return
	 */
	public boolean editTracking(Tracking tracking){
		if(trackingMapper.editTracking(tracking) == 1)return true;
		return false;
	}
	
	/**
	 * 得到一个项目跟踪记录
	 * @param tracking
	 * @return
	 */
	public Tracking loadTracking(Tracking tracking){
		return trackingMapper.loadTracking(tracking);
	}
	
	/**
	 * 项目跟踪记录列表
	 * @param map
	 * @return
	 */
	public List<Tracking> queryTracking(HashMap<String,Object> map){
		return trackingMapper.queryTracking(map);
	}
	/**
	 * 获取项目跟踪记录数量
	 * @param map
	 * @return
	 */
	public int queryTrackingCount(HashMap<String,Object> map){
		return trackingMapper.queryTrackingCount(map);
	}
}
