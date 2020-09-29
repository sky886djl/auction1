package com.auction.dao;

import java.util.List;
import java.util.Map;

import com.auction.entity.Message;

public interface MessageDAO {
	//新增消息(回复)
	public int addMessage(Message message);
	
	//查询消息
	public int getMessagesByUserIdSimple(int origin_user_id);
	/**
	 * 查询消息
	 * @param origin_user_id
	 * @param msgType
	 * @return
	 */
	public List<Message> getMessagesByUserIdComplex(Map<String, Object> map);
	/**
	 * 消息已读
	 * @param ids
	 * @param orgin_user_id
	 * @return
	 */
	public int alreadyRead(int[]ids);
	/**
	 * 查看消息是否已经存在
	 * @param message
	 * @return
	 */
	public int getMessageByMessage(Message message);
	
	/**
	 * 删除消息
	 * @param id
	 * @return
	 */
	public int deleteMessageById(int id);
}
