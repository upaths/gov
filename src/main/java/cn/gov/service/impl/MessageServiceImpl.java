package cn.gov.service.impl;

import java.util.List;
import java.util.Map;

import cn.gov.dao.ExtraMapper;
import cn.gov.dao.MessageMapper;
import cn.gov.model.Message;
import cn.gov.model.MessageExample;
import cn.gov.service.MessageService;

public class MessageServiceImpl implements MessageService {
	private MessageExample messageExample;
	private MessageMapper messageMapper;
	private ExtraMapper extraMapper;
	public void insert(Message message) {
		messageMapper.insert(message);
	}

	public int delete(Integer id) {
		return messageMapper.deleteByPrimaryKey(id);
	}

	public List queryMessage(Map map) {
		return extraMapper.queryMessage(map);
	}

	public int queryMessageCount() {
		messageExample.clear();
		return messageMapper.countByExample(messageExample);
	}

	public MessageExample getMessageExample() {
		return messageExample;
	}

	public void setMessageExample(MessageExample messageExample) {
		this.messageExample = messageExample;
	}

	public MessageMapper getMessageMapper() {
		return messageMapper;
	}

	public void setMessageMapper(MessageMapper messageMapper) {
		this.messageMapper = messageMapper;
	}

	public ExtraMapper getExtraMapper() {
		return extraMapper;
	}

	public void setExtraMapper(ExtraMapper extraMapper) {
		this.extraMapper = extraMapper;
	}
	
}
