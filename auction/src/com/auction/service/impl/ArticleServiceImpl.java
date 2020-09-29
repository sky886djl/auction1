package com.auction.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.ArticleDAO;
import com.auction.entity.Article;
import com.auction.service.IArticleService;

@Service("articleService")
public class ArticleServiceImpl implements IArticleService {
	@Autowired
	private ArticleDAO articleDAO;
	
	@Override
	public List<Article> findAllAricles(String type, int limit) {
		int category=0;
		if(type.equals("announcement")) {
			category=1;//拍卖结果
		} else if(!type.equals("news")) {
			category=2;//系统消息
		} 
		Map<String, Integer> map=new HashMap<>();
		map.put("category", category);
		map.put("limit", limit);
		return articleDAO.findAllAricles(map);
	}
	
	@Override
	public List<Article> getAllAricles() {
		return articleDAO.getAllAricles();
	}

	@Override
	public Article getAricleById(int id) {
		return articleDAO.getAricleById(id);
	}

	@Override
	public int updateAricle(Article article) {
		return articleDAO.updateAricle(article);
	}

	@Override
	public int deleteAricleById(int id) {
		return articleDAO.deleteAricleById(id);
	}

	@Override
	public int deleteAriclesByIds(int[] ids) {
		return articleDAO.deleteAriclesByIds(ids);
	}

	@Override
	public int add_saveAricle(Article article) {
		article.setStatus(0);//草稿
		return articleDAO.addAricle(article);
	}

	@Override
	public int add_submitAricle(Article article) {
		article.setStatus(1);//已发布
		return articleDAO.addAricle(article);
	}
	
	
	@Override
	public int update_saveAricle(Article article) {
		article.setStatus(0);//草稿
		return articleDAO.updateAricle(article);
	}

	@Override
	public int update_submitAricle(Article article) {
		article.setReleaseTime(new Date());//发布时间为现在
		article.setStatus(1);//已发布
		return articleDAO.updateAricle(article);
	}

	@Override
	public List<Article> getAllAriclesBySellerId(int seller_id) {
		return articleDAO.getAllAriclesBySellerId(seller_id);
	}

}
