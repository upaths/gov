package cn.gov.service;

import java.util.List;
import java.util.Map;

import cn.gov.model.Log;

public interface LogService {
	
	public void insert(Log log);

	public int delete(Integer id);

	public List query(Map map);
	
	public int queryCount();
}
