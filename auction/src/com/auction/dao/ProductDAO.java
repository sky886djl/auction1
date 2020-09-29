package com.auction.dao;

import java.util.List;
import java.util.Map;

import com.auction.entity.Product;

public interface ProductDAO {
	/**
	 * 获取所有商品
	 * @return
	 */
	public List<Product> getAllProducts();
	/**
	 * 委托者 获取所有商品
	 * @return
	 */
	public List<Product> getAllProductsBySellerId(int seller_id);
	/**
	 * 通过产品类型id获取所有商品
	 * @return
	 */
	public List<Product> getProductsByTypeId(int type_id);
	
	/**
	 * 通过产品类型id获取所有商品
	 * @return
	 */
	public List<Product> getProductsByTypeIds(int[] type_ids);
	/**
	 *	通过id查询
	 * @param id
	 * @return
	 */
	public Product getProductById(int id);
	
	/**
	 * 通过ids查询
	 * @param ids
	 * @return
	 */
	public List<Product> getProductByIds(int[]ids);
	
	/**
	 * 获取所有商品
	 * type=1-今日拍卖
	 * 否则非今日拍卖
	 * @return
	 */
	public List<Product> findAllProducts(Integer type);

	
	
	/**
	 * 下架
	 * @param id
	 * @return
	 */
	public int downShelf(int id);
	
	//更新图片
	public int changePic(Product product);
	
	/**
	 * 发布
	 * @param id
	 * @return
	 */
	public int release(int id);
	/**
	 *  type null不限  1-8
	 *  * state null-不限 0-结束 1-正在进行 2-即将开始 
	 *  * timeArea null不限 3-三天后 7-七天后 30-最近30天  ----timeArea=null时才能考虑----> startTime endTime   两者不为null时可用 时间类型
	 *  * pricelow pricehigh 两者不为null时可用 double
		price(1 0)  bidNum(1 0)  null不限 1 升序 0降序
	 */
	public List<Product> findProductsBySort(Map<String,Object> hashmap);
	/**
	 * 真删除
	 * @param id
	 * @return
	 */
	public int deleteTrue(int id);
	
	/**
	 * 假删除
	 * @param id
	 * @return
	 */
	public int deleteFalse(int id);
	
	/**
	 * 查询所有已删除数据
	 * @return
	 */
	public List<Product> getAllDelProducts();
	
	/**
	 * 真删除
	 * @param ids
	 * @return
	 */
	public int deleteAllTrue(int[] ids);
	
	/**
	 * 假删除
	 * @param ids
	 * @return
	 */
	public int deleteAllFalse(int[] ids);
	
	/**
	 * 批量还原
	 * @param ids
	 * @return
	 */
	public int backsAll(int[]ids);
	
	/**
	 * 增加商品
	 */
	public int add(Product product);
	
	/**
	 * 
	 * @param integer=1为今日总点击量 =null为即将开始总点击量
	 * @return
	 */
	public Integer getTotalClick(Integer integer);
	
	/**
	 * 统计产品数量
	 * @param integer
	 * @return
	 */
	public Integer getProTotalNum(Integer integer);
	
	/**
	 * 通过买家id获取所有商品
	 * @return
	 */
	List<Product> findProductsByBuyerId(int buyer_id);
	
	/**
	 * 通过卖家id获取所有商品
	 * @return
	 */
	List<Product> findProductsBySellerId(int seller_id);
	
	
	/**
	 * 通过拍卖日期精确筛选商品
	 * @return
	 */
	List<Product> findProductsByDate(Map<String,Integer> hashmap);
	
	
	
	/**
	 * 更新当前价格 
	 * @param product_id
	 * @param increase
	 * @param buyer_id
	 * @return
	 */
	int updateNowPrice(Map<String,Object> hashmap);
	
	/**
	 * 商品下架
	 */
	int forbideen(int id);
	
	/**
	 * 更新增长时间(单位min)
	 */
	int updateGrowTime(int minute);
	
	/**
	 * 点击数++
	 */
	int addClickNum(int id);
	
	/**
	 * 参与数++
	 */
	int addJoin_num(int id);
	
	/**
	 * 更新截止时间(+5分钟)
	 * @return
	 */
	int updateDeadline(int id);
	
	/**
	 * 删除商品
	 */
	int deleteProduct(int id);

	/**
	 * 根据竞买者编号查询
	 * @param map
	 * @return
	 */
	public List<Product> getProductsByBidderId(Map<String, Object> map);

	
	/**
	 * 通过产品竞买者id、查询的内容获取所有商品
	 * @return
	 */
	public List<Product> getProductsByStr(Map<String, Object> map);

	/**
	 * 通过关键字查询拍卖品
	 * @return
	 */
	public List<Product> getProductsByKeyword(String keyword);
	

	/**
	 * 修改拍卖品信息
	 * @param product
	 * @return
	 */
	public int updateProduct(Product product);

	/**
	 * 拍卖结束后 已经处理
	 * @param id
	 * @return
	 */
	public int finish(int id);
	
	/**
	 * 余款设置为已支付
	 * @param id
	 * @return
	 */
	public int payed(int id);
	

}
