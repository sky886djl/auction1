package com.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.TypeDAO;
import com.auction.entity.Type;
import com.auction.service.ITypeService;

@Service("typeService")
public class TypeServiceImpl implements ITypeService {
	@Autowired
	private TypeDAO typeDAO;
	
	@Override
	public List<Type> getAllTypes() {
		return typeDAO.getAllTypes();
	}

	@Override
	public Type getTypeByName(String typeName) {
		return typeDAO.getTypeByName(typeName);
	}

	@Override
	public int delete(int id) {
		return typeDAO.delete(id);
	}

	@Override
	public int deleteAll(int[] ids) {
		return typeDAO.deleteAll(ids);
	}

	@Override
	public int update(Type type) {
		return typeDAO.update(type);
	}

	@Override
	public int add(Type type) {
		return typeDAO.add(type);
	}

	@Override
	public Type getTypeById(int id) {
		return typeDAO.getTypeById(id);
	}
	

}
