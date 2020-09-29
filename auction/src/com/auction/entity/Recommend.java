package com.auction.entity;

public class Recommend {
	private int id;
	private int user_id;
	private int type_id;
	public Recommend() {
		// TODO Auto-generated constructor stub
	}
	public Recommend(int user_id,int type_id) {
		this.user_id=user_id;
		this.type_id=type_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	@Override
	public String toString() {
		return "Recommend [id=" + id + ", user_id=" + user_id + ", type_id=" + type_id + "]";
	}
	
	
}
