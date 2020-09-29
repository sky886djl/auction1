package com.auction.entity;

import java.util.Date;

public class Bidding {
	private Integer id;
	private Product pro_id;
	private User buyer_id;
	private double money;
	/*
	 * 竞价状态：
	 * 1-竞价 
	 * 		10-竞拍成功  11-竞拍失败 
	 * 2-交了保证金 
	 * 		20-保证金已经退还 21-保证金抵押拍卖价格
	 */
	private Integer status;
	private Date opTime;//提交时间
	public Bidding() {
		// TODO Auto-generated constructor stub
	}
	public Bidding(int pro_id,int user_id,double money,int status) {
		this.pro_id=new Product(pro_id);
		this.buyer_id=new User(user_id);
		this.money=money;
		this.status=status;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Product getPro_id() {
		return pro_id;
	}
	public void setPro_id(Product pro_id) {
		this.pro_id = pro_id;
	}
	public User getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(User buyer_id) {
		this.buyer_id = buyer_id;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getOpTime() {
		return opTime;
	}
	public void setOpTime(Date opTime) {
		this.opTime = opTime;
	}
	@Override
	public String toString() {
		return "Bidding [id=" + id + ", pro_id=" + pro_id + ", buyer_id=" + buyer_id +  ", money="
				+ money + ", status=" + status + ", opTime=" + opTime + "]";
	}

	
}
