package com.auction.service;

import java.util.List;
import java.util.Map;

import com.auction.entity.Product;

public interface IProductService {
	
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
	 * 获取所有商品
	 * @return
	 */
	public List<Product> findAllProducts(boolean isToday);
	
	/**
	 * 查询已删除的产品
	 * @return
	 */
	public List<Product> getAllDelProducts();
	
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
	 * 通过产品竞买者id获取所有商品
	 * @return
	 */
	public List<Product> getProductsByBidderId(int bidder_id,Integer type);
	
	/**
	 * 通过产品竞买者id、查询的内容获取所有拍卖品
	 * @return
	 */
	public List<Product> getProductsByStr(int bidder_id,String str);
	
	/**
	 * 通过关键字查询拍卖品
	 * @return
	 */
	public List<Product> getProductsByKeyword(String keyword);
	
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
	 * 删除
	 * type=true 真删除
	 * type=false 假删除
	 * @param id
	 * @param type
	 * @return
	 */
	public int delete(int id, boolean type);
	
	/**
	 * 下架商品
	 * @param id
	 * @return
	 */
	public int downShelf(int id);

	/**
	 * 发布
	 * @param id
	 * @return
	 */
	public int release(int id);
	
	/**
	 * 批量删除
	 * @param ids
	 * @param type true为真删除
	 * @return
	 */
	public int deleteAll(int[] ids, boolean type);
	
	/**
	 * 删除图片
	 * @param id
	 * @param pic_url
	 * @return
	 */
	public int delPic(int id,String pic_url);
	
	/**
	 * 新增图片
	 * @param id
	 * @param addpic
	 * @return
	 */
	public int addPic(int id,String addpic);
	/**
	 * 批量还原
	 * @param ids
	 * @return
	 */
	public int backsAll(int[] ids);
	
	/**
	 * 增加商品
	 */
	public int add(Product product);
	
	/**
	 * 统计点击量
	 * type=true今日拍卖总点击量
	 * type=false即将开始总点击量
	 */
	public Integer getTotalClick(boolean type);
	

	/**
	 * 统计点击量
	 * type=true今日拍卖总点击量
	 * type=false即将开始总点击量
	 */
	public Integer getProTotalNum(boolean type);
	
	
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
	 *  type null不限  1-8
	 *  * state null-不限 0-结束 1-正在进行 2-即将开始 
	 *  * timeArea null不限 3-三天后 7-七天后 30-最近30天  ----timeArea=null时才能考虑----> startTime endTime   两者不为null时可用 时间类型
	 *  * pricelow pricehigh 两者不为null时可用 double
		price(1 2)  bidNum(1 2)  null不限 1 升序 2降序
	 */
	List<Product> findProductsBySort(Map<String,Object> hashmap);
	
	
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
	 * 修改拍卖品信息
	 * @param product
	 * @return
	 */
	int update(Product product);
	
	/**
	 * 拍卖结束后  已经处理
	 * @param pro_id
	 * @return
	 */
	int finish(int pro_id);
	

	/**
	 * 余款设置为已支付
	 * @param id
	 * @return
	 */
	int payed(int id);

	





	
}
