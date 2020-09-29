package com.auction.service;

import java.util.List;

import com.auction.entity.Order1;

public interface IOrderService {
	/**
	 * 根据买家查询所有订单信息
	 *  type -0-全部  -1-待发货 -2-待收货 -3-订单完成
	 * @param buyer_id
	 * @return
	 */
	public List<Order1> getAllOrdersByBuyer(int buyer_id,int type);
	
	/**
	 * 根据多个拍卖品编号查询订单信息
	 * @param pro_ids
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
	public int delOrder(String order_id);
	/**
	 * 批量删除订单
	 * @param order_id
	 * @return
	 */
	public int delOrders(String[] ids);

	/**
	 * 发货处理
	 * @param id
	 * @return
	 */
	public int fahuo(String id);

	/**
	 * 收货
	 * @param id
	 * @return
	 */
	public int receive(String id);
	
}
