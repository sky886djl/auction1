package com.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.RecommendDAO;
import com.auction.entity.Recommend;
import com.auction.service.IRecommendService;

@Service("recommendService")
public class RecommendServiceImpl implements IRecommendService {
	@Autowired
	private RecommendDAO recommendDAO;
	
	@Override
	public int addRecommend(Recommend recommend) {
		return recommendDAO.addRecommend(recommend);
	}

	@Override
	public List<Recommend> getRecommendsByUserId(int user_id) {
		return recommendDAO.getRecommendsByUserId(user_id);
	}

	@Override
	public Recommend getRecommend(Recommend recommend) {
		return recommendDAO.getRecommend(recommend);
	}
	
	
}
