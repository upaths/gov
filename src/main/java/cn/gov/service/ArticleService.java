package cn.gov.service;

import java.util.List;
import java.util.Map;

import cn.gov.model.Article;

public interface ArticleService {
	
	public void insert(Article article);

	public int update(Article article);
	
	public int updateSelective(Article article);

	public int delete(Integer id);
	
	public Article queryArticleById(Integer id);

	public List query(Map map);
	
	public int count(Map map);
	
	public List queryTopArticle(Map map);
	
	public List queryHotArticle(Map map);
}
