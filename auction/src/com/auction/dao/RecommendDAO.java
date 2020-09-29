package com.auction.dao;

import java.util.List;

import com.auction.entity.Recommend;

public interface RecommendDAO {
	/**
	 * 增加提醒
	 */
	public int addRecommend(Recommend recommend);
	
	/**
	 * 增加提醒
	 */
	public Recommend getRecommend(Recommend recommend);
	
	/**
	 * 根据用户编号查询推荐信息
	 */
	public List<Recommend> getRecommendsByUserId(int user_id);
}
