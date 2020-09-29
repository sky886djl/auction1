package com.auction.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.MessageDAO;
import com.auction.entity.Message;
import com.auction.service.IMessageService;

@Service("messageService")
public class MessageServiceImpl implements IMessageService {
	@Autowired
	private MessageDAO messageDAO;
	@Override
	public int addMessage(Message message) {
		return messageDAO.addMessage(message);
	}

	@Override
	public int getMessagesByUserIdSimple(int origin_user_id) {
		return messageDAO.getMessagesByUserIdSimple(origin_user_id);
	}

	@Override
	public List<Message> getMessagesByUserIdComplex(int origin_user_id,int msgType) {
		Map<String, Object> map = new HashMap<>();
		map.put("origin_user_id", origin_user_id);
		map.put("msgType", msgType);
		return messageDAO.getMessagesByUserIdComplex(map);
	}

	@Override
	public int alreadyRead(int[] ids) {
		if(ids==null||ids.length==0) {
			return 0;
		}
		return messageDAO.alreadyRead(ids);
	}

	@Override
	public int getMessageByMessage(Message message) {
		return messageDAO.getMessageByMessage(message);
	}

	@Override
	public int deleteMessageById(int id) {
		return messageDAO.deleteMessageById(id);
	}
	

}
