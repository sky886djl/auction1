package com.auction.service;

import java.util.List;

import com.auction.entity.User;

public interface IUserService {

	/**
	 * 查询所有用户
	 * @return
	 */
	public List<User> findAllUsers(boolean flag);

	/**
	 * 通过用户id查询用户
	 * @param id
	 * @return
	 */
	public User getUserById(int id);
	
	/**
	 * 通过用户查找用户  --登录
	 * @param user
	 * @return
	 */
	public User selectUser(User user);

	/**
	 * 增加用户
	 * @param user
	 * @return
	 */
	public int add(User user);
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	public int update(User user);
	
	/**
	 * 禁用
	 * @param id
	 * @return
	 */
	public int forbidden(int id);
	
	/**
	 * 启用
	 * @param id
	 * @return
	 */
	public int activate(int id);
	
	/**
	 * 通过email查询email
	 * @param email
	 * @return
	 */
	public String selectEmail(String email);
	
	/**
	 * 通过tel查询tel
	 * @param tel
	 * @return
	 */
	public String selectTel(String tel);
	
	/**
	 * 获取最大的username
	 * @return
	 */
	public String getMaxUsername();
	
	/**
	 * 增加账户余额
	 * money 增加的钱
	 * id  用户id
	 * @return
	 */
	public int addAccount(int id,double money);
	
	/**
	 * 减少账户余额
	 * money 减少的钱
	 * id  用户id
	 * @return
	 */
	public int subAccount(int id,double money);
	
	/**
	 * 
	 * @param flag=true 真删除  flag=false 假删除
	 * @param id
	 * @return
	 */
	public int deleteUserById(boolean flag,int id);
	
	/**
	 * 
	 * @param flag=true 真删除  flag=false 假删除
	 * @param ids
	 * @return
	 */
	public int deleteUsersByIds(boolean flag,int[] ids);
	
	/**
	 * 还原
	 * @param ids
	 * @return
	 */
	public int activates(int[]ids);

	/**
	 * 通过username查询id
	 * @param username
	 * @return
	 */
	public int getIdByUsername(String username);
	
	/**
	 * 
	 * @param newPic
	 * @return
	 */
	public int changeHeadPic(String newPic,int id);
	
	/**
	 * 修改密码
	 * @return
	 */
	public int changePwd(String newpwd,int id);
}
