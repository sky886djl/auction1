package com.auction.dao;

import java.util.List;
import java.util.Map;

import com.auction.entity.Admin;

/**
 * 管理员dao
 * @author djl
 *
 */

public interface AdminDAO {
	/**
	 * 登录
	 * @param admin
	 * @return
	 */
	public Admin getAdminByAdmin(Admin admin);
	
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
	 * 更新密码
	 * @param map
	 * @return
	 */
	public int updatePwd(Map<String, Object> map);
	
}
