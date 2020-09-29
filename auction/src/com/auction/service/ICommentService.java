package com.auction.service;

import java.util.List;

import com.auction.entity.Comment;

public interface ICommentService {
	/**
	 * 发表评论
	 * @param comment
	 */
	public int submitComment(Comment comment);
	
	/**
	 * 根据拍卖品编号查询评论信息
	 */
	public List<Comment> getCommentsByProId(int pro_id);
	
	/**
	 * 删除评论
	 * @param id
	 * @return
	 */
	public int delete(int id);
	
	/**
	 * 根据用户编号查询评论信息
	 * @param user_id
	 * @return
	 */
	public List<Comment> getCommentsByUserId(int user_id);
	
	/**
	 * 根据评论编号查询
	 */
	public Comment getCommentById(int id);
}
