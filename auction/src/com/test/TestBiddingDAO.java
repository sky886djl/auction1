package com.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.auction.entity.Bidding;
import com.auction.entity.Message;
import com.auction.entity.Product;
import com.auction.entity.User;

public class TestBiddingDAO {
	private static SqlSessionFactory sqlSessionFactory;
	private static SqlSession sqlSession;

	public static void init() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			sqlSession = sqlSessionFactory.openSession();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void destory() {
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	public static void main(String[] args) {
		init();
//		List<Bidding> selectList = sqlSession.selectList("com.auction.dao.BiddingDAO.list");
//		for (Bidding bidding : selectList) {
//			System.out.println(bidding);
//		}
		getMaxPriceBidding();
		destory();
	}
	
	/**
	 * 根据商品id获取所有保证金记录
	 * 
	 * @return
	 */
	
	public static void getAllBidding() {
		Map<String, Object> map = new HashMap<>();
		map.put("buyer_id", 3);
		map.put("pro_id", 2);
		map.put("status", 2);
		List<Bidding> deposits = sqlSession.selectList("getAllBidding", map);
		System.out.println(deposits.size()>0);
		for (Bidding de : deposits) {
			System.out.println(de);
		}
	}
	
	public static void getMaxPriceBidding() {
		List<Bidding> deposit = sqlSession.selectList("getMaxPriceBidding", 46);
		System.out.println(deposit);
	}
	
	public static void testgetBiddingsByBuyerId1() {
		List<Bidding> biddings = sqlSession.selectList("getBiddingsByBuyerId1", 26);
		Map<Integer, Bidding> format = format(biddings);
		Set<Integer> keySet = format.keySet();
		Iterator<Integer> iterator = keySet.iterator();
		int pro_id=0;
		while(iterator.hasNext()) {
			pro_id=iterator.next();
			System.out.println("pro_id:"+pro_id+",value:"+format.get(pro_id).getPro_id());
		}
	}
	private static Map<Integer, Bidding> format(List<Bidding> biddings) {
		if(biddings==null||biddings.size()==0)
			return null;
		Product product = null;
		Map<Integer, Bidding> map = new HashMap<>();
		for(Bidding bidding : biddings) {
			product=bidding.getPro_id();
			formatStatus(product);
			if(!map.containsKey(product.getId())) {
				map.put(product.getId(), bidding);
			} else if(bidding.getMoney()>map.get(product.getId()).getMoney()) {
				map.put(product.getId(), bidding);
			}
		}
		return map;
	}
	private static void formatStatus(Product product) {
		if(product==null)
			return;
		long now = new Date().getTime();
		if (now > product.getDeadline().getTime()){
			product.setStatus(4);//已结束
		} else if (product.getStart_time().getTime() > now) {
			product.setStatus(12);//即将开始
		} else {
			product.setStatus(11);//已开始
		}
	}
	
	public static void getMessageByMessage() {
		Message message = new Message();
		message.setContent("尊敬的LiMing,你参与报名的'翡翠手镯'正在火热进行中，赶快来参与竞拍吧~");
		message.setMsgType(3);
		message.setPro_id(new Product(11));
		message.setOrigin_user_id(new User(10));
		Object selectOne = sqlSession.selectOne("getMessageByMessage",message);
		System.out.println(selectOne);
	}
	
	public static void testMesad() {
		// 该用户参与的拍卖
		User user= new User(10);
		List<Bidding> list = sqlSession.selectList("getBiddingsByBuyerId1",10);
		Product product=null;
		Bidding currentMax=null,bidding=null;
		Map<Integer, Bidding> biddingMap = format(list);//key为pro_id 
		Iterator<Integer> iterator = biddingMap.keySet().iterator();
		int pro_id=0;
		Message message=null;
		StringBuilder sbBuilder=new StringBuilder();
		while(iterator.hasNext()) {
			pro_id=iterator.next();
			bidding=biddingMap.get(pro_id);
			product=bidding.getPro_id();
			message=new Message();
			message.setMsgType(3);
			message.setOrigin_user_id(user);
			message.setPro_id(product);
			if(product.getStatus()==11) {//正在进行
				if(bidding.getStatus()==2) {//仅交了保证金，生成消息
					sbBuilder.append("尊敬的").append(user.getName())
					.append(",你参与报名的'").append("code").append("'正在火热进行中，赶快来参与竞拍吧~");
				} 
			} else if(product.getStatus()==4) {//已结束，生成消息
				currentMax=sqlSession.selectOne("getMaxPriceBidding",product.getId());//获取当前拍卖品最高出价记录
				if(currentMax!=null&&currentMax.getBuyer_id().getId()==user.getId())//当前用户成功竞拍！
					sbBuilder.append("尊敬的").append(user.getName())
					.append("，恭喜你，你参与的竞拍'").append("code").append("'已经结束，幸运的你是最终的获胜者，请在3日内交付余款完成拍卖交易，否则，你的保证金不会退还噢！");
				else if(bidding.getStatus()==2) {//拍卖结束 仅交了保证金
					sbBuilder.append("尊敬的").append(user.getName()).append("，你参与的竞拍'")
					.append("code").append("'已经结束，您还未出价竞拍，保证金将在3个工作日内退还！");
				} else if(bidding.getStatus()==1) {//竞拍失败的用户
					System.out.println("竞拍失败的用户，pro_id"+pro_id);
					sbBuilder.append("尊敬的").append(user.getName()).append("，你参与的竞拍'").append("code")
					.append("'已经结束，很遗憾你的出价未能胜出，保证金将在3个工作日内退还！");
				}
			}
			//新增消息
			String content=sbBuilder.toString().replace("code", product.getName());
			System.out.println(content);
			/*message.setContent(sbBuilder.toString());
			if(content!=null&&content.length()>0&&(int)(sqlSession.selectOne("getMessageByMessage",message))==0) {
				System.out.println("add message:"+message);
				sqlSession.insert("addMessage",message);
			}*/
			sbBuilder.setLength(0);
		}
		
		//退款后再更新竞拍记录的状态....
	}
	/**
	 * 增加一条记录
	 * 
	 * @param deposit
	 * @return
	 */
	
	/*public void addBidding() {
		Bidding deposit = new Bidding();
		deposit.setPro_id(1);
		deposit.setBuyer_id(3);
		deposit.setMoney(100);
		System.out.println(sqlSession.insert("addBidding", deposit));
	}

	*//**
	 * 修改状态表示完成
	 * 
	 * @param deposit
	 * @return
	 *//*
	
	public void updateBidding() {
		Bidding deposit = new Bidding();
		deposit.setPro_id(17);
		deposit.setIsOver(0);
		deposit.setBuyer_id(null);
		System.out.println(sqlSession.update("updateBidding", deposit));
	}

	*//**
	 * 删除一条记录
	 *//*
	
	public void removeBidding() {
		Bidding deposit = new Bidding();
		deposit.setBuyer_id(3);
		deposit.setPro_id(1);
		System.out.println(sqlSession.delete("removeBidding", deposit));
	}

	
	

	
	public void getAllBiddingByPro() {
		Map<String, Integer> map = new HashMap<>();
		map.put("pro_id", 20);
		map.put("start", 0);
		map.put("size", 4);
		List<Bidding> deposit = sqlSession.selectList("getAllBiddingByPro", map);

		System.out.println(deposit);
	}
*/
}
