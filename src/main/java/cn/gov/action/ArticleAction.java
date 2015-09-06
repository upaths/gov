package cn.gov.action;

import cn.gov.enums.CategoryEnum;
import cn.gov.model.Article;
import cn.gov.model.Category;
import cn.gov.model.Position;
import cn.gov.model.Source;
import cn.gov.service.ArticleService;
import cn.gov.service.CategoryService;
import cn.gov.service.PositionService;
import cn.gov.service.SourceService;
import cn.gov.util.AlertUtil;
import cn.gov.util.FileUtil;

import java.io.File;
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
	private String title;
	private Integer review;
	private List list;
	private String sysdate;
	private List<Source> sourceList;
	private List<Position> positionList;
	private File image;
	private String imageFileName;
	private File doc;
	private String docFileName;

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
			getPageBean().addParam("categoryId", categoryId.toString());
		}
		if (null != title){
			getPageBean().addParam("title", title);
		}
		if (null != review){
			getPageBean().addParam("display", review.toString());
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
		if (categoryId != null) {
			category = categoryService.queryByPrimaryKey(categoryId);
		}
		return "query";
	}

	public String toAdd() {
		sourceList = sourceService.queryAllSource();
		positionList = positionService.queryAllPosition();
		category = categoryService.queryByPrimaryKey(categoryId);
		sysdate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		return "toAdd";
	}

	public String toUpdate() {
		sourceList = sourceService.queryAllSource();
		positionList = positionService.queryAllPosition();
		article = articleService.queryArticleById(articleId);
		category = categoryService.queryByPrimaryKey(categoryId);
		return "toUpdate";
	}
	public String insert() {
		if (image != null) {
			String url = FileUtil.uploadFile(image, imageFileName, request);
			article.setThumb(url);
		}
		if (doc != null) {
			String url = FileUtil.uploadFile(doc, docFileName, request);
			article.setDoc(url);
		}
		article.setReadTime(0);
		articleService.insert(article);
		category = categoryService.queryByPrimaryKey(categoryId);
		if (CategoryEnum.PAGE.toString().equals(category.getCategoryType())) {
			AlertUtil.alertThenGo(response, "添加成功！", "article_page.action?categoryId="+categoryId);
		}else {
			AlertUtil.alertThenGo(response, "添加成功！", "article_query.action?categoryId="+categoryId);
		}
		return null;
	}

	public String update() {
		if (image != null) {
			String url = FileUtil.uploadFile(image, imageFileName, request);
			article.setThumb(url);
		}
		if (doc != null) {
			String url = FileUtil.uploadFile(doc, docFileName, request);
			article.setDoc(url);
		}
		articleService.update(article);
		category = categoryService.queryByPrimaryKey(categoryId);
		if (CategoryEnum.PAGE.toString().equals(category.getCategoryType())) {
			AlertUtil.alertThenGo(response, "更新成功！", "article_page.action?categoryId="+categoryId);
		}else {
			AlertUtil.alertThenGo(response, "更新成功！", "article_query.action?categoryId="+categoryId);
		}
		return null;
	}

	public String delete() {
		articleService.delete(articleId);
		AlertUtil.alertThenGo(response, "删除成功！", "article_query.action?categoryId="+categoryId);
		return null;
	}

	/**
	 * 更新是否审核
	 */
	public String updateReview() {
		articleService.updateSelective(article);
		String msg = "审核成功！";
		if (!article.getDisplay()) {
			msg = "撤销审核成功！";
		}
		if (categoryId == null) {
			AlertUtil.alertThenGo(response, msg, "article_review.action");
		}else {
			AlertUtil.alertThenGo(response, msg, "article_query.action?categoryId="+categoryId);
		}
		return null;
	}

	/**
	 * 单页
	 * @return
	 */
	public String page() {
		sourceList = sourceService.queryAllSource();
		positionList = positionService.queryAllPosition();

		List<Article> articleList = articleService.queryArticlesByCategoryId(categoryId);
		category = categoryService.queryByPrimaryKey(categoryId);
		if (articleList == null || articleList.size() == 0) {
			sysdate = new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
			return "toAdd";
		}else {
			article = articleList.get(0);
			return "toUpdate";
		}
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public Integer getReview() {
		return review;
	}

	public void setReview(Integer review) {
		this.review = review;
	}

	public File getDoc() {
		return doc;
	}

	public void setDoc(File doc) {
		this.doc = doc;
	}

	public String getDocFileName() {
		return docFileName;
	}

	public void setDocFileName(String docFileName) {
		this.docFileName = docFileName;
	}
}
