package cn.gov.service;

import java.util.List;
import java.util.Map;

import cn.gov.model.Message;
import cn.gov.model.MessageReply;

public interface MessageService {
	
	public void insert(Message message);

	public int delete(Integer id);

	public List<Message> queryMessage(Map map);
	
	public int queryMessageCount();

	public int updateMessage(Message message);

	public List<Message> queryDisplayMessage(String sort, Integer page, Integer size);

	public int countDisplayMessage();

	public void insertMsgReply(MessageReply messageReply);

	public int deleteMsgReply(Integer msgReplyId);

	public List<MessageReply> queryMsgReply(Integer msgId);

	public int countMsgReply(Integer msgId);
}
