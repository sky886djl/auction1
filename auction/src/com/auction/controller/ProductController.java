package com.auction.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.auction.entity.Article;
import com.auction.entity.Bidding;
import com.auction.entity.Message;
import com.auction.entity.Order1;
import com.auction.entity.Product;
import com.auction.entity.Recommend;
import com.auction.entity.Subscribe;
import com.auction.entity.Type;
import com.auction.entity.User;
import com.auction.service.IArticleService;
import com.auction.service.IBiddingService;
import com.auction.service.ICommentService;
import com.auction.service.IMessageService;
import com.auction.service.IOrderService;
import com.auction.service.IProductService;
import com.auction.service.IRecommendService;
import com.auction.service.ISubscribeService;
import com.auction.service.IUserService;
import com.auction.util.FileUpload;
import com.auction.util.MyDateFormat;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private IProductService productService;
	@Autowired
	private IBiddingService biddingService;
	@Autowired
	private IArticleService articleService;
	@Autowired
	private IUserService userService;
	@Autowired
	private ISubscribeService subscribeService;// 订阅信息
	@Autowired
	private IRecommendService recommendService;// 推荐信息
	@Autowired
	private ICommentService commentService;// 评论信息
	@Autowired
	private IMessageService messageService;// 评论信息
	@Autowired
	private IOrderService orderService;// 订单信息

	/**
	 * 产品列表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list1", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> list1() throws Exception {
		List<Product> list = productService.getAllProducts();
		Map<String, Object> map2Json = new HashMap<String, Object>();
		map2Json.put("aaData", list);
		return map2Json;
	}

	/**
	 * 某类型的产品列表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getProductsByType", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getProductsByType(@RequestParam("type_id") int type_id) throws Exception {
		List<Product> list = productService.getProductsByTypeId(type_id);
		Map<String, Object> map2Json = new HashMap<String, Object>();
		map2Json.put("aaData", list);
		return map2Json;
	}

	/**
	 * 根据id
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getProductById", method = RequestMethod.GET)
	@ResponseBody
	public Product getProductById(@RequestParam("id") int id) throws Exception {
		return productService.getProductById(id);
	}

	/**
	 * 委托者-产品列表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list2", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> list2(HttpSession session) throws Exception {
		User seller = (User) session.getAttribute("seller");
		if (seller == null) {
			return null;
		}
		List<Product> list = productService.getAllProducts();
		Map<String, Object> map2Json = new HashMap<String, Object>();
		map2Json.put("aaData", list);
		return map2Json;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("index");
		List<Product> todayList = productService.findAllProducts(true);
		List<Product> futureList = productService.findAllProducts(false);
		List<Article> announcementList = articleService.findAllAricles("announcement", 8);
		List<Article> newsList = articleService.findAllAricles("news", 4);
		mv.addObject("announcementList", announcementList);
		mv.addObject("newsList", newsList);
		// 1.产品列表
		if (todayList == null) {
			todayList = new ArrayList<>();
		}
		if (futureList == null) {
			futureList = new ArrayList<>();
		}
		mv.addObject("todayList", todayList);
		mv.addObject("futureList", futureList);

		// 2.统计拍卖商品的总点击数
		int todayClick = productService.getTotalClick(true);
		int futureClick = productService.getTotalClick(false);
		;
		mv.addObject("todayClick", todayClick);
		mv.addObject("futureClick", futureClick);

		// 3.统计拍卖商品的总数量
		int proTodayNum = productService.getProTotalNum(true);
		int proFutureNum = productService.getProTotalNum(false);
		;
		mv.addObject("proTodayNum", proTodayNum);
		mv.addObject("proFutureNum", proFutureNum);

		return mv;
	}

	// 个人中心-根据拍卖品名称、描述、类型模糊查询
	@RequestMapping(value = "/find/{str}")
	public ModelAndView find(@PathVariable("str") String str, HttpSession session) {
		ModelAndView mv = new ModelAndView("/bidder/mybidding");
		User user = (User) session.getAttribute("bidder");
		if (user == null) {
			mv.setViewName("index");
			return mv;
		}
		mv.addObject("str", str);
		List<Product> products = productService.getProductsByStr(user.getId(), str);
		if (products == null || products.size() == 0) {
			mv.addObject("tag", "Empty");
		}
		mv.addObject("mybid", products);
		// 出价情况
		Map<String, List<Bidding>> biddings = new HashMap<>();
		int pro_id, len = products.size();
		for (int i = 0; i < len; i++) {
			pro_id = products.get(i).getId();
			biddings.put("id_" + pro_id, biddingService.getBiddingsByProId(pro_id));
		}
		mv.addObject("biddings", biddings);
		return mv;
	}

	@RequestMapping(value = "/search/{keyword}")
	public ModelAndView search(@PathVariable("keyword") String keyword) {
		if (keyword == null || keyword.length() == 0) {
			return sort(0, 0, 0, 0, "0", 0, "0");
		}
		ModelAndView mv = new ModelAndView("sortSearch");
		List<Product> products = productService.getProductsByKeyword(keyword);
		mv.addObject("sortProducts", products);
		mv.addObject("keyword", keyword);
		return mv;
	}

	/**
	 * 前台页面根据拍卖品名称、类型和描述模糊查询
	 * 
	 * @param type
	 * @param session
	 * @return
	 */

	@RequestMapping(value = "/mybid/{type}", method = RequestMethod.GET)
	public ModelAndView mybid(@PathVariable("type") String type, HttpSession session) {
		ModelAndView mv = new ModelAndView("/bidder/mybidding");
		User user = (User) session.getAttribute("bidder");
		if (user == null) {
			mv.setViewName("index");
			return mv;
		}
		mv.addObject("type", type);
		List<Product> products = productService.getProductsByBidderId(user.getId(),
				Integer.parseInt(type.split("type")[1]));
		if (products == null || products.size() == 0) {
			mv.addObject("tag", "Empty");
		}
		mv.addObject("mybid", products);

		// 出价情况
		Map<String, List<Bidding>> biddings = new HashMap<>();
		int pro_id, len = products.size();
		for (int i = 0; i < len; i++) {
			pro_id = products.get(i).getId();
			biddings.put("id_" + pro_id, biddingService.getBiddingsByProId(pro_id));
		}
		mv.addObject("biddings", biddings);
		return mv;
	}

	// /**
	// * 删除拍卖品记录
	// * @param str
	// * @param session
	// * @return
	// */
	// @RequestMapping(value = "/deleteBidding/{str}")
	// public ModelAndView find(@PathVariable("str") String str, HttpSession
	// session) {
	// ModelAndView mv = new ModelAndView("/bidder/mybidding");
	// User user=(User)session.getAttribute("bidder");
	// if(user==null) {
	// mv.setViewName("index");
	// return mv;
	// }
	// mv.addObject("str",str);
	// List<Product> products = productService.getProductsByStr(user.getId(), str);
	// if(products==null||products.size()==0) {
	// mv.addObject("tag","Empty");
	// }
	// mv.addObject("mybid",products);
	// //出价情况
	// Map<String,List<Bidding>> biddings = new HashMap<>();
	// int pro_id,len=products.size();
	// for(int i=0;i<len;i++) {
	// pro_id=products.get(i).getId();
	// biddings.put("id_"+pro_id, biddingService.getBiddingsByProId(pro_id));
	// }
	// mv.addObject("biddings",biddings);
	//
	// return mv;
	// }

	/**
	 * 后台-产品列表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> delList() throws Exception {
		List<Product> list = productService.getAllDelProducts();
		Map<String, Object> map2Json = new HashMap<String, Object>();
		map2Json.put("aaData", list);
		return map2Json;
	}

	/**
	 * 下架
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/downShelf", method = RequestMethod.POST)
	@ResponseBody
	public boolean downShelf(@RequestParam("id") int id) throws Exception {
		return productService.downShelf(id) == 1;
	}

	/**
	 * 发布
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/release", method = RequestMethod.POST)
	@ResponseBody
	public boolean release(@RequestParam("id") int id) throws Exception {
		return productService.release(id) == 1;
	}

	/**
	 * 删除 flag=true真删除 flag=false假删除
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public boolean delete(@RequestParam("id") int id, @RequestParam("flag") boolean flag) throws Exception {
		return productService.delete(id, flag) == 1;
	}

	/**
	 * 批量删除 flag=true真删除 flag=false假删除
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deletes", method = RequestMethod.POST)
	@ResponseBody
	public boolean deletes(@RequestParam("ids") int[] ids, @RequestParam("flag") boolean flag) throws Exception {
		return productService.deleteAll(ids, flag) == ids.length;
	}

	/**
	 * 批量还原
	 * 
	 * @param ids
	 * @param type
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/backs", method = RequestMethod.POST)
	@ResponseBody
	public boolean backs(@RequestParam("ids") int[] ids) throws Exception {
		return productService.backsAll(ids) == ids.length;
	}

	/**
	 * 类型删除时核对 若该类型下尚有产品，则返回false-拒绝删除
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/typeDeleteCheck", method = RequestMethod.POST)
	@ResponseBody
	public boolean typeDeleteCheck(@RequestParam("type_id") int type_id) throws Exception {
		@SuppressWarnings("unchecked")
		List<Product> list = (List<Product>) getProductsByType(type_id).get("aaData");
		return list == null || list.size() == 0;
	}

	/**
	 * 委托者修改拍卖品页面-- 删除图片
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delPic", method = RequestMethod.POST)
	@ResponseBody
	public boolean delPic(@RequestParam("delPic") String delPic, @RequestParam("id") int id) throws Exception {
		// 删除图片本身
		File folder = new File("D:\\workplace\\myeclipseworkplace\\auction\\WebContent\\statics\\images\\product");
		File[] files = folder.listFiles();
		for (File file : files) {
			if (file.getName().equals(delPic)) {
				file.delete();
				break;
			}
		}
		Product product = productService.getProductById(id);
		String[] pics = product.getPic_url().split(delPic + ";");
		String pic_url = "";
		for (String s : pics) {
			pic_url += s;
		}
		System.out.println(pic_url);
		return productService.delPic(id, pic_url) == 1;
	}
	

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public boolean add(@RequestParam Map<String, String> map, @RequestParam("pics") MultipartFile[] files,HttpSession session)
			throws Exception {
		User seller = (User)session.getAttribute("seller") ;
		if(seller==null) {
			return false;
		}
		Product product = new Product();
		product.setName(map.get("proName"));
		product.setType_id(new Type(Integer.parseInt(map.get("category"))));
		product.setInitialPrice(map.get("initialPrice"));
		product.setNowPrice(map.get("initialPrice"));
		product.setStart_time(MyDateFormat.parse(map.get("startDate")));
		product.setDeadline(MyDateFormat.parse(map.get("endDate")));
		product.setDescription(map.get("description"));
		product.setSeller_id(seller);// 普通卖家

		String pic_url = FileUpload.uploadFile(files,
				"D:/workplace/myeclipseworkplace/auction/WebContent/statics/images/product/");
		product.setPic_url(pic_url);
		return productService.add(product) == 1;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public boolean update(@RequestParam Map<String, String> map,@RequestParam("pics") MultipartFile[] files,HttpSession session) throws Exception {
		User seller = (User) session.getAttribute("seller");
		if (seller == null) {
			return false;
		}
		Product product = new Product();
		product.setId(Integer.parseInt(map.get("proId")));
		product.setName(map.get("proName"));
		product.setType_id(new Type(Integer.parseInt(map.get("category"))));
		product.setStart_time(MyDateFormat.parse(map.get("startDate")));
		product.setDeadline(MyDateFormat.parse(map.get("endDate")));
		product.setDescription(map.get("description"));
		String pic_url = FileUpload.uploadFile(files,
				"D:/workplace/myeclipseworkplace/auction/WebContent/statics/images/product/");
		product.setPic_url(pic_url);
		return productService.update(product) == 1;
	}

	/**
	 * type （默认0-不限） 1-8 state （默认0-不限） 11-正在进行 12-即将开始 2-待审核 3-假删除 4-结束 * timeArea
	 * （默认为0）3-三天后 7-七天后 30-最近30天 price （默认0-不限） 1 升序 2降序 bidNum （默认0-不限） 1 升序 2降序
	 * pricelow_pricehigh （默认0-不限）最低价_最高价 startTime_endTime（默认0-不限） 仅当timeArea=0时有效
	 */
	@RequestMapping("/sort/{type}/{state}/{timeArea}/{price}/{bidNum}/{pricelow_pricehigh}/{startTime_endTime}")
	public ModelAndView sort(@PathVariable("type") int type, @PathVariable("state") int state,
			@PathVariable("bidNum") int bidNum, @PathVariable("timeArea") int timeArea,
			@PathVariable("startTime_endTime") String startTime_endTime, @PathVariable("price") int price,
			@PathVariable("pricelow_pricehigh") String pricelow_pricehigh) {
		ModelAndView mv = new ModelAndView("sortSearch");
		Map<String, Object> map = new HashMap<>();
		mv.addObject("type", type);
		mv.addObject("state", state);
		mv.addObject("price", price);
		mv.addObject("timeArea", timeArea);
		mv.addObject("bidNum", bidNum);
		mv.addObject("pricelow_pricehigh", pricelow_pricehigh);
		mv.addObject("startTime_endTime", startTime_endTime);
		if (type != 0) {
			map.put("type", type);
		}
		if (state != 0) {
			map.put("state", state);
		}
		if (bidNum != 0) {
			map.put("bidNum", bidNum);
		}

		if (price != 0) {
			map.put("price", price);
		}

		if (pricelow_pricehigh != null && pricelow_pricehigh.contains("_")) {
			String[] pri = pricelow_pricehigh.split("_");
			map.put("pricelow", pri[0]);
			map.put("pricehigh", pri[1]);
		}

		if (startTime_endTime != null && startTime_endTime.contains("_")) {
			String[] start_end = startTime_endTime.split("_");
			map.put("startTime", start_end[0]);
			map.put("endTime", start_end[1]);
		} else if (timeArea != 0) {
			map.put("timeArea", timeArea);
		}
		mv.addObject("sortProducts", productService.findProductsBySort(map));
		return mv;
	}

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	@ResponseBody
	public Product show(@RequestParam("id") int id) throws Exception {
		return productService.getProductById(id);
	}

	@RequestMapping(value = "getOne/{id}")
	public ModelAndView getOne(@PathVariable("id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView("product_view");
		Product pro = productService.getProductById(id);// 获取单个商品信息
		if (pro == null) {
			mv.setViewName("redirect:/product/list");
			return mv;
		}
		// 增加点击数
		productService.addClickNum(id);
		mv.addObject("product", pro);

		// 获取竞买记录
		List<Bidding> recordBiddings = biddingService.getAllBiddingByProNoLimit(id);
		mv.addObject("recordBiddings", recordBiddings);
		if (recordBiddings != null && recordBiddings.size() > 0)
			mv.addObject("buyer_id", recordBiddings.get(0).getBuyer_id().getUsername());

		// 该拍卖品的评论信息
		mv.addObject("comments", commentService.getCommentsByProId(id));

		// 将物品与当前用户对比 判断用户与商品的关系
		User user = (User) session.getAttribute("bidder");
		if (pro.getStatus() == 4)// 结束了
			biddingOver(id);
		if (user == null) {
			mv.addObject("guessYouLike", guessYouLike(0, false));
			return mv;
		}
		mv.addObject("guessYouLike", guessYouLike(user.getId(), true));

		// 获取该用户对当前拍卖品的提醒信息
		Subscribe subscribe = subscribeService.getSubscribe(user.getId(), id);
		mv.addObject("subscribe", subscribe);

		Recommend recommend = new Recommend(user.getId(), pro.getType_id().getId());
		// 为用户增加喜好推荐
		if (recommendService.getRecommend(recommend) == null)// 先查找，再插入，避免出现冗余数据
			recommendService.addRecommend(recommend);

		Bidding bid = biddingService.getMaxPriceBidding(id);
		if (bid != null && bid.getBuyer_id().getId() == user.getId()) {
			mv.addObject("bidding", "prior");// 处于领先 最高出价
		} else if (hasAlreadyDeposit(user.getId(), id)) {
			mv.addObject("deposit", "yes");// 已经交保证金标识
		}
		return mv;
	}

	/**
	 * 
	 * @param pid
	 *            商品id
	 * @return
	 */
	@RequestMapping(value = "/deposit/{pid}")
	public ModelAndView deposit(@PathVariable("pid") int pid, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 判断用户是否登录
		User user = (User) session.getAttribute("bidder");
		if (user == null) {
			mv.setViewName(getOneURL(pid));
			return mv;
		}
		Product product = productService.getProductById(pid);

		mv.addObject("product", product);
		// 判断是否已经支付
		if (hasAlreadyDeposit(user.getId(), product.getId())) {// 已经支付保证金
			mv.setViewName(getOneURL(pid));
		} else {// 没有支付保证金 进入保证金确认页面
			mv.setViewName("depositConfirm");
		}

		return mv;
	}

	/**
	 * 从确认支付保证金页面提交过来
	 * 
	 * @param pid
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/depositConfirm/{pid}")
	public ModelAndView depositConfirm(@PathVariable("pid") int pid, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 判断用户是否登录
		User user = (User) session.getAttribute("bidder");
		if (user == null) {
			mv.setViewName(getOneURL(pid));
			return mv;
		}
		Product product = productService.getProductById(pid);
		mv.addObject("id", pid);
		double pro_deposit = Double.parseDouble(product.getInitialPrice()) * 0.2;// 保证金价格
		// 判断用户账户余额>=保证金
		if (user.getAccount() >= pro_deposit) {
			Bidding bidding = new Bidding(product.getId(), user.getId(), pro_deposit, 2);
			// deposit表新增一条记录
			if (biddingService.addBidding(bidding) == 1) {
				// 用户账户--保证金
				userService.subAccount(user.getId(),Double.parseDouble(product.getInitialPrice()) * 0.2);// 用户资金减少

				// 商品join_num 参与人数++
				productService.addJoin_num(pid);
				product.setJoin_num(product.getJoin_num() + 1);
				// 支付成功
				mv.addObject("message", "success");
			} else {
				mv.addObject("message", "sqlFailre");
			}
		} else {
			// 余额不足
			mv.addObject("message", "failure");
		}
		mv.setViewName("depositPayResult");
		return mv;
	}

	/**
	 * 出价竞拍
	 * 
	 * @param pid
	 * @param bidprice
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/bidding/{pid}/{bidPrice}")
	public synchronized ModelAndView bidding(@PathVariable("pid") int pid, @PathVariable("bidPrice") double bidPrice,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("bidder");
		if (user == null) {
			mv.setViewName(getOneURL(pid));
			return mv;
		}
		Product product = productService.getProductById(pid);
		if (hasAlreadyDeposit(user.getId(), pid)) {// 已经具备竞拍资格 并且还没有人出这个价格！！
			mv.addObject("bidPrice", bidPrice);
			mv.addObject("product", product);
			mv.addObject("pid", pid);
			mv.setViewName("biddingResult");
			// 更新当前最高出价用户

			Bidding condition = new Bidding(pid, user.getId(), bidPrice, 1);
			Map<String, Object> map = new HashMap<>();
			map.put("product_id", pid);
			map.put("bidPrice", bidPrice);
			map.put("buyer_id", user.getId());
			// bidding表新增一条记录 更新商品的当前价
			if (biddingService.addBidding(condition) == 1 && productService.updateNowPrice(map) == 1) {
				mv.addObject("bidding", "biddingsuccess");
			} else {
				mv.addObject("bidding", "biddingfailure");
			}
		} else {// 未交保证金
			mv.setViewName("deposit/" + pid);
		}
		return mv;
	}

	/**
	 * 出价竞拍
	 * @param pid
	 * @param bidprice
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/bidding1/{pid}/{bidPrice}/{type}")
	public synchronized String bidding1(@PathVariable("pid") int pid, @PathVariable("bidPrice") double bidPrice,
			@PathVariable String type, HttpSession session) {
		ModelAndView mv = bidding(pid, bidPrice, session);
		if (mv.getViewName().equals("deposit/" + pid)) {
			mv.addObject("depositErr", "err");
		}
		return "mybid/" + type;
	}

	public String getOneURL(int pid) {
		return "redirect:/product/getOne/" + pid;
	}

	/**
	 * @param buyer_id
	 * @param pro_id
	 *            bidStatus=2 保证金
	 * @return
	 */
	private boolean hasAlreadyDeposit(int buyer_id, int pro_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("buyer_id", buyer_id);
		map.put("pro_id", pro_id);
		map.put("status", 2);
		if (biddingService.getAllBidding(map).size() > 0)
			return true;
		else
			return false;
	}

	@RequestMapping(value = "/subscribeList", method = RequestMethod.GET)
	public ModelAndView list(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/bidder/mysubscribe");
		User user = (User) session.getAttribute("bidder");
		if (user == null) {
			mv.setViewName("index");
			return mv;
		}
		List<Subscribe> subscribes = subscribeService.getAllSubscribesByUserId(user.getId());
		int len = subscribes.size();
		if (len > 0) {
			int[] ids = new int[len];
			for (int i = 0; i < len; i++) {
				ids[i] = subscribes.get(i).getPro_id();
			}

			mv.addObject("products", productService.getProductByIds(ids));
		} else {
			mv.addObject("Empty", "true");
		}
		return mv;
	}

	@RequestMapping(value = "/cancelSubscribe", method = RequestMethod.POST)
	@ResponseBody
	public boolean cancelSubscribe(HttpSession session, @RequestParam("pro_id") int pro_id) throws Exception {
		User user = (User) session.getAttribute("bidder");
		if (user == null) {
			return false;
		}
		return subscribeService.cancelSubscribe(user.getId(), pro_id) > 0;
	}

	@RequestMapping(value = "/setSubscribe", method = RequestMethod.POST)
	@ResponseBody
	public boolean setSubscribe(HttpSession session, @RequestParam("pro_id") int pro_id) throws Exception {
		User user = (User) session.getAttribute("bidder");
		if (user == null) {
			return false;
		}
		Product product = productService.getProductById(pro_id);
		if (subscribeService.getSubscribe(user.getId(), pro_id) == null)
			return subscribeService.addSubscribe(user.getId(), pro_id, product.getStatus()) == 1;
		else
			return false;
	}

	@RequestMapping(value = "/guessmylike", method = RequestMethod.GET)
	public ModelAndView guessmylike(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/bidder/guessmylike");
		User user = (User) session.getAttribute("bidder");
		if (user == null) {
			return mv;
		}
		mv.addObject("guessmylike", guessYouLike(user.getId(), true));
		return mv;
	}

	private List<Product> guessYouLike(int user_id, boolean isUser) {
		List<Product> products = null;
		if (isUser) {
			List<Recommend> list = recommendService.getRecommendsByUserId(user_id);
			int len = list.size();
			boolean empty = false;
			if (len > 0) {
				int[] ids = new int[len];
				for (int i = 0; i < len; i++) {
					ids[i] = list.get(i).getType_id();
				}
				List<Product> guessmylike = productService.getProductsByTypeIds(ids);
				if (guessmylike == null || guessmylike.size() == 0) {
					empty = true;
				} else {
					products = productService.getProductsByTypeIds(ids);
				}
			} else {
				empty = true;
			}

			if (empty) {
				products = productService.findAllProducts(true);
			}
		} else {
			products = productService.findAllProducts(true);
		}
		return products;
	}

	@RequestMapping(value = "/subscribeJudge", method = RequestMethod.POST)
	@ResponseBody
	public boolean subscribeJudge(HttpSession session) throws Exception {
		User user = (User) session.getAttribute("bidder");
		if (user == null) {
			return false;
		}

		// 该用户设置的提醒
		List<Subscribe> subscribes = subscribeService.getAllSubscribesByUserId2(user.getId());
		Product product = null;
		Message message = null;
		String content = null;
		boolean flag = false;
		for (Subscribe subscribe : subscribes) {
			product = subscribe.getProduct();
			formatStatus(product);
			flag = false;
			if (subscribe.getPro_status() != product.getStatus()) {// 状态不相等，说明拍卖品状态发生改变，应该提醒
				message = new Message();
				message.setMsgType(1);// 1表示提醒消息
				message.setOrigin_user_id(new User(user.getId()));
				message.setPro_id(product);
				// 1.判断是何种情况
				if (subscribe.getPro_status() == 12) {// 即将开始时设置提醒
					if (product.getStatus() == 11) {// 开始后马上提醒
						System.out.println("设置提醒‘即将开始’，当前正在进行");
						content = "尊敬的" + user.getName() + ",你设置提醒的拍卖品'" + product.getName() + "'正在火热进行中，赶快来参与竞拍吧~";
						flag = true;
					} else if (product.getStatus() == 4) {// 结束也要提醒
						System.out.println("设置提醒‘即将开始’，当前已结束");
						content = "尊敬的" + user.getName() + ",你设置提醒的拍卖品'" + product.getName() + "'已经结束，快来看看吧~";
						flag = true;
					}
				} else if (subscribe.getPro_status() == 11 && product.getStatus() == 4) {// 开始时设置提醒,结束时提醒
					System.out.println("设置提醒‘正在进行’，当前已结束");
					content = "尊敬的" + user.getName() + ",你设置提醒的拍卖品'" + product.getName() + "'已经结束，快来看看吧~";
					flag = true;
				}
				if (flag) {
					message.setContent(content);
					if (content != null && content.length() > 0 && messageService.getMessageByMessage(message) == 0) {// 若消息不存在，则新增提醒消息
						System.out.println("add message");
						messageService.addMessage(message);
						// 2.更新提醒的状态
						subscribeService.updateStatus(product.getStatus(), subscribe.getId());
					}
				}
			}
		}
		// 该用户参与的拍卖 ???
		List<Bidding> list = biddingService.getBiddingsByBuyerId1(user.getId());
		if (list.size() > 0) {
			Bidding bidding = null;
			Map<Integer, Bidding> biddingMap = format(list);// key为pro_id
			Iterator<Integer> iterator = biddingMap.keySet().iterator();
			int pro_id = 0;
			while (iterator.hasNext()) {
				pro_id = iterator.next();
				bidding = biddingMap.get(pro_id);
				product = bidding.getPro_id();
				message = new Message();
				message.setMsgType(3);
				message.setOrigin_user_id(user);
				message.setPro_id(product);
				System.out.println("proID:"+product.getId()+",product:"+product.getName()+",proStatus:"+product.getStatus());
				System.out.println("bidID:"+bidding.getId()+",bidding:"+bidding.getStatus());
				if (product.getStatus() == 11) {// 正在进行
					if (bidding.getStatus() == 2) {// 仅交了保证金，生成消息
						content = "尊敬的" + user.getName() + ",你参与报名的'" + product.getName() + "'正在火热进行中，赶快来参与竞拍吧~";
					}
				} else if (product.getStatus() == 4) {// 已结束，生成消息
					biddingOver(pro_id);
					if (bidding.getStatus() == 20||bidding.getStatus()==11) {// 保证金 - 拍卖结束， 竞拍失败 保证金退还
						content = "尊敬的" + user.getName() + "，你参与的竞拍'" + product.getName()
								+ "'已经结束，很遗憾，竞拍失败！，保证金将在3个工作日内退还！";
					} else if (bidding.getStatus() == 21||bidding.getStatus()==10) {// 保证金 - 竞拍成功
							content = "尊敬的" + user.getName() + "，恭喜你，你参与的竞拍'" + product.getName()
									+ "'已经结束，幸运的你是最终的获胜者，请在3日内交付余款完成拍卖交易，否则，你的保证金不会退还噢！";
					} 
				}
				System.out.println("我的拍卖消息："+content);
				// 新增消息
				message.setContent(content);
				if (content != null && content.length() > 0 && messageService.getMessageByMessage(message) == 0) {
					System.out.println("add message:" + message);
					messageService.addMessage(message);
				}
				content = null;
			}
		}
		int count = messageService.getMessagesByUserIdSimple(user.getId());
		if (count > 0)
			session.setAttribute("unReadMessagesNum", count);
		else
			session.removeAttribute("unReadMessagesNum");
		return true;
	}

	// 某个拍卖品结束
	private boolean biddingOver(int pro_id) {
		Product product = productService.getProductById(pro_id);
		// 未处理
		if (product.getIsFinished() != 1) {
			List<Bidding> biddings = biddingService.getNewBiddingsByProId(pro_id);
			Bidding maxBidding = biddingService.getMaxPriceBidding(pro_id);
			if (maxBidding == null) {// 无人出价
				// 无条件返回保证金
				for (Bidding b : biddings) {
					userService.addAccount(b.getBuyer_id().getId(), b.getMoney());// 退还保证金
					biddingService.updateStatus(b.getId(), 20);// 更新状态
				}
			} else {
				Integer status;
				int successUserId = maxBidding.getBuyer_id().getId();
				double maxPrice = maxBidding.getMoney();
				for (Bidding b : biddings) {
					if (b.getStatus() == 1) {// 出价处理
						if (maxPrice == b.getMoney()) {// 出价最高
							status=new Integer(10);// 竞拍成功
						} else {
							status = new Integer(11);// 竞拍失败
						}
					} else {// 保证金处理
						if (successUserId == b.getBuyer_id().getId()) {
							status = new Integer(21);// 成功竞拍 ，保证金抵押部分出价金额
						} else {
							status = new Integer(20);// 保证金退还
							userService.addAccount(b.getBuyer_id().getId(), b.getMoney());// 退还保证金
						}
					}
					biddingService.updateStatus(b.getId(), status);// 更新状态
				}
			}
			productService.finish(pro_id);// 设置已经处理
			return true;
		}
		return false;
	}

	private Map<Integer, Bidding> format(List<Bidding> biddings) {
		if (biddings == null || biddings.size() == 0)
			return null;
		Product product = null;
		Map<Integer, Bidding> map = new HashMap<>();
		for (Bidding bidding : biddings) {
			product = bidding.getPro_id();
			formatStatus(product);
			if (!map.containsKey(product.getId())) {
				map.put(product.getId(), bidding);
			} else if (bidding.getMoney() > map.get(product.getId()).getMoney()) {
				map.put(product.getId(), bidding);
			}
		}
		return map;
	}

	private void formatStatus(Product product) {
		if (product == null)
			return;
		long now = new Date().getTime();
		if (now > product.getDeadline().getTime()) {
			product.setStatus(4);// 已结束
		} else if (product.getStart_time().getTime() > now) {
			product.setStatus(12);// 即将开始
		} else {
			product.setStatus(11);// 已开始
		}
	}

	/**
	 * 请求支付余款页面 - 确认支付余款
	 * @param pid
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/payBill0/{pid}")
	public ModelAndView payBill0(@PathVariable("pid") int pid, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 判断用户是否登录
		User user = (User) session.getAttribute("bidder");
		if (user == null) {
			mv.setViewName(getOneURL(pid));
			return mv;
		}
		Product product = productService.getProductById(pid);
		mv.addObject("product", product);
		mv.setViewName("/bidder/billPayConfirm");
		return mv;
	}
	
	/**
	 * 支付余款确认 - 确认支付余款
	 * @param pid
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/payBillConfirm/{pid}")
	public ModelAndView payBillConfirm(@PathVariable("pid") int pid, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 判断用户是否登录
		User user = (User) session.getAttribute("bidder");
		if (user == null) {
			mv.setViewName(getOneURL(pid));
			return mv;
		}
		Product product = productService.getProductById(pid);
		if(product==null) {
			mv.setViewName("product/list");
			return mv;
		}
		if(product.getIsPayed()==1) {
			mv.addObject("msg", "alreadyPayed");
			mv.setViewName("/bidder/index");
			return mv;
		}
		//1.判断余额是否充足
		double rest = Double.parseDouble(product.getNowPrice())-Double.parseDouble(product.getInitialPrice())*0.2;
		if(user.getAccount()>0&&user.getAccount()>=rest) {//充足
			//生成待发货订单
			userService.subAccount(user.getId(),rest);//余额减少！
			//卖家余额增加
			userService.addAccount(product.getSeller_id().getId(), rest);
			User seller = userService.getUserById(product.getSeller_id().getId());
			Order1 order1 = new Order1();
			order1.setId(MyDateFormat.format1(new Date())+product.getId()+user.getId());
			order1.setAddress1(seller.getAddress());//发货地址
			order1.setAddress2(user.getAddress());//收货地址
			order1.setBuyer_id(user);
			order1.setPro_id(product);
			orderService.addOrder(order1);
			productService.payed(pid);
			mv.addObject("msg", "success");
			mv.setViewName("/bidder/index");
		} else {//余额不足
			mv.addObject("msg", "failure");
			mv.setViewName("/bidder/billPayConfirm");
		}
		mv.addObject("product", product);
		return mv;
	}

}
