package cn.gov.service;

import java.util.List;
import java.util.Map;

import cn.gov.model.Message;

public interface MessageService {
	
	public void insert(Message message);

	public int delete(Integer id);

	public List<Message> queryMessage(Map map);
	
	public int queryMessageCount();

	public int updateMessage(Message message);

	public List<Message> queryDisplayMessage(String sort, Integer page, Integer size);

	public int countDisplayMessage();
}
