package com.auction.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.ProductDAO;
import com.auction.entity.Product;
import com.auction.service.IProductService;
import com.auction.util.MoneyFormat;

@Service("productService")
public class ProductServiceImpl implements IProductService {
	@Autowired
	private ProductDAO productDAO;
	private Product format(Product product) {
		if(product==null)
			return null;
		if(product.getStatus()!=0&&product.getStatus()!=2&&product.getStatus()!=3) {
			long now = new Date().getTime();
			if (now > product.getDeadline().getTime()) 
			{product.setStatus(4);//已结束
			} else if (product.getStart_time().getTime() > now) {
				product.setStatus(12);//即将开始
			} else 	{
				product.setStatus(11);//已开始
			}
		}
		product.setInitialPriceformat(MoneyFormat.moneyFormatToWan(product.getInitialPrice()));
		product.setNowPriceformat(MoneyFormat.moneyFormatToWan(product.getNowPrice()));
		return product;
	}
	private List<Product> format(List<Product> products) {
		for (Product product : products) {
			format(product);
		}
		return products;
	}
	@Override
	public List<Product> getAllProducts() {
		return format(productDAO.getAllProducts());
	}
	
	@Override
	public List<Product> getAllProductsBySellerId(int seller_id){
		return format(productDAO.getAllProductsBySellerId(seller_id));
	}
	
	@Override
	public List<Product> getProductsByTypeId(int type_id) {
		return format(productDAO.getProductsByTypeId(type_id));
	}
	
	@Override
	public List<Product> getProductsByTypeIds(int[] type_ids) {
		return format(productDAO.getProductsByTypeIds(type_ids));
	}
	
	@Override
	public Product getProductById(int id) {
		return format(productDAO.getProductById(id));
	}

	@Override
	public List<Product> getProductByIds(int[]ids){
		return format(productDAO.getProductByIds(ids));
	}

	
	@Override
	public List<Product> findAllProducts(boolean isToday) {
		return format(productDAO.findAllProducts(isToday?1:null));
	}

	@Override
	public List<Product> findProductsBySort(Map<String, Object> hashmap) {
		return format(productDAO.findProductsBySort(hashmap));
	}
	
	@Override
	public int downShelf(int id) {
		return productDAO.downShelf(id);
	}
	
	@Override
	public int release(int id) {
		return productDAO.release(id);
	}
	
	@Override
	public int delete(int id, boolean type) {
		if(type) {
			return productDAO.deleteTrue(id);
		} else {
			return productDAO.deleteFalse(id);
		}
	}
	
	@Override
	public List<Product> getAllDelProducts() {
		return productDAO.getAllDelProducts();
	}

	@Override
	public int deleteAll(int[] ids, boolean type) {
		if(type)
			return productDAO.deleteAllTrue(ids);
		else
			return productDAO.deleteAllFalse(ids);
	}
	
	@Override
	public int backsAll(int[] ids) {
		return productDAO.backsAll(ids);
	}
	
	@Override
	public List<Product> findProductsByBuyerId(int buyer_id) {
		return format(productDAO.findProductsByBuyerId(buyer_id));
	}

	@Override
	public List<Product> findProductsBySellerId(int seller_id) {
		return format(productDAO.findProductsBySellerId(seller_id));
	}

	@Override
	public List<Product> findProductsByDate(Map<String, Integer> hashmap) {
		return format(productDAO.findProductsByDate(hashmap));
	}


	/**
	 * 更新当前价格 
	 * @param product_id
	 * @param increase
	 * @param buyer_id
	 * @return
	 */
	@Override
	public int updateNowPrice(Map<String,Object> hashmap) {
		return productDAO.updateNowPrice(hashmap);
	}
	
	@Override
	public int add(Product product) {
		return productDAO.add(product);
	}

	@Override
	public int forbideen(int id) {
		return productDAO.forbideen(id);
	}

	@Override
	public int updateGrowTime(int minute) {
		return productDAO.updateGrowTime(minute);
	}

	@Override
	public int addClickNum(int id) {
		return productDAO.addClickNum(id);
	}

	@Override
	public int addJoin_num(int id) {
		return productDAO.addJoin_num(id);
	}

	@Override
	public int updateDeadline(int id) {
		return productDAO.updateDeadline(id);
	}

	@Override
	public int deleteProduct(int id) {
		return productDAO.deleteProduct(id);
	}

	@Override
	public Integer getTotalClick(boolean type) {
		return productDAO.getTotalClick(type?1:null);
	}
	
	@Override
	public Integer getProTotalNum(boolean type) {
		return productDAO.getProTotalNum(type?1:null);
	}
	

	@Override
	public List<Product> getProductsByBidderId(int bidder_id, Integer type) {
		Map<String, Object> map=new HashMap<>();
		map.put("bidder_id", bidder_id);
		map.put("type", type);
		return format(productDAO.getProductsByBidderId(map));
	}
	@Override
	public List<Product> getProductsByStr(int bidder_id, String str) {
		Map<String, Object> map=new HashMap<>();
		map.put("bidder_id", bidder_id);
		map.put("str", str);
		return format(productDAO.getProductsByStr(map));
	}
	@Override
	public List<Product> getProductsByKeyword(String keyword) {
		return format(productDAO.getProductsByKeyword(keyword));
	}
	@Override
	public int delPic(int id, String pic_url) {
		Product product = productDAO.getProductById(id);
		if(product==null) {
			return 0;
		}
		product.setPic_url(pic_url);
		return productDAO.changePic(product);
	}
	@Override
	public int update(Product product) {
		return productDAO.updateProduct(product);
	}
	@Override
	public int finish(int pro_id) {
		return productDAO.finish(pro_id);
	}
	@Override
	public int payed(int id) {
		return productDAO.payed(id);
	}
	@Override
	public int addPic(int id, String addpic) {
		Product product = productDAO.getProductById(id);
		if(product==null) {
			return 0;
		}
		product.setPic_url(product.getPic_url()+addpic+";");
		return productDAO.changePic(product);
	}



}
