package cn.gov.action;

import cn.gov.cache.SiteCache;
import cn.gov.enums.CategoryEnum;
import cn.gov.model.*;
import cn.gov.service.*;
import cn.gov.util.AlertUtil;
import cn.gov.util.FileUtil;
import com.opensymphony.xwork2.ActionContext;
import org.ansj.domain.Term;
import org.ansj.splitWord.analysis.ToAnalysis;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ArticleAction extends BasicAction {

	private CategoryService categoryService;
	private ArticleService articleService;
	private SourceService sourceService;
	private PositionService positionService;
	private UserService userService;
	private Integer categoryId;
	private Category category;
	private Integer articleId;
	private Article article;
	private String title;
	private Integer review;
	private List list;
	private Date sysdate;
	private List<Source> sourceList;
	private List<Position> positionList;
	private File image;
	private String imageFileName;
	private File doc;
	private String docFileName;
	private Role role;
	private List<Article> articles;
	private String content;
	private String ids;
	private Integer chgCatid;
	private String synCatids;

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
		role = userService.queryRoleByUsername((String) ActionContext.getContext().getSession().get("user"));
		return "query";
	}

	public String toAdd() {
		sourceList = sourceService.queryAllSource();
		positionList = positionService.queryAllPosition();
		category = categoryService.queryByPrimaryKey(categoryId);
		sysdate = new Date();
		role = userService.queryRoleByUsername((String) ActionContext.getContext().getSession().get("user"));
		return "toAdd";
	}

	public String toUpdate() {
		sourceList = sourceService.queryAllSource();
		positionList = positionService.queryAllPosition();
		article = articleService.queryArticleById(articleId);
		category = categoryService.queryByPrimaryKey(categoryId);
		role = userService.queryRoleByUsername((String) ActionContext.getContext().getSession().get("user"));
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
		if (article.getDisplay() == null) {
			article.setDisplay(false);
		}
		articleService.insert(article);
		if (synCatids != null && !"".equals(synCatids)) {
			synCatids = synCatids.replaceAll(" ", "");
			String[] catids = synCatids.split(",");
			for (String catidStr : catids) {
				try {
					Integer catid = Integer.valueOf(catidStr);
					List<Category> childs = categoryService.queryChilds(catid);
					if (catid != categoryId && (childs == null || childs.size() == 0)) {
						article.setCatId(catid);
						articleService.insert(article);
					}
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
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

	public String updateBatch() {
		String msg = "更新失败！";
		if (articles != null && articles.size() > 0) {
			int cnt = 0;
			for (Article a : articles) {
				cnt += articleService.updateSort(a);
			}
			if (cnt == articles.size()) {
				msg = "更新成功！";
			}
		}
		AlertUtil.alertThenGo(response, msg, "article_query.action?categoryId="+categoryId);
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
			sysdate = new Date();
			return "toAdd";
		}else {
			article = articleList.get(0);
			return "toUpdate";
		}
	}

	public void fetchKeywords() {
		StringBuffer keywordBuffer = new StringBuffer();
		if (content != null && !"".equals(content)) {
			List<Term> keywordList = ToAnalysis.parse(content);
			System.out.println(keywordList);
			if (keywordList != null) {
				Map<String, Integer> map = new HashMap<String, Integer>();
				for (int i = 0; i <keywordList.size(); i++) {
					Term term = keywordList.get(i);
					if (term.getRealName().length() > 1 && (term.getNatrue().natureStr.contains("a") || term.getNatrue().natureStr.contains("n"))) {
						if (map.get(term.getRealName()) == null) {
							map.put(term.getRealName(), 0);
						}
						map.put(term.getRealName(), map.get(term.getRealName()) + 1);
					}
				}
				System.out.println(map);
				Map<Integer, List<String>> sortedMap = new TreeMap<Integer, List<String>>(new Comparator<Integer>() {
					public int compare(Integer key1, Integer key2) {
						return key2 - key1;
					}
				});
				for (Map.Entry<String, Integer> entry : map.entrySet()) {
					if (sortedMap.get(entry.getValue()) == null) {
						sortedMap.put(entry.getValue(), new ArrayList<String>());
					}
					sortedMap.get(entry.getValue()).add(entry.getKey());
				}
				System.out.println(sortedMap);
				int cnt = 0;
				topLoop: for (Map.Entry<Integer, List<String>> entry : sortedMap.entrySet()) {
					List<String> list = entry.getValue();
					for (String keyword : list) {
						keywordBuffer.append(keyword).append(",");
						cnt++;
						if (cnt >= 5) {
							break topLoop;
						}
					}
				}
			}
		}
		String result = keywordBuffer.length() > 0 ? keywordBuffer.substring(0, keywordBuffer.length()-1):"";
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String moveBatch() {
		String msg = "批量移动失败！";
		try {
			String[] idsAry = ids.split(",");
			for (String id : idsAry) {
				Article a = new Article();
				a.setId(Integer.valueOf(id));
				a.setCatId(chgCatid);
				articleService.updateSelective(a);
			}
			msg = "批量移动成功！";
		}catch (Exception e) {
			e.printStackTrace();
		}
		AlertUtil.alertThenGo(response, msg, "article_query.action?categoryId="+categoryId);
		return null;
	}

	public String deleteBatch() {
		String msg = "批量删除失败！";
		try {
			String[] idsAry = ids.split(",");
			for (String id : idsAry) {
				articleService.delete(Integer.valueOf(id));
			}
			msg = "批量删除成功！";
		}catch (Exception e) {
			e.printStackTrace();
		}
		AlertUtil.alertThenGo(response, msg, "article_query.action?categoryId="+categoryId);
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

	public Date getSysdate() {
		return sysdate;
	}

	public void setSysdate(Date sysdate) {
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

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public Integer getChgCatid() {
		return chgCatid;
	}

	public void setChgCatid(Integer chgCatid) {
		this.chgCatid = chgCatid;
	}

	public String getSynCatids() {
		return synCatids;
	}

	public void setSynCatids(String synCatids) {
		this.synCatids = synCatids;
	}
}
