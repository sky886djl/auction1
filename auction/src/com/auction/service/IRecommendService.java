package com.auction.service;

import java.util.List;

import com.auction.entity.Recommend;

public interface IRecommendService {
	/**
	 * 增加提醒
	 */
	public int addRecommend(Recommend recommend);
	
	/**
	 * 根据用户编号查询推荐信息
	 */
	public List<Recommend> getRecommendsByUserId(int user_id);
	
	/**
	 * 增加提醒
	 */
	public Recommend getRecommend(Recommend recommend);
}
