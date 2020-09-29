package com.auction.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.auction.entity.Bidding;
import com.auction.service.IBiddingService;

@Controller
@RequestMapping("/bidding")
public class BiddingController {
	@Autowired
	private IBiddingService biddingService;
	@RequestMapping(value="/add",method=RequestMethod.POST)  
	@ResponseBody
	public boolean add(Bidding bidding) throws Exception { 
		return biddingService.addBidding(bidding)==1;
	}
	/**
	 * 单个删除
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)  
	@ResponseBody
	public boolean delete(@RequestParam("id")int id) throws Exception { 
		return biddingService.deleteBiddingById(id)==1;
	}

	/**
	 * 竞拍记录列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)  
	@ResponseBody  
	public Map<String, Object> list() throws Exception {  
	    List<Bidding> list = biddingService.list();  
	    Map<String, Object> map2Json = new HashMap<String, Object>();  
	    map2Json.put("aaData", list);
	    return map2Json;  
	} 
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deletes",method=RequestMethod.POST)  
	@ResponseBody
	public boolean deletes(@RequestParam("ids")int[] ids) throws Exception { 
		return biddingService.deleteBiddingsByIds(ids)==ids.length;
	} 
}
