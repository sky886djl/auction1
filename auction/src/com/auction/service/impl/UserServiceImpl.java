package com.auction.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.UserDAO;
import com.auction.entity.User;
import com.auction.service.IUserService;
import com.auction.util.MyRegex;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public List<User> findAllUsers(boolean flag) {
		if(flag)
			return userDAO.findAllUsers();
		else
			return userDAO.findAllDelUsers();//查询‘已删除’用户
	}

	@Override
	public User getUserById(int id) {
		return userDAO.getUserById(id);
	}

	@Override
	public User selectUser(User user) {
		String login=user.getUsername();
		user.setUsername(null);
		if (MyRegex.isEmail(login)) {// 邮箱登录
			user.setEmail(login);
		} else if (MyRegex.isMobile(login)) {// 手机号登录
			user.setTel(login);
		} else { // 拍卖号登录
			user.setUsername(login);
		}
		return userDAO.selectUser(user);
	}

	@Override
	public int add(User user) {
		if(user.getUsername()==null) {
			user.setUsername(getMaxUsername());
		}
		if(user.getAddress()==null) {
			user.setAddress("暂无");
		}
		return userDAO.add(user);
	}
	@Override
	public int update(User user) {
		return userDAO.update(user);
	}

	@Override
	public String getMaxUsername() {
		return String.valueOf(Long.parseLong(userDAO.getMaxUsername())+1);
	}

	@Override
	public int forbidden(int id) {
		return userDAO.forbidden(id);
	}

	@Override
	public String selectEmail(String email) {
		return userDAO.selectEmail(email);
	}

	@Override
	public String selectTel(String tel) {
		return userDAO.selectTel(tel);
	}

	@Override
	public int addAccount(int id, double money) {
		Map<String, Object> hashmap = new HashMap<>();
		hashmap.put("id", id);
		hashmap.put("money", money);
		return userDAO.addAccount(hashmap);
	}

	@Override
	public int subAccount(int id,double money) {
		Map<String, Object> hashmap = new HashMap<>();
		hashmap.put("id", id);
		hashmap.put("money", money);
		return userDAO.subAccount(hashmap);
	}

	@Override
	public int activate(int id) {
		return userDAO.activate(id);
	}

	@Override
	public int deleteUserById(boolean flag, int id) {
		if(flag)
			return userDAO.deleteTrueById(id);
		else 
			return userDAO.deleteFalseById(id);
	}

	@Override
	public int deleteUsersByIds(boolean flag, int[] ids) {
		if(flag)
			return userDAO.deleteAllTrueByIds(ids);
		else
			return userDAO.deleteAllFalseByIds(ids);
		
	}

	@Override
	public int activates(int[] ids) {
		return userDAO.activates(ids);
	}

	@Override
	public int getIdByUsername(String username) {
		return userDAO.getIdByUsername(username);
	}

	@Override
	public int changeHeadPic(String newPic,int id) {
		Map<String, Object> map=new HashMap<>();
		map.put("newPic",newPic);
		map.put("id", id);
		return userDAO.changeHeadPic(map);
	}

	@Override
	public int changePwd(String newpwd, int id) {
		Map<String, Object> map = new HashMap<>();
		map.put("newpwd", newpwd);
		map.put("id", id);
		return userDAO.changePwd(map);
	}

}
