package com.auction.service;

import java.util.List;
import java.util.Map;

import com.auction.entity.Bidding;

public interface IBiddingService {
	
	/**
	 * 查询所有数据
	 * @return
	 */
	public List<Bidding> list();
	
	/**
	 * 通过拍卖品id查询所有记录 status in(1,10,11)
	 * @return
	 */
	public List<Bidding> getBiddingsByProId(int pro_id);
	/**
	 * 获取未处理的保证金或出价  status=2，1
	 * @return
	 */
	public List<Bidding> getNewBiddingsByProId(int pro_id);
	/**
	 * 删除一条记录
	 * @return
	 */
	public int deleteBiddingById(int id);
	
	/**
	 * 批量删除
	 * @return
	 */
	public int deleteBiddingsByIds(int[] ids);
	
	/**
	 * pro_id-商品id
	 * buyer_id-用户id
	 * biddstatus-竞价状态
	 * @return
	 */
	public List<Bidding> getAllBidding(Map<String, Object> conditions);
	
	/**
	 * 增加一条记录
	 * @param bidding
	 * @return
	 */
	public int addBidding(Bidding bidding);
	
	/**
	 * 获取某个商品最高价的拍卖记录
	 * @return
	 */
	public Bidding getMaxPriceBidding(int pro_id);
	
	/**
	 * 查询某商品所有竞拍记录
	 * int pro_id
	 */
	public List<Bidding> getAllBiddingByProNoLimit(int pro_id);
	
	/**
	 * 查询某竞买者的拍卖情况
	 * 且状态为1-竞拍或2-交保证金
	 */
	public List<Bidding> getBiddingsByBuyerId(int buyer_id);
	
	/**
	 * 查询某竞买者的拍卖情况
	 * 且状态为1-竞拍或2-交保证金
	 */
	public List<Bidding> getBiddingsByBuyerId1(int buyer_id);
	
	
	/**
	 * id status
	 * @param map
	 * @return
	 */
	public int updateStatus(int id,int status);
}
