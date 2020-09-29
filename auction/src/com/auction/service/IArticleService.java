package com.auction.service;

import java.util.List;

import com.auction.entity.Article;

public interface IArticleService {
	
	/**
	 * 
	 * @param type ='announcement'|'news'|'system'
	 * @param limit 限制查询数量
	 * @return
	 */
	public List<Article> findAllAricles(String type,int limit);
	
	/**
	 * 获取所有文章
	 * @return
	 */
	public List<Article> getAllAricles();
	/**
	 * 获取委托者的所有文章
	 * @return
	 */
	public List<Article> getAllAriclesBySellerId(int seller_id);
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public Article getAricleById(int id);
	
	/**
	 * 修改一条记录
	 * @param article
	 * @return
	 */
	public int updateAricle(Article article);
	
	/**
	 * 根据id删除
	 * @param id
	 * @return
	 */
	public int deleteAricleById(int id);
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public int deleteAriclesByIds(int[] ids);
	
	/**
	 * 新增-保存草稿
	 * @param article
	 * @return
	 */
	public int add_saveAricle(Article article);
	
	/**
	 * 新增-发布文章
	 * @param article
	 * @return
	 */
	public int add_submitAricle(Article article);
	
	
	/**
	 * 更新-保存草稿
	 * @param article
	 * @return
	 */
	public int update_saveAricle(Article article);
	
	/**
	 * 更新-发布文章
	 * @param article
	 * @return
	 */
	public int update_submitAricle(Article article);
	
}
