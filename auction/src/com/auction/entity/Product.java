package com.auction.entity;

import java.util.Date;

/**
 * @author djl
 *
 */
public class Product {
	private int id;
	private String name;//商品名
	private String pic_url;//数据库中按分号分开多张图 如1.jpg;2.jpg
	private String nowPrice;//当前价
	private String nowPriceformat;//格式化后的当前价
	private String initialPrice;//初价格
	private String initialPriceformat;//格式化后的初始价
	private Date upLoadDate;//上传时间
	private String description;//商品描述
	private Type type_id;//类型id
	private User seller_id;//卖家id
	private int status;//11-正在进行 12-即将开始 3-假删除 4已结束
	private Date start_time;//开始时间
	private Date deadline;//截止时间
	private int click_num;//点击数
	private int join_num;//参加竞拍人数
	private int isFinished;//1-已结束 0-未结束
	private int isPayed;//1-余款已支付 0-未支付
	public Product() {
	}
	public Product(int id) {
		this.id=id;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPic_url() {
		return pic_url;
	}

	public void setPic_url(String pic_url) {
		this.pic_url = pic_url;
	}

	public String getNowPrice() {
		return nowPrice;
	}

	public void setNowPrice(String nowPrice) {
		this.nowPrice = nowPrice;
	}

	public String getNowPriceformat() {
		return nowPriceformat;
	}

	public void setNowPriceformat(String nowPriceformat) {
		this.nowPriceformat = nowPriceformat;
	}

	public String getInitialPrice() {
		return initialPrice;
	}

	public void setInitialPrice(String initialPrice) {
		this.initialPrice = initialPrice;
	}

	public String getInitialPriceformat() {
		return initialPriceformat;
	}

	public void setInitialPriceformat(String initialPriceformat) {
		this.initialPriceformat = initialPriceformat;
	}

	public Date getUpLoadDate() {
		return upLoadDate;
	}

	public void setUpLoadDate(Date upLoadDate) {
		this.upLoadDate = upLoadDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Type getType_id() {
		return type_id;
	}

	public void setType_id(Type type_id) {
		this.type_id = type_id;
	}

	public User getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(User seller_id) {
		this.seller_id = seller_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public int getClick_num() {
		return click_num;
	}

	public void setClick_num(int click_num) {
		this.click_num = click_num;
	}

	public int getJoin_num() {
		return join_num;
	}

	public void setJoin_num(int join_num) {
		this.join_num = join_num;
	}

	
	public int getIsFinished() {
		return isFinished;
	}
	public void setIsFinished(int isFinished) {
		this.isFinished = isFinished;
	}
	
	public int getIsPayed() {
		return isPayed;
	}
	public void setIsPayed(int isPayed) {
		this.isPayed = isPayed;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", pic_url=" + pic_url + ", nowPrice=" + nowPrice
				+ ", nowPriceformat=" + nowPriceformat + ", initialPrice=" + initialPrice + ", initialPriceformat="
				+ initialPriceformat + ", upLoadDate=" + upLoadDate + ", description=" + description + ", type_id="
				+ type_id + ", seller_id=" + seller_id  + ", status=" + status
				+ ", start_time=" + start_time + ", deadline=" + deadline + ", click_num="
				+ click_num + ", join_num=" + join_num + "]";
	}
	
}