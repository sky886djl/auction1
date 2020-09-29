package com.auction.service;

import java.util.List;

import com.auction.entity.Message;

public interface IMessageService {
	//新增消息(回复)
		public int addMessage(Message message);
		
		//查询消息
		public int getMessagesByUserIdSimple(int origin_user_id);
		//查询消息
		public List<Message> getMessagesByUserIdComplex(int origin_user_id,int msgType);
		/**
		 * 消息已读
		 * @param ids
		 * @return
		 */
		public int alreadyRead(int[]ids);
		
		/**
		 * 查询消息是否存在
		 * @param message
		 * @return
		 */
		public int getMessageByMessage(Message message);
		
		/**
		 * 删除消息
		 */
		public int deleteMessageById(int id);
}
