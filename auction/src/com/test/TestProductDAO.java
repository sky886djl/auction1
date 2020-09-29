package com.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.auction.entity.Bidding;
import com.auction.entity.Comment;
import com.auction.entity.Message;
import com.auction.entity.Order1;
import com.auction.entity.Product;
import com.auction.entity.Recommend;
import com.auction.entity.Subscribe;

public class TestProductDAO {
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
		}
	}

	public static void destory() {
		sqlSession.commit();
		sqlSession.close();
	}

	public static void getAllProducts() {
		List<Product> allProduct = sqlSession.selectList("getAllProducts");
		for (Product product : allProduct) {
			System.out.println(product);
		}
	}

	/**
	 * 获取所有商品
	 * 
	 * @return
	 */

	public void findAllProducts() {
		List<Product> allProduct = sqlSession.selectList("findAllProducts");
		for (Product product : allProduct) {
			System.out.println(product);
		}
	}

	/**
	 * 获取所有商品
	 * 
	 * @return
	 */

	public static void findProductsByTypeId() {
		List<Product> pro = sqlSession.selectList("findProductsByTypeId", 1);
		for (Product product : pro) {
			System.out.println(product);
		}
		Product pro1 = pro.get(0);
		System.out.println(pro1.getStart_time());
		System.out.println(new Date());
		System.out.println(pro1.getStart_time().getTime() > new Date().getTime());
	}

	/**
	 * 获取所有商品
	 * 
	 * @return
	 */

	public static void findProductsByTypeIds() {
		int[] ids = { 1, 2 };
		List<Product> pro = sqlSession.selectList("getProductsByTypeIds", ids);
		for (Product product : pro) {
			System.out.println(product);
		}
	}

	/**
	 * 通过id查询
	 * 
	 * @param id
	 * @return
	 */

	public static void getProductById() {
		List<Product> pro = sqlSession.selectList("getProductById", 5);
		Product product = pro.get(0);
		System.out.println(product);
		System.out.println(product.getType_id());
		System.out.println("卖家2" + product.getSeller_id());
	}

	/**
	 * 通过id查询
	 * 
	 * @param id
	 * @return
	 */

	public static void getProductByIds() {
		int[] ids = { 5, 4, 2, 6 };
		List<Product> pro = sqlSession.selectList("getProductByIds", ids);
		for (Product p : pro) {
			System.out.println(p);
		}
	}

	public static void testSearch() {
		Map<String, Object> map = new HashMap<>();
		map.put("bidder_id", 26);
		map.put("str", "一项");
		List<Product> pro = sqlSession.selectList("getProductsByStr", map);
		for (Product product : pro) {
			System.out.println(product);
		}
	}

	public static void testgetCommentsByProId() {
		List<Comment> iList = sqlSession.selectList("getCommentsByProId", 21);
		for (Comment c : iList) {
			System.out.println(c);
		}
	}

	public static void getCommentById() {
		Comment comment = sqlSession.selectOne("getCommentById", 13);
		System.out.println(comment);
	}

	public static void testgetProductsByBidderId() {
		Map<String, Object> map = new HashMap<>();
		map.put("bidder_id", 3);
		map.put("type", 0);
		List<Product> pro = sqlSession.selectList("getProductsByBidderId", map);
		for (Product product : pro) {
			System.out.println(product);
		}
	}

	public static void testSelectByTypeid() {
		List<Product> pro = sqlSession.selectList("getProductsByTypeId", 5);
		for (Product product : pro) {
			System.out.println(product);
		}
	}

	public void findProductsByBuyerId() {
		List<Product> pro = sqlSession.selectList("findProductsByBuyerId", 2);
		for (Product product : pro) {
			System.out.println(product);
		}
	}

	public void findProductsBySellerId() {
		List<Product> pro = sqlSession.selectList("findProductsBySellerId", 2);
		for (Product product : pro) {
			System.out.println(product);
		}
	}

	/**
	 * 通过拍卖日期筛选商品
	 * 
	 * @return
	 */

	public void findProductsByDate() {
		Map<String, Integer> map = new HashMap<>();
		map.put("year", 2018);
		map.put("month", 6);
		map.put("day", 15);
		List<Product> pro = sqlSession.selectList("findProductsByDate", map);
		for (Product product : pro)
			System.out.println(product);
	}

	/**
	 * 更新当前价格
	 * 
	 * @param product_id
	 * @param increase
	 * @return
	 */

	public void updateNowPrice() {
		Map<String, Object> map = new HashMap<>();
		map.put("product_id", 1);
		map.put("increase", 100);
		int count = sqlSession.update("updateNowPrice", map);
		System.out.println(count);
	}

	public void addPic() {
		Product pro = new Product();
		pro.setPic_url("3.jpg");
		pro.setId(1);
		int count = sqlSession.update("addPic", pro);
		System.out.println(count);
	}

	//
	// public void addProduct() {
	// /**
	// * insert into product values(null,'机械键盘','20.jpg',20,30,now(),'手感好游戏键盘',
	// 4,6,null,1,now(),1,
	// DATE_ADD(start_time,INTERVAL days DAY),0,0,DEFAULT)
	// */
	// Product pro = new Product();
	// pro.setName("王牌机械键盘");
	// pro.setPic_url("20.jpg");
	// pro.setInitialPrice(20);
	// pro.setNowPrice(30);
	// pro.setType_id(4);
	// pro.setDescription("手感好游戏键盘");
	// pro.setBuyer_id(null);
	// pro.setSeller_id(new User(4));
	// pro.setStatus(1);
	// pro.setStart_time(new Date());
	// pro.setDays(1);
	// System.out.println(sqlSession.insert("addProduct",pro));
	// }
	//

	public void forbidden() {
		System.out.println(sqlSession.update("forbideen", 1));
	}

	public void updateGrowTime() {
		System.out.println(sqlSession.update("updateGrowTime", 5));
	}

	public void deleteProduct() {
		sqlSession.update("deleteProduct", 39);
	}

	public void addClickNum() {
		System.out.println(sqlSession.update("addClickNum", 2));

	}

	public void addJoin_num() {
		System.out.println(sqlSession.update("addJoin_num", 2));
	}

	public void updateDeadline() {
		int count = sqlSession.update("updateDeadline", 2);
		System.out.println(count);
	}

	public void testformatMoney() {
		Product pro = (Product) sqlSession.selectList("getProductById", 11).get(0);
		// pro=MoneyFormat.moneyFormat(pro);
		System.out.println(pro);
	}

	/**
	 * type null不限 1-8 * state null-不限 0-结束 1-正在进行 2-即将开始 * timeArea null不限 3-三天后
	 * 7-七天后 30-最近30天 ----timeArea=null时才能考虑----> startTime endTime 两者不为null时可用 时间类型
	 * * pricelow pricehigh 两者不为null时可用 double price(1 0) bidNum(1 0) null不限 1 升序
	 * 0降序
	 */

	public void findProductsBySort() {
		Map<String, Object> map = new HashMap<>();
		// map.put("type", 7);
		map.put("state", 3);
		// map.put("startTime", "2018-6-10 7:36:10");
		// map.put("endTime", "2018-7-20 7:36:10");
		// map.put("pricelow", 3000);
		// map.put("pricehigh", 8000);
		// map.put("price", 0);
		// map.put("bidNum", 0);
		List<Product> list = sqlSession.selectList("findProductsBySort", map);
		for (Product pro : list) {
			System.out.println(pro);
		}
	}

	public void getCount() {
		int count = sqlSession.selectOne("getCount", null);
		System.out.println(count);
	}

	public void updateNowPriceAndCurrentBuyer() {
		Map<String, Object> map = new HashMap<>();
		map.put("product_id", 1);
		map.put("increase", 200);
		map.put("buyer_id", 3);
		sqlSession.update("updateNowPriceAndCurrentBuyer", map);
	}

	public static void testaddRecommend() {
		Recommend recommend = new Recommend(26, 2);
		int i = sqlSession.insert("addRecommend", recommend);
		System.out.println(i);
	}

	public static void testgetRecommend() {
		List<Recommend> list = sqlSession.selectList("getRecommendsByUserId", 26);
		for (Recommend r : list)
			System.out.println(r);
	}
	// public void noSuchBidding() {
	// ProductController pc=new ProductController();
	// System.out.println(pc.noSuchBidding(3, 2600));
	// }

	public static void testFinal() {
		// 设置提醒
		List<Subscribe> subscribes = sqlSession.selectList("getAllSubscribesByUserId", 26);
		// 参与了拍卖的
		List<Bidding> biddings = sqlSession.selectList("getBiddingsByBuyerId",26);
//		for(Subscribe subscribe:subscribes) {
//			System.out.println(subscribe);
//		}
//		
//		for(Bidding bidding:biddings) {
//			System.out.println(bidding);
//		}
		Set<Integer> ids=new HashSet<>();
		for (int i = 0; i < subscribes.size(); i++) {
			ids.add(subscribes.get(i).getPro_id());
		}
		for (int i = 0; i < biddings.size(); i++) {
			ids.add(biddings.get(i).getPro_id().getId());
		}
		Integer[] idss=ids.toArray(new Integer[ids.size()]);
		for(Integer i:idss) {
			System.out.print(i+" ");
		}
				
	}
	
	public static void testGetSubscribeByUseId2() {
		List<Subscribe>list=sqlSession.selectList("getAllSubscribesByUserId2", 26);
		for(Subscribe subscribe :list) {
			System.out.println(subscribe);
		}
	}

	public static void alreadyRead() {
		int[]ids= new int[]{4,5};
		sqlSession.update("alreadyRead", ids);
	}
	public static void getMessagesByUserIdComplex() {
		Map<String, Object> map = new HashMap<>();
		map.put("origin_user_id", 26);
		map.put("msgType", 0);
		List<Message> list = sqlSession.selectList("getMessagesByUserIdComplex",map);
		for(Message m:list) {
			System.out.println(m);
		}
	}
	
	public static void testgetAllOrdersByBuyer() {
		List<Order1> order1s=sqlSession.selectList("getAllOrdersByBuyer",26);
		System.out.println(order1s.get(0));
	}
	
	public static void orde() {
		List<Order1> selectList = sqlSession.selectList("getAllOrdersBySeller",36);
		for(Order1 o : selectList) {
			System.out.println(o);
		}
	}
	public static void testFahuo() {
		Order1 order1 = new Order1();
		order1.setId("201905061528064626");
		order1.setStatus(2);
		sqlSession.update("com.auction.dao.OrderDAO.updateStatus",order1);
	}
	public static void main(String[] args) {
		init();
		testFahuo();
		destory();
	}
}