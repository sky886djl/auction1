package com.auction.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.AdminDAO;
import com.auction.entity.Admin;
import com.auction.service.IAdminService;

@Service("adminService")
public class AdminServiceImpl implements IAdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public Admin login(Admin admin) {
		return adminDAO.getAdminByAdmin(admin);
	}

	@Override
	public Admin getAdminById(int id) {
		return adminDAO.getAdminById(id);
	}
	
	@Override
	public Admin getAdminByUsername(String username) {
		return adminDAO.getAdminByUsername(username);
	}

	@Override
	public int add(Admin admin) {
		return adminDAO.add(admin);
	}

	@Override
	public List<Admin> list() {
		return adminDAO.list();
	}

	@Override
	public int forbid(int id) {
		return adminDAO.forbid(id);
	}

	@Override
	public int activate(int id) {
		return adminDAO.activate(id);
	}

	@Override
	public int delete(int id) {
		return adminDAO.delete(id);
	}

	@Override
	public int deleteAll(int[] ids) {
		return adminDAO.deleteAll(ids);
	}

	@Override
	public int changePwd(String password,int id) {
		Map<String,Object> map = new HashMap<>();
		map.put("password", password);
		map.put("id", id);
		return adminDAO.updatePwd(map);
	}

}
