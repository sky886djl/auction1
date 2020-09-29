package com.auction.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.auction.entity.Comment;
import com.auction.entity.Message;
import com.auction.entity.Product;
import com.auction.entity.User;
import com.auction.service.ICommentService;
import com.auction.service.IMessageService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	private ICommentService commentService;//评论信息
	@Autowired
	private IMessageService messageService;//消息
	/**
	 * 新增评论信息
	 */
	@RequestMapping(value="/submitComment",method=RequestMethod.POST)  
	@ResponseBody
	public boolean submitComment(@RequestBody Comment comment,HttpSession session) throws Exception { 
		User user=(User)session.getAttribute("bidder");
		if(user==null) {
			return false;
		}
		comment.setUser_id(user);
		if(comment.getOriginalPost_id()==0) {
			comment.setOriginalPost_id(null);
		} else {//回复贴  新增消息给原贴用户
			Comment comment2=commentService.getCommentById(comment.getOriginalPost_id());//原贴
			User user2=comment2.getUser_id();//原贴用户
			if(user2!=null&&user.getId()!=user2.getId()) {//原贴用户和回帖用户不是同一人
				Message message = new Message();
				message.setContent(user.getName()+"回复了你的评论\""+comment2.getContent()+"\":"+comment.getContent());
				message.setOrigin_user_id(user2);
				message.setPro_id(new Product(comment2.getPro_id()));
				message.setMsgType(2);
				messageService.addMessage(message);
			}
		}
		return commentService.submitComment(comment)==1;
	}
	
	/**
	 * 删除评论信息
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)  
	@ResponseBody
	public boolean delete( @RequestParam("id")int id) throws Exception { 
		return commentService.delete(id)>0;
	}
	
	/**
	 * 根据用户id查询评论信息
	 */
	@RequestMapping(value = "/commentList",method=RequestMethod.GET)
	public ModelAndView commentList(HttpSession session) {
		ModelAndView mv = new ModelAndView("/bidder/mycomment");
		User user=(User)session.getAttribute("bidder");
		if(user==null) {
			mv.setViewName("index");
			return mv;
		}
		mv.addObject("mycomments",commentService.getCommentsByUserId(user.getId()));
		return mv;
	}
	
}
