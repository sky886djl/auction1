package com.auction.entity;

public class User {
	private int id;
	private String username;//用户名
	private String password;
	private String name;//真实姓名
	private String gender;//性别
	private int age;
	private String tel;
	private String telCode;
	private String email;
	private String emailCode;
	private String address;
	/* 用户状态status
	 * 2-删除（假删除）
	 * 1-启用
	 * 0-禁用
	 * */
	private int status; 
	private double account;//账户余额
	private String headpic;//头像
	private String declaration;//个人说明
	private int type;//1-竞买者 0-委托者
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public User(int id) {
		super();
		this.id = id;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public double getAccount() {
		return account;
	}
	public void setAccount(double account) {
		this.account = account;
	}
	
	public String getDeclaration() {
		return declaration;
	}

	public void setDeclaration(String declaration) {
		this.declaration = declaration;
	}

	public String getHeadpic() {
		return headpic;
	}

	public void setHeadpic(String headpic) {
		this.headpic = headpic;
	}

	public String getTelCode() {
		return telCode;
	}

	public void setTelCode(String telCode) {
		this.telCode = telCode;
	}

	public String getEmailCode() {
		return emailCode;
	}

	public void setEmailCode(String emailCode) {
		this.emailCode = emailCode;
	}
	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", name=" + name + ", gender="
				+ gender + ", age=" + age + ", tel=" + tel + ", email=" + email + ", address=" + address + ", status="
				+ status + ", account=" + account + ", headpic=" + headpic + "]";
	}

	
	
}
