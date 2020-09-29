package com.auction.dao;

import java.util.List;
import java.util.Map;

import com.auction.entity.Order1;

public interface OrderDAO {
	/**
	 * 根据买家查询所有订单信息
	 * @param buyer_id type
	 * @return
	 */
	public List<Order1> getAllOrdersByBuyer(Map<String, Object> map);
	
	/**
	 * 根据委托者查询所有订单信息
	 * @param buyer_id
	 * @return
	 */
	public List<Order1> getAllOrdersBySeller(int seller_id);
	
	/**
	 * 更新订单状态
	 * @return
	 */
	public int updateStatus(Order1 order1);
	
	/**
	 * 新增订单
	 * @param order1
	 * @return
	 */
	public int addOrder(Order1 order1);
	
	/**
	 * 删除订单
	 * @param order_id
	 * @return
	 */
	public int delOrder(String id);

	/**
	 * 批量删除订单
	 * @param order_id
	 * @return
	 */
	public int delOrders(String[]ids);
}
