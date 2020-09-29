package com.auction.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.auction.entity.Type;
import com.auction.service.ITypeService;

@Controller
@RequestMapping("/type")
public class TypeController {
	@Autowired 
	private ITypeService typeService;
	
	/**
	 * 类型列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)  
	@ResponseBody  
	public Map<String, Object> list() throws Exception {  
	    List<Type> list = typeService.getAllTypes();
	    Map<String, Object> map2Json = new HashMap<String, Object>();  
	    map2Json.put("aaData", list);
	    return map2Json;  
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
		return typeService.delete(id)==1;
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
		return typeService.deleteAll(ids)==ids.length;
	} 
	
	/**
	 * 类型名唯一性核对
	 * name2=add -新增
	 * name2为原类型名 - 编辑更新
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/nameUnique",method=RequestMethod.POST)  
	@ResponseBody
	public boolean nameUnique(@RequestParam("name")String name,@RequestParam("name2")String name2) throws Exception { 
		Type type=typeService.getTypeByName(name);
		if (name2.equals("add")) {
			return type==null;
		} else {
			return type==null||type.getTypeName().equals(name2);
		}
	} 
	
	/**
	 * 新增
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)  
	@ResponseBody
	public boolean add(@RequestBody Type type) throws Exception { 
		return typeService.add(type)==1;
	} 
	
	/**
	 * 编辑
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit",method=RequestMethod.GET)  
	@ResponseBody
	public Type edit(@RequestParam("id")int id) throws Exception { 
		return typeService.getTypeById(id);
	} 
	
	/**
	 * 更新
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)  
	@ResponseBody
	public boolean update(@RequestBody Type type) throws Exception { 
		return typeService.update(type)==1;
	} 
	
}