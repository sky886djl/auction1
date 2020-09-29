package com.auction.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.auction.entity.Admin;
import com.auction.service.IAdminService;

@SessionAttributes(value = { "admin" })
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private IAdminService adminService;
	
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public ModelAndView login(Admin ai) {
		ModelAndView mView=new ModelAndView();
		
		Admin admin = adminService.login(ai);
		mView.addObject("admin", admin);
		if (admin != null&&admin.getUsername()!=null) {
			mView.setViewName("redirect:/admin/index.jsp");
		} else {
			mView.addObject("msg", "error");
			mView.setViewName("admin/login");
		}
		return mView;
	}
	
	@RequestMapping(value = "/loginout", method = RequestMethod.GET)
	public String loginout(SessionStatus status) {
		status.setComplete();
		return "admin/login";
	}

	/**
	 * 管理员列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)  
	@ResponseBody  
	public Map<String, Object> list() throws Exception {  
	    List<Admin> list = adminService.list();  
	    Map<String, Object> map2Json = new HashMap<String, Object>();  
	    map2Json.put("aaData", list);
	    return map2Json;  
	}
	
	@RequestMapping(value = "/forbid",method=RequestMethod.POST)  
	@ResponseBody
	public boolean forbidden(@RequestParam("id")int id) throws Exception {
		return adminService.forbid(id)==1;
	}
	
	@RequestMapping(value = "/activate",method=RequestMethod.POST)  
	@ResponseBody
	public boolean activate(@RequestParam("id")int id) throws Exception {
		return adminService.activate(id)==1;
	}
	
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/del",method=RequestMethod.POST)  
	@ResponseBody
	public boolean del(@RequestParam("id")int id) throws Exception {
		return adminService.delete(id)==1;
	}
	
	@RequestMapping(value = "/usernameUnique",method=RequestMethod.POST)  
	@ResponseBody
	public boolean usernameUnique(@RequestParam("username")String username) throws Exception {
		return adminService.getAdminByUsername(username)==null;
	}
	
	@RequestMapping(value = "/add",method=RequestMethod.POST)  
	@ResponseBody
	public boolean add(@RequestBody Admin admin) throws Exception {
		return adminService.add(admin)==1;
	}
	
	@RequestMapping(value = "/dels",method=RequestMethod.POST)  
	@ResponseBody
	public boolean dels(@RequestParam("ids")int[] ids) throws Exception {
		return adminService.deleteAll(ids)==ids.length;
	}
	
	@RequestMapping(value = "/pwdChange",method=RequestMethod.POST)  
	@ResponseBody
	public boolean pwdChange(@RequestParam("password")String password,HttpSession session) throws Exception {
		Admin admin = (Admin)session.getAttribute("admin");
		int result=adminService.changePwd(password,admin.getId());
		if(result==1)
			admin.setPassword(password);
		return result==1;
	}
}
