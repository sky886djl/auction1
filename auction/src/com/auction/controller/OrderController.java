package com.auction.controller;

import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.auction.entity.Order1;
import com.auction.entity.User;
import com.auction.service.IOrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private IOrderService orderService;
	
	/**
	 * 竞买者查询订单
	 * @param type -0-全部  -1-待发货 -2-待收货 -3-订单完成
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/myorderList/{type}", method = {RequestMethod.GET})
	public ModelAndView myorderList(@PathVariable("type")int type, HttpSession session) {
		User user = (User) session.getAttribute("bidder");
		ModelAndView mv = new ModelAndView();
		if(user==null) {
			mv.setViewName("redirect:/index.jsp");
			return mv;
		} 
		List<Order1> orders=orderService.getAllOrdersByBuyer(user.getId(), type);
		mv.addObject("orders", orders);
		mv.setViewName("/bidder/myorder");
		return mv;
	}
	
	/**
	 * 委托者查询订单
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)  
	@ResponseBody  
	public Map<String, Object> list(HttpSession session ) throws Exception { 
		User seller= (User) session.getAttribute("seller");
		if(seller==null) {
			return null;
		}
	    List<Order1> list = orderService.getAllOrdersBySeller(seller.getId());  
	    Map<String, Object> map2Json = new HashMap<String, Object>();  
	    map2Json.put("aaData", list);
	    return map2Json;  
	} 
	
	/**
	 * 发货
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fahuo", method = RequestMethod.POST)
	@ResponseBody
	public boolean fahuo(@RequestParam("id") String id) throws Exception {
		return orderService.fahuo(id) == 1;
	}
	
	
	/**
	 * 删除
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public boolean delete(@RequestParam("id") String id) throws Exception {
		return orderService.delOrder(id) == 1;
	}
	
	/**
	 * 批量删除
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deletes", method = RequestMethod.POST)
	@ResponseBody
	public boolean delete(@RequestParam("ids") String[] ids) throws Exception {
		return orderService.delOrders(ids)==ids.length;
	}
	/**
	 * 收货
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/receive", method = RequestMethod.POST)
	@ResponseBody
	public boolean receive(@RequestParam("id") String id) throws Exception {
		return orderService.receive(id) == 1;
	}

}
