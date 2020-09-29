package com.auction.entity;

public class Admin {
	private int id;
	private String username;
	private String password;
	/**
	 * authority
	 *  0-	超级管理员
	 *	1-	资讯管理员
	 *	2-	产品管理员
	 *	3-	评论管理员
	 *	4-	会员管理员
	 */
	private int authority;
	/**
	 * status
	 * 2-删除（假删除）
	 * 1-启用
	 * 0-禁用
	 */
	private int status;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Admin() {
		
	}
	
	public Admin(String username,String password){
		this.username=username;
		this.password=password;
	}
	
	@Override
	public String toString() {
		return "Admin [id=" + id + ", username=" + username + ", password=" + password + ", authority=" + authority
				+ ", status=" + status + "]";
	}
	
}
