package cn.gov.service.impl;

import java.util.List;
import java.util.Map;

import cn.gov.dao.ExtraMapper;
import cn.gov.dao.MessageMapper;
import cn.gov.model.Message;
import cn.gov.model.MessageExample;
import cn.gov.service.MessageService;

public class MessageServiceImpl implements MessageService {
	private MessageMapper messageMapper;
	private ExtraMapper extraMapper;
	public void insert(Message message) {
		messageMapper.insert(message);
	}

	public int delete(Integer id) {
		return messageMapper.deleteByPrimaryKey(id);
	}

	public List<Message> queryMessage(Map map) {
		return extraMapper.queryMessage(map);
	}

	public int queryMessageCount() {
		return messageMapper.countByExample(null);
	}

	@Override
	public int updateMessage(Message message) {
		return messageMapper.updateByPrimaryKeySelective(message);
	}

	@Override
	public List<Message> queryDisplayMessage(String sort, Integer page, Integer size) {
		MessageExample messageExample = new MessageExample();
		messageExample.createCriteria().andDisplayEqualTo(true);
		String limitSql = "";
		if (size != null && size > 0) {
			if (page != null && page > 0) {
				limitSql += " limit " + (page - 1) * size + "," + size;
			}else {
				limitSql += " limit " + size;
			}
		}
		if (sort != null && !"".equals(sort)) {
			messageExample.setOrderByClause(sort + limitSql);
		}else {
			messageExample.setOrderByClause("id desc" + limitSql);
		}
		return messageMapper.selectByExample(messageExample);
	}

	@Override
	public int countDisplayMessage() {
		MessageExample messageExample = new MessageExample();
		messageExample.createCriteria().andDisplayEqualTo(true);
		return messageMapper.countByExample(messageExample);
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
