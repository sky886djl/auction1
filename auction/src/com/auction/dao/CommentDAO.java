package com.auction.dao;

import java.util.List;

import com.auction.entity.Comment;

public interface CommentDAO {
	
	/**
	 * 发布评论
	 */
	public int addComment(Comment comment);
	
	/**
	 * 删除评论
	 */
	
	/**
	 * 根据拍卖品编号查询评论
	 */
	public List<Comment> getCommentsByProId(int pro_id);
	
	/**
	 * 删除评论
	 * @param id
	 * @return
	 */
	public int deleteComment(int id);
	
	/**
	 * 根据用户编号查询评论
	 */
	public List<Comment> getCommentsByUserId(int user_id);

	/**
	 * 根据评论编号查询评论
	 * @param id
	 * @return
	 */
	public Comment getCommentById(int id);
}
