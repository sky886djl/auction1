package com.auction.service;

import java.util.List;

import com.auction.entity.Admin;

public interface IAdminService {
	/**
	 * 登录
	 * @param admin
	 * @return
	 */
	public Admin login(Admin admin);
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public Admin getAdminById(int id);
	
	/**
	 * 
	 * @param username
	 * @return
	 */
	public Admin getAdminByUsername(String username);
	
	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	public int add(Admin admin);
	
	/**
	 * 按删除与否来查询管理员列表
	 * @param d =null 为启用和禁用数据   d!=null为删除状态的数据
	 * @return
	 */
	public List<Admin> list();
	
	/**
	 * 禁用
	 * @return
	 */
	public int forbid(int id);
	
	/**
	 * 启用
	 * @return
	 */
	public int activate(int id);
	
	/**
	 * @param id
	 * @return
	 */
	public int delete(int id);
	
	
	/**
	 * @param ids
	 * @return
	 */
	public int deleteAll(int[] ids);
	
	
	/**
	 * @param password
	 * @return
	 */
	public int changePwd(String password,int id);
}