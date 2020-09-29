package com.auction.dao;

import java.util.List;
import java.util.Map;

import com.auction.entity.Article;

/**
 * 文章类DAO
 * @author Administrator
 *
 */

public interface ArticleDAO {
	
	/**
	 * 
	 * @param category=0-新闻公告、1-拍卖结果、2-系统消息
	 * @param limit 数量
	 * @return
	 */
	public List<Article> findAllAricles(Map<String, Integer> map);
	
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
	 * 根据id自增浏览量
	 * @param id
	 * @return
	 */
	public int browseTimesIncrement(int id);
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
	 * 增加一条数据
	 * @param article
	 * @return
	 */
	public int addAricle(Article article);
	
}
