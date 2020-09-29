package com.auction.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.CommentDAO;
import com.auction.dao.ProductDAO;
import com.auction.entity.Comment;
import com.auction.service.ICommentService;

@Service("commentService")
public class CommentServiceImpl implements ICommentService {
	@Autowired
	private CommentDAO commentDAO;
	@Autowired
	private ProductDAO productDAO;
	@Override
	public int submitComment(Comment comment) {
		return commentDAO.addComment(comment);
	}
	@Override
	public List<Comment> getCommentsByProId(int pro_id) {
		List<Comment>list=commentDAO.getCommentsByProId(pro_id);
    	List<Comment> origin=new ArrayList<>();
    	for(Comment c:list) {
    		if(c.getOriginalPost_id()==null) {
    			origin.add(c);
    		} else {
    			for(Comment o:origin) {
    				if(c.getOriginalPost_id()==o.getId())
    					o.getReplys().add(c);
    			}
    		}
    	}
    	Collections.sort(origin, new Comparator<Comment>() {
    		@Override
			public int compare(Comment o1, Comment o2) {
				long d1=o1.getCommentTime().getTime();
				long d2=o2.getCommentTime().getTime();
				return d1>d2?-1:(d1==d2?0:1);
			}
		});
		return origin;
	}
	@Override
	public int delete(int id) {
		return commentDAO.deleteComment(id);
	}
	
	@Override
	public List<Comment> getCommentsByUserId(int user_id) {
		List<Comment> list = commentDAO.getCommentsByUserId(user_id);
		for(Comment c:list) {
			c.setProduct(productDAO.getProductById(c.getPro_id()));
		}
		return list;
	}
	@Override
	public Comment getCommentById(int id) {
		return commentDAO.getCommentById(id);
	}

}
