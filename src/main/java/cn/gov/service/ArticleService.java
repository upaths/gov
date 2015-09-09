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

	public List<Article> queryArticlesByCategoryId(Integer categoryId);

	public List query(Map map);
	
	public int count(Map map);

	public List<Article> queryDisplayArticleByCatid(Integer catid, String sort, Integer page, Integer size);

	public int countDisplayArticleByCatid(Integer catid);

	public List<Article> queryDisplayArticleByPosid(Integer posid, String sort, Integer page, Integer size);

	public int countDisplayArticleByPosid(Integer posid);

}
