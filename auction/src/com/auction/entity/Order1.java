package com.auction.entity;

import java.util.Date;

public class Order1 {
	private String id;
	private User buyer_id;
	private Product pro_id;
	private String address1;
	private String address2;
	private Date lastOpTime;
	private int status;//1-待发货 2-待收货 3-订单完成
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public User getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(User buyer_id) {
		this.buyer_id = buyer_id;
	}
	public Product getPro_id() {
		return pro_id;
	}
	public void setPro_id(Product pro_id) {
		this.pro_id = pro_id;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Date getLastOpTime() {
		return lastOpTime;
	}
	public void setLastOpTime(Date lastOpTime) {
		this.lastOpTime = lastOpTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Order1 [id=" + id + ", buyer_id=" + buyer_id + ", pro_id=" + pro_id + ", address1=" + address1
				+ ", address2=" + address2 + ", lastOpTime=" + lastOpTime + ", status=" + status + "]";
	}
	
	
}
