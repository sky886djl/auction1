package com.auction.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.auction.entity.Message;
import com.auction.entity.User;
import com.auction.service.IMessageService;
import com.auction.service.IUserService;
import com.auction.util.FileUpload;
import com.auction.util.UserCode;

@SessionAttributes(value = { "bidder","seller" },types=User.class)
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IMessageService messageService;//消息

	@RequestMapping(value = "/show",method=RequestMethod.GET)
	@ResponseBody
	public User show(@RequestParam("id") int id) throws Exception {
		return userService.getUserById(id);
	}

	/**
	 * 新增
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)  
	@ResponseBody  
	public boolean add(@RequestBody User user,HttpSession session) throws Exception {  
		boolean f= userService.add(user)==1;
		if(f) {
			session.setAttribute("user", userService.selectUser(user));
		}
		return f;
	}

	/**
	 * 更新
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)  
	@ResponseBody  
	public boolean update(@RequestBody User user) throws Exception {  
		return userService.update(user)==1;
	}
	
	/**
	 * type=1 竞买者-更新
	 * type!=1 委托者更新
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/update1/{type}",method=RequestMethod.POST)  
	@ResponseBody  
	public boolean update1(@PathVariable("type") int type ,@RequestBody User user,HttpSession session) throws Exception {  
		User user1=null;
		if(type==1) {
			user1=(User)session.getAttribute("bidder");
		} else {
			user1=(User)session.getAttribute("seller");
		}
		if(userService.update(user)==1) {
			user1.setName(user.getName());
			user1.setGender(user.getGender());
			user1.setTel(user.getTel());
			user1.setEmail(user.getEmail());
			user1.setDeclaration(user.getDeclaration());
			user1.setAge(user.getAge());
			user1.setAddress(user.getAddress());
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping(value="/loginUI",method=RequestMethod.GET)  
	public String loginUI(HttpServletRequest request) {  
		//在session中保存进入登录之前的页面  
		HttpSession session = request.getSession();  
		//保存登录前的页面  
		session.setAttribute("privatePage", request.getHeader("Referer").
				split("auction")[1]); 
		session.removeAttribute("unReadMessagesNum");
		return "login";  
	}
	
	@RequestMapping(value="/loginUI1",method=RequestMethod.GET)  
	public String loginUI1() {  
		return "login";  
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(User ui,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = userService.selectUser(ui);
		if (u != null && u.getUsername() != null) {
			if(u.getType()==1) {
				int count = messageService.getMessagesByUserIdSimple(u.getId());
				if(count>0)
					session.setAttribute("unReadMessagesNum",count);
				else 
					session.removeAttribute("unReadMessagesNum");
				UserCode.encode(u);
				mv.setViewName("index");
				//登陆的验证通过后,在从session里获取前画面的url  
				String url = (String) session.getAttribute("privatePage");
				if(url!=null) {
					mv.setViewName("redirect:"+url);
				} else {
					mv.setViewName("index");
				}
				mv.addObject("bidder", u);
			}
			else {
				mv.setViewName("redirect:/seller/index.jsp");
				mv.addObject("seller", u);
			}
			
		} else {
			mv.addObject("message", "error");
			mv.setViewName("login");
		}
		return mv;
	}


	@RequestMapping(value = "/register")
	public ModelAndView register(User user) {
		ModelAndView mv = new ModelAndView();
		String email = userService.selectEmail(user.getEmail());
		String tel = userService.selectTel(user.getTel());
		if (email == null && tel == null) {
			user.setUsername(userService.getMaxUsername());
			if(userService.add(user)==1) {
				mv.setViewName("registerSuccess");
				mv.addObject("user1", user);
			}
		} else {
			if(email!=null) {
				mv.addObject("email",email);
			}
			if(tel!=null) {
				mv.addObject("tel",tel);
			}
			mv.addObject("user1", user);
			mv.setViewName("register");
		}
		return mv;
	}
	
	/**
	 * 用户列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)  
	@ResponseBody  
	public Map<String, Object> list(@RequestParam("flag")boolean flag) throws Exception {  
	    List<User> list = userService.findAllUsers(flag);  
	    Map<String, Object> map2Json = new HashMap<String, Object>();  
	    map2Json.put("aaData", list);
	    return map2Json;  
	}

	@RequestMapping(value = "/forbidden",method=RequestMethod.POST)  
	@ResponseBody
	public boolean forbidden(@RequestParam("id")int id) throws Exception {
		return userService.forbidden(id)==1;
	}
	
	@RequestMapping(value = "/activate",method=RequestMethod.POST)  
	@ResponseBody
	public boolean activate(@RequestParam("id")int id) throws Exception {
		return userService.activate(id)==1;
	}
	
	/**
	 * 
	 * @param id
	 * @param flag=true真删除 flag=false假删除
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete",method=RequestMethod.POST)  
	@ResponseBody
	public boolean delete(@RequestParam("id")int id,@RequestParam("flag")boolean flag) throws Exception {
		return userService.deleteUserById(flag, id)==1;
	}
	
	@RequestMapping(value = "/deletes",method=RequestMethod.POST)  
	@ResponseBody
	public boolean deletes(@RequestParam("ids")int[] ids,@RequestParam("flag")boolean flag) throws Exception {
		return userService.deleteUsersByIds(flag, ids)==ids.length;
	}
	
	@RequestMapping(value = "/activates",method=RequestMethod.POST)  
	@ResponseBody
	public boolean activates(@RequestParam("ids")int[] ids) throws Exception {
		return userService.activates(ids)==ids.length;
	}
	
	
	/**
	 * 手机号的唯一性
	 * 更新时 params:tel=xxx&tel2=xxx  tel2为原手机号
	 * 新增 params:tel=xxx&tel2=xxx  tel2为add
	 */
	@RequestMapping(value="/telUnique",method=RequestMethod.POST)  
	@ResponseBody  
	public boolean telUnique(@RequestParam("tel")String tel,@RequestParam("tel2")String tel2) throws Exception {  
		String result=userService.selectTel(tel);
		if(tel2.equals("add")) { //新增
			return result==null;
		} else { //更新
			return result==null||result.equals(tel2);
		}
	} 
	
	/**
	 * 邮箱的唯一性
	 * 更新时 params:email=xxx&&email2=xxx  email2为原邮箱
	 * 新增 params:email=xxx&&email2=xxx  email2为add
	 */
	@RequestMapping(value="/emailUnique",method=RequestMethod.POST)  
	@ResponseBody  
	public boolean emailUnique(@RequestParam("email")String email,@RequestParam("email2")String email2) throws Exception {  
		email=email.replace("%40", "@");
		String result=userService.selectEmail(email);
		if(email2.equals("add")) {//新增
			return result==null;
		} else { //更新
			return result==null||result.equals(email2);
		}
	} 
	
	@RequestMapping(value="/getIdByUsername",method=RequestMethod.GET)  
	@ResponseBody  
	public int getIdByUsername(@RequestParam("username")String username) throws Exception {  
		return userService.getIdByUsername(username);
	} 
	
	
	@RequestMapping(value = "/loginout", method = RequestMethod.GET)
	public String loginout(SessionStatus status,HttpServletRequest request) {
		status.setComplete();
		return "redirect:"+request.getHeader("Referer").split("auction")[1];
	}
	
	/**
	 * 从recharge.jsp页面提交过来
	 * @return
	 */
	@RequestMapping(value="/recharge/{docVlGender}")
	public ModelAndView recharge(@PathVariable("docVlGender")String docVlGender, HttpSession session) {
		User user = (User) session.getAttribute("bidder");
		ModelAndView mv = new ModelAndView();
		if(user==null) {
			mv.setViewName("redirect:/login.jsp");
			return mv;
		}
		if(docVlGender==null) {
			mv.setViewName("redirect:/product/list");//个人中心
		} else {
			mv.addObject("docVlGender", docVlGender);
			mv.setViewName("rechargeConfirm");//充值确认页面
		} 
		return mv;
	}

	@RequestMapping(value="/rechargeConfirm/{docVlGender}", method = {RequestMethod.GET})
	public ModelAndView rechargeConfirm(@PathVariable("docVlGender")String docVlGender, HttpSession session) {
		User user = (User) session.getAttribute("bidder");
		ModelAndView mv = new ModelAndView();
		if(user==null) {
			mv.setViewName("redirect:/login.jsp");
			return mv;
		}
		if(docVlGender==null) {
			mv.setViewName("redirect:/individual");//个人中心
		} else {
			mv.setViewName("rechargeResult");//充值成功页面
			mv.addObject("money", docVlGender);
			mv.addObject("name", user.getName());
			if(userService.addAccount(user.getId(),Double.parseDouble(docVlGender))==1) {
				user.setAccount(user.getAccount()+Double.parseDouble(docVlGender));
				mv.addObject("chargemsg", "success");
			}
			else
				mv.addObject("chargemsg", "failure");
		}
		return mv;
	}

	@RequestMapping(value = "/changeHeadPic/{type}", method = RequestMethod.POST)
	@ResponseBody
	public boolean changeHeadPic(@PathVariable("type")int type,@RequestParam("headpic")MultipartFile headpic, HttpSession session) throws Exception {
		User user=null;
		if(type==0) {
			user=(User) session.getAttribute("bidder");
		} else {
			user=(User)session.getAttribute("seller");
		}
		if(user==null)
			return false;
		String name=FileUpload.uploadFile(headpic, "D:/workplace/myeclipseworkplace/auction/WebContent/admin/static/img/");
		boolean f=false;
		if(userService.changeHeadPic(name, user.getId())==1) {
			user.setHeadpic(name);
			f=true;
		}
		return f;
	}
	
	@RequestMapping(value = "/pwdChange",method=RequestMethod.POST)  
	@ResponseBody
	public boolean pwdChange(@RequestParam("pwd")String password,HttpSession session) throws Exception {
		User user = (User)session.getAttribute("bidder");
		int result=userService.changePwd(password,user.getId());
		if(result==1)
			user.setPassword(password);
		return result==1;
	}
	
	/**
	 * type
	 * @param type -0-全部  -1-提醒消息 -2-回复我的消息 -3-拍卖消息
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/message/{type}", method = {RequestMethod.GET})
	public ModelAndView message(@PathVariable("type")int type, HttpSession session) {
		User user = (User) session.getAttribute("bidder");
		ModelAndView mv = new ModelAndView();
		if(user==null) {
			mv.setViewName("redirect:/index.jsp");
			return mv;
		} 
		List<Message> messages=messageService.getMessagesByUserIdComplex(user.getId(),type);
		int len=messages.size();
		List<Integer> list=new ArrayList<>();
		Message msg=null;
		for(int i=0;i<len;i++) {
			msg=messages.get(i);
			if(msg.getIsRead()==0) {
				list.add(msg.getId());
			}
		}
		int[]ids=new int[list.size()];
		for(int i=0;i<list.size();i++) {
			ids[i]=list.get(i);
		}
		if(ids.length>0) {
			messageService.alreadyRead(ids);
			session.removeAttribute("unReadMessagesNum");
		}
		mv.addObject("messages", messages);
		mv.setViewName("/bidder/message");
		return mv;
	}
	@RequestMapping(value = "/deleteMsg",method=RequestMethod.POST)  
	@ResponseBody
	public boolean deleteMsg(@RequestParam("id")int id) throws Exception {
		return messageService.deleteMessageById(id)==1;
	}
}
