package com.auction.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.BiddingDAO;
import com.auction.entity.Bidding;
import com.auction.service.IBiddingService;

@Service("biddingService")
public class BiddingServiceImpl implements IBiddingService {
	@Autowired
	private BiddingDAO biddingDAO;
	public int addBidding(Bidding bidding) {
		return biddingDAO.addBidding(bidding);
	}
	@Override
	public int deleteBiddingsByIds(int[] ids) {
		return biddingDAO.deleteBiddingsByIds(ids);
	}
	@Override
	public List<Bidding> getBiddingsByProId(int id) {
		return biddingDAO.getBiddingsByProId(id);
	}
	@Override
	public List<Bidding> list() {
		return biddingDAO.list();
	}

	@Override
	public int deleteBiddingById(int id) {
		return biddingDAO.deleteBiddingById(id);
	}
	
	@Override
	public List<Bidding> getAllBidding(Map<String, Object> conditions){
		return biddingDAO.getAllBidding(conditions);
	}
	
	@Override
	public List<Bidding> getAllBiddingByProNoLimit(int pro_id) {
		return biddingDAO.getAllBiddingByProNoLimit(pro_id);
	}
	
	/**
	 * 修改
	 * @param bidding
	 * @return
	 *//*
	public int updateBidding(Bidding bidding) {
		return biddingDAO.updateBidding(bidding);
	}
	
	*//**
	 * 删除一条记录
	 *//*
	public int removeBidding(Bidding bidding) {
		return biddingDAO.removeBidding(bidding);
	}
	
	*//**
	 * 获取某个商品最高价的拍卖记录
	 * @return
	 */
	public Bidding getMaxPriceBidding(int pro_id) {
		List<Bidding> biddings = biddingDAO.getMaxPriceBidding(pro_id);
		return biddings.size()>0?biddings.get(0):null;
	}
	@Override
	public List<Bidding> getBiddingsByBuyerId(int buyer_id) {
		return biddingDAO.getBiddingsByBuyerId(buyer_id);
	}
	@Override
	public List<Bidding> getBiddingsByBuyerId1(int buyer_id) {
		return biddingDAO.getBiddingsByBuyerId1(buyer_id);
	}
	@Override
	public List<Bidding> getNewBiddingsByProId(int pro_id) {
		return biddingDAO.getNewBiddingsByProId(pro_id);
	}
	
	@Override
	public int updateStatus(int id, int status) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("status", status);
		return biddingDAO.updateStatus(map);
	}
	
	/**
	 * 查询某商品所有竞拍记录
	 *//*
	public List<Bidding> getAllBiddingByPro(Map<String,Integer> map) {
		List<Bidding> list=biddingDAO.getAllBiddingByPro(map);
		if(list.size()>0)
		for(Bidding bid:list) {
			bid.setOpTimeStr(DateFormate.formatDate1(bid.getOpTime()));
			bid.setFormatMoney(MoneyFormat.moneyFormat(bid.getMoney()));
		}
		return list;
	}

	@Override
	public int getTotalCount(int pro_id) {
		return biddingDAO.getTotalCount(pro_id);
	}

	

	@Override
	public List<Bidding> getAllBiddingByPidAndBidpri(Map<String, Object> map) {
		return biddingDAO.getAllBiddingByPidAndBidpri(map);
	}*/
}
