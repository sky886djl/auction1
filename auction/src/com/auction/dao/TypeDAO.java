package com.auction.dao;

import java.util.List;
import com.auction.entity.Type;

public interface TypeDAO {
	/**
	 * 获取所有产品种类
	 * @return
	 */
	public List<Type> getAllTypes();
	
	/**
	 * 通过种类名查询种类（验证类型名的唯一性）
	 * @param typeName
	 * @return
	 */
	public Type getTypeByName(String typeName);
	
	/**
	 * @param id
	 * @return
	 */
	public Type getTypeById(int id);
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public int delete(int id);
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public int deleteAll(int[]ids);

	/**
	 * 更新
	 * @param id
	 * @return
	 */
	public int update(Type type);
	
	/**
	 * 添加
	 * @param type
	 * @return
	 */
	public int add(Type type);
	
}
