package cn.gov.service;

import java.util.List;
import java.util.Map;

import cn.gov.model.Message;

public interface MessageService {
	
	public void insert(Message message);

	public int delete(Integer id);

	public List queryMessage(Map map);
	
	public int queryMessageCount();
}
