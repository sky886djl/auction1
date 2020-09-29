package com.auction.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Comment {
	private int id;
	private int pro_id;
	private Product product;
	private User user_id;
	private String content;
	private Integer originalPost_id;
	private Date commentTime;
	private List<Comment> replys=new ArrayList<>();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public User getUser_id() {
		return user_id;
	}
	public void setUser_id(User user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getOriginalPost_id() {
		return originalPost_id;
	}
	public void setOriginalPost_id(Integer originalPost_id) {
		this.originalPost_id = originalPost_id;
	}
	public Date getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}
	public List<Comment> getReplys() {
		return replys;
	}
	public void setReplys(List<Comment> replys) {
		this.replys = replys;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", pro_id=" + pro_id + ", product=" + product + ", user_id=" + user_id
				+ ", content=" + content + ", originalPost_id=" + originalPost_id + ", commentTime=" + commentTime
				+ ", replys=" + replys + "]";
	}
	
	
	
	
	
}
