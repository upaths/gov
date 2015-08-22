package cn.gov.action;

import cn.gov.model.Article;
import cn.gov.model.Category;
import cn.gov.model.Position;
import cn.gov.model.Source;
import cn.gov.service.ArticleService;
import cn.gov.service.CategoryService;
import cn.gov.service.PositionService;
import cn.gov.service.SourceService;
import cn.gov.util.AlertUtil;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ArticleAction extends BasicAction {

	private CategoryService categoryService;
	private ArticleService articleService;
	private SourceService sourceService;
	private PositionService positionService;
	private Integer categoryId;
	private Category category;
	private Integer articleId;
	private Article article;
	private String bt;
	private List list;
	private String sysdate;
	private List<Source> sourceList;
	private List<Position> positionList;

	/**
	 * 文章主页面
	 * @return
	 */
	public String main() {
		return "main";
	}

	/**
	 * 文章左侧目录树
	 * @return
	 */
	public String left() {
		return "left";
	}

	/**
	 * 查询类别目录树
	 */
	public void queryCategoryTree() {
		StringBuffer sb = new StringBuffer();
		sb.append("[").append(categoryService.queryCategoryTreeJson()).append("]");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 查询文章列表
	 * @return
	 */
	public String query() {
		if (getPageBean().getPageSize() < 0) {
			getPageBean().setPageSize(15);
		}
		if (null != categoryId){
			getPageBean().addParam("categoryId", categoryId == null ? null : categoryId.toString());
		}
		if (null != bt){
			getPageBean().addParam("bt", bt);
		}
		// 设置记录总数，否则不能正确取得pageSize
		int count = articleService.count(getPageBean().getParams());
		getPageBean().setTotalRows(count);
		getPageBean().addParam(
				"currentIndex",
				String.valueOf((getPageBean().getCurrentPage() - 1)
						* getPageBean().getPageSize()));
		getPageBean().addParam("pageSize",
				String.valueOf(getPageBean().getPageSize()));
		list = articleService.query(getPageBean().getParams());
		category = categoryService.queryByPrimaryKey(categoryId);
		return "query";
	}

	public String toAdd() {
		sourceList = sourceService.queryAllSource();
		positionList = positionService.queryAllPosition();
		sysdate = new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
		return "toAdd";
	}

	public String toUpdate() {
		article = articleService.queryArticleById(articleId);
		return "toUpdate";
	}
	public String insert() {
		article.setYdcs(0);
		articleService.insert(article);
		AlertUtil.alertThenGo(response, "添加成功！", "article_query.action?categoryId="+categoryId);
		return null;
	}

	public String update() {
		articleService.update(article);
		AlertUtil.alertThenGo(response, "更新成功！", "article_query.action?categoryId="+categoryId);
		return null;
	}

	public String delete() {
		articleService.delete(article.getId());
		AlertUtil.alertThenGo(response, "删除成功！", "article_query.action?categoryId="+categoryId);
		return null;
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public ArticleService getArticleService() {
		return articleService;
	}

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getBt() {
		return bt;
	}

	public void setBt(String bt) {
		this.bt = bt;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public String getSysdate() {
		return sysdate;
	}

	public void setSysdate(String sysdate) {
		this.sysdate = sysdate;
	}

	public SourceService getSourceService() {
		return sourceService;
	}

	public void setSourceService(SourceService sourceService) {
		this.sourceService = sourceService;
	}

	public PositionService getPositionService() {
		return positionService;
	}

	public void setPositionService(PositionService positionService) {
		this.positionService = positionService;
	}

	public List<Source> getSourceList() {
		return sourceList;
	}

	public void setSourceList(List<Source> sourceList) {
		this.sourceList = sourceList;
	}

	public List<Position> getPositionList() {
		return positionList;
	}

	public void setPositionList(List<Position> positionList) {
		this.positionList = positionList;
	}
}
