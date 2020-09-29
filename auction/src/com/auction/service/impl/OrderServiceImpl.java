package com.auction.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.OrderDAO;
import com.auction.entity.Order1;
import com.auction.service.IOrderService;



@Service("orderService")
public class OrderServiceImpl implements IOrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public List<Order1> getAllOrdersByBuyer(int buyer_id,int type) {
		Map<String, Object> map = new HashMap<>();
		map.put("buyer_id", buyer_id);
		map.put("type", type);
		return orderDAO.getAllOrdersByBuyer(map);
	}

	@Override
	public List<Order1> getAllOrdersBySeller(int seller_id) {
		return orderDAO.getAllOrdersBySeller(seller_id);
	}

	@Override
	public int updateStatus(Order1 order1) {
		return orderDAO.updateStatus(order1);
	}

	@Override
	public int addOrder(Order1 order1) {
		return orderDAO.addOrder(order1);
	}

	@Override
	public int delOrder(String order_id) {
		return orderDAO.delOrder(order_id);
	}

	@Override
	public int fahuo(String id) {
		Order1 order1 = new Order1();
		order1.setId(id);
		order1.setStatus(2);
		return orderDAO.updateStatus(order1);
	}

	@Override
	public int receive(String id) {
		Order1 order1 = new Order1();
		order1.setId(id);
		order1.setStatus(3);//订单完成
		return orderDAO.updateStatus(order1);
	}

	@Override
	public int delOrders(String[] ids) {
		return orderDAO.delOrders(ids);
	}

}
