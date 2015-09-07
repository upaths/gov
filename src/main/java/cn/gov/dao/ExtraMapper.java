package cn.gov.dao;

import java.util.List;
import java.util.Map;

import cn.gov.model.Message;

public interface ExtraMapper {
	public List queryArticle(Map map);
	
	public int countArticle(Map map);
	
	public List queryLog(Map map);
	
	public List queryMessage(Map map);
	
	public List<Map> queryAllUser();
}
