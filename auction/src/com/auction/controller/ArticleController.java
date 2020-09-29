package com.auction.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.auction.entity.Article;
import com.auction.entity.User;
import com.auction.service.IArticleService;

@Controller
@RequestMapping("/article")
/**
 * product未涉及
 * @author djl
 *
 */
public class ArticleController {
	@Autowired
	private IArticleService articleService;
	
	/**
	 * 后台 资讯列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)  
	@ResponseBody  
	public Map<String, Object> list() throws Exception {  
	    List<Article> list = articleService.getAllAricles();  
	    Map<String, Object> map2Json = new HashMap<String, Object>();  
	    map2Json.put("aaData", list);
	    return map2Json;  
	} 
	
	/**
	 * 委托者-资讯列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list1",method=RequestMethod.GET)  
	@ResponseBody  
	public Map<String, Object> list1(HttpSession session) throws Exception {
		User seller = (User) session.getAttribute("seller");
		if(seller==null) {
			return null;
		}
	    List<Article> list = articleService.getAllAriclesBySellerId(seller.getId());  
	    Map<String, Object> map2Json = new HashMap<String, Object>();  
	    map2Json.put("aaData", list);
	    return map2Json;  
	} 
	
	/**
	 * 单个删除
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)  
	@ResponseBody
	public boolean delete(@RequestParam("id")int id) throws Exception { 
		return articleService.deleteAricleById(id)==1;
	} 
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deletes",method=RequestMethod.POST)  
	@ResponseBody
	public boolean deletes(@RequestParam("ids")int[] ids) throws Exception { 
		return articleService.deleteAriclesByIds(ids)==ids.length;
	} 
	
	/**
	 * 显示详情
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/show",method=RequestMethod.GET)  
	@ResponseBody  
	public Article show(@RequestParam("id")int id) throws Exception {  
	    return articleService.getAricleById(id);
	} 
	
	/**
	 * 编辑-保存草稿
	 */
	@RequestMapping(value="/edit_save",method=RequestMethod.POST)  
	@ResponseBody  
	public boolean edit_save(@RequestBody Article article) throws Exception {  
	    return articleService.update_saveAricle(article)==1;
	} 
	
	/**
	 * 编辑-提交发布
	 */
	@RequestMapping(value="/edit_submit",method=RequestMethod.POST)  
	@ResponseBody  
	public boolean edit_submit(@RequestBody Article article) throws Exception {  
	    return articleService.update_submitAricle(article)==1;
	} 
	
	/**
	 * 新增-保存草稿 ！！管理员id未设置	 产品id未设置
	 */
	@RequestMapping(value="/add_save",method=RequestMethod.POST)  
	@ResponseBody  
	public boolean add_save(@RequestBody Article article, HttpSession session) throws Exception {  
		User seller = (User)session.getAttribute("seller");
		article.setAdmin_id(seller.getId());
	    return articleService.add_saveAricle(article)==1;
	} 
	
	/**
	 * 新增-提交发布
	 */
	@RequestMapping(value="/add_submit",method=RequestMethod.POST)  
	@ResponseBody  
	public boolean add_submit(@RequestBody Article article, HttpSession session) throws Exception {  
		User seller = (User)session.getAttribute("seller");
		article.setAdmin_id(seller.getId());
	    return articleService.add_submitAricle(article)==1;
	} 
	
	
}
