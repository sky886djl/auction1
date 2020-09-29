package com.auction.service;

import java.util.List;

import com.auction.entity.Subscribe;

public interface ISubscribeService {
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
	 * user_id pro_id pro_status
	 * @return
	 */
	public int addSubscribe(int user_id,int pro_id,int pro_status);
	
	/**
	 * 取消提醒
	 * @param 
	 * @return
	 */
	public int cancelSubscribe(int user_id,int pro_id);
	
	/**
	 * 查询提醒
	 * @param 
	 * @return
	 */
	public Subscribe getSubscribe(int user_id,int pro_id);
	
	/**
	 * 
	 */
	public int updateStatus(int status,int id);
}
