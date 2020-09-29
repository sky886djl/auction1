package com.auction.dao;

import java.util.List;
import java.util.Map;

import com.auction.entity.User;

public interface UserDAO {
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
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	public int update(User user);
	/**
	 * 增加用户
	 * @param user
	 * @return
	 */
	public int add(User user);
	
	/**
	 * 查询所有已删除用户
	 * @return
	 */
	public List<User> findAllDelUsers();

	/**
	 * 查询所有用户
	 * @return
	 */
	public List<User> findAllUsers();
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
	 * 启用
	 * @param ids
	 * @return
	 */
	public int activates(int[] ids);

	/**
	 * 查询email是否存在
	 * @param email
	 * @return
	 */
	public String selectEmail(String email);
	
	/**
	 * 查询tel是否存在
	 * @param tel
	 * @return
	 */
	public String selectTel(String tel);
	
	/**
	 * 获取最大的用户名
	 * @return
	 */
	public String getMaxUsername();
	
	/**
	 * 增加账户余额
	 * money 增加的钱
	 * id  用户id
	 * @return
	 */
	public int addAccount(Map<String,Object> hashmap);
	
	/**
	 * 减少账户余额
	 * money 减少的钱
	 * id  用户id
	 * @return
	 */
	public int subAccount(Map<String,Object> hashmap);
	
	
	/**
	 * 真删除
	 * id 
	 * @return
	 */
	public int deleteTrueById(int id);
	
	/**
	 * 假删除
	 * id 
	 * @return
	 */
	public int deleteFalseById(int id);
	
	
	/**
	 * 真批量删除
	 * id 
	 * @return
	 */
	public int deleteAllTrueByIds(int[] ids);
	
	/**
	 * 假批量删除
	 * id 
	 * @return
	 */
	public int deleteAllFalseByIds(int[] ids);

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
	public int changeHeadPic(Map<String,Object> map);
	
	/**
	 * 
	 * @param 修改密码
	 * @return
	 */
	public int changePwd(Map<String,Object> map);
	
}
