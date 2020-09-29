package com.auction.entity;

import java.util.Date;

public class Message {
	private int id;
	private String content;
	private User origin_user_id;
	private Product pro_id;
	private int msgType;//1-提醒消息 2-评论回复消息 3-拍卖消息
	private int isRead;
	private Date releaseTime;//发布时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public User getOrigin_user_id() {
		return origin_user_id;
	}
	public void setOrigin_user_id(User origin_user_id) {
		this.origin_user_id = origin_user_id;
	}
	public Product getPro_id() {
		return pro_id;
	}
	public void setPro_id(Product pro_id) {
		this.pro_id = pro_id;
	}
	public int getIsRead() {
		return isRead;
	}
	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}
	public int getMsgType() {
		return msgType;
	}
	public void setMsgType(int msgType) {
		this.msgType = msgType;
	}
	public Date getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
	}
	@Override
	public String toString() {
		return "Message [id=" + id + ", content=" + content + ", origin_user_id=" + origin_user_id + ", pro_id="
				+ pro_id + ", msgType=" + msgType + ", isRead=" + isRead + ", releaseTime=" + releaseTime + "]";
	}
	
	
}
