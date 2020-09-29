package com.auction.entity;

import java.util.Date;

public class Article {
	private int id;
	private String title ;
	private int category ;
	private String content ;
	private int browseTimes;
	private Date releaseTime;
	private int admin_id ;
	private int status ;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBrowseTimes() {
		return browseTimes;
	}
	public void setBrowseTimes(int browseTimes) {
		this.browseTimes = browseTimes;
	}
	
	public Date getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
	}
	
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", category=" + category + ", content=" + content
				+  ", browseTimes=" + browseTimes + ", releaseTime=" + releaseTime + ", admin_id="
				+ admin_id + ", status=" + status + "]";
	}
	
	
	
}
