package com.auction.dao;

import java.util.List;
import java.util.Map;

import com.auction.entity.Subscribe;

public interface SubscribeDAO {
	/**
	 * 根据用户id查询所有提醒信息
	 * @param user_id
	 * @return
	 */
	public List<Subscribe> getAllSubscribesByUserId(int user_id);
	/**
	 * 根据用户id查询所有提醒信息
	 * @param user_id
	 * @return
	 */
	public List<Subscribe> getAllSubscribesByUserId2(int user_id);
	
	/**
	 * 设置提醒
	 * @param 
	 * user_id pro_id
	 * @return
	 */
	public int addSubscribe(Map<String,Integer> map);
	
	/**
	 * 获取提醒
	 * @param 
	 * user_id pro_id
	 * @return
	 */
	public Subscribe getSubscribe(Map<String,Integer> map);
	
	/**
	 * 取消提醒
	 * @param id
	 * @return
	 */
	public int cancelSubscribe(Map<String,Integer> map);
	
	public int updateStatus(Map<String, Integer> map);
}
