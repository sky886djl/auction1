package com.auction.entity;

public class Subscribe {
	private int id;
	private int pro_id;
	private Product product;
	private	int user_id;
	private int pro_status;//设置提醒时的状态
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
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public int getPro_status() {
		return pro_status;
	}
	public void setPro_status(int pro_status) {
		this.pro_status = pro_status;
	}
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "Subscribe [id=" + id + ", pro_id=" + pro_id + ", product=" + product + ", user_id=" + user_id
				+ ", pro_status=" + pro_status + "]";
	}
	
}
