package com.auction.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.SubscribeDAO;
import com.auction.entity.Subscribe;
import com.auction.service.ISubscribeService;

@Service("subscribeService")
public class SubscribeServiceImpl implements ISubscribeService {
	@Autowired
	private SubscribeDAO subscribeDAO;
	/**
	 * 根据用户id查询所有提醒信息
	 * @param user_id
	 * @return
	 */
	public List<Subscribe> getAllSubscribesByUserId(int user_id){
		return subscribeDAO.getAllSubscribesByUserId(user_id);
	}
	
	/**
	 * 根据用户id查询所有提醒信息
	 * @param user_id
	 * @return
	 */
	public List<Subscribe> getAllSubscribesByUserId2(int user_id){
		return subscribeDAO.getAllSubscribesByUserId2(user_id);
	}
	
	@Override
	public int cancelSubscribe(int user_id,int pro_id) {
		Map<String, Integer> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("pro_id", pro_id);
		return subscribeDAO.cancelSubscribe(map);
	}

	@Override
	public int addSubscribe(int user_id,int pro_id,int pro_status) {
		Map<String, Integer> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("pro_id", pro_id);
		map.put("pro_status", pro_status);
		return subscribeDAO.addSubscribe(map);
	}
	
	@Override
	public Subscribe getSubscribe(int user_id,int pro_id) {
		Map<String, Integer> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("pro_id", pro_id);
		return subscribeDAO.getSubscribe(map);
	}

	@Override
	public int updateStatus(int pro_status, int id) {
		Map<String, Integer> map = new HashMap<>();
		map.put("pro_status", pro_status);
		map.put("id", id);
		return subscribeDAO.updateStatus(map);
	}
}
