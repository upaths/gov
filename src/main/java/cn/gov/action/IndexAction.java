package cn.gov.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cn.gov.model.Category;
import cn.gov.service.ArticleService;
import cn.gov.service.CategoryService;

public class IndexAction extends BasicAction {
	private CategoryService categoryService;
	private ArticleService articleService;
	private List tpxwList; //图片新闻
	private List syxwList; //首页新闻
	private List tzggList; //通知公告
	private List zwgkList; //政务公开
	private List zcfgList; //政策法规
	private List tpList = new ArrayList(); //图片新闻的图片
	
	private Category tpxw;
	private Category syxw;
	private Category tzgg;
	private Category zwgk;
	private Category zcfg;

	public String test() {
		tpxwList = new ArrayList();
		tpxwList.add("测试abc");
		tpxwList.add("测试def");
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String execute() {
		tpxw = categoryService.queryByName("图片新闻");
		syxw = categoryService.queryByName("质监新闻");
		tzgg = categoryService.queryByName("通知公告");
		zwgk = categoryService.queryByName("政务公开");
		zcfg = categoryService.queryByName("政策法规");
		Map map = new HashMap();
		if (tpxw != null) {
			map.put("num", 7);
			map.put("ejid", tpxw.getId());
			map.put("sfyt", 1);
//			tpxwList = articleService.queryTopArticle(map);
			for (int i = 0; i < tpxwList.size(); i++) {
				Map tpxwMap = (Map)tpxwList.get(i);
				Pattern p = Pattern.compile("<img .*? src=\"(.+?)\" .*?/>");
				Matcher m = p.matcher((String)tpxwMap.get("nr"));
				if (m.find()) {
					tpxwMap.put("image", m.group(1));
				}
			}
			map.put("num", 20);
			List tmpList = null;
			for (int i = 0; i < tmpList.size(); i++) {
				Map tpxwMap = (Map)tmpList.get(i);
				Pattern p = Pattern.compile("<img .*? src=\"(.+?)\" .*?/>");
				Matcher m = p.matcher((String)tpxwMap.get("nr"));
				while (m.find()) {
					Map tpMap = new HashMap();
					tpMap.put("id", tpxwMap.get("id"));
					tpMap.put("bt", tpxwMap.get("bt"));
					tpMap.put("image", m.group(1));
					tpList.add(tpMap);
				}
			}
			map.remove("sfyt");
		}
		if (syxw != null) {
			map.put("num", 7);
			map.put("ejid", syxw.getId());
//			syxwList = articleService.queryTopArticle(map);
		}
		if (tzgg != null) {
			map.put("num", 8);
			map.put("ejid", tzgg.getId());
//			tzggList = articleService.queryTopArticle(map);
		}
		if (zwgk != null) {
			map.put("num", 7);
			map.put("ejid", zwgk.getId());
//			zwgkList = articleService.queryTopArticle(map);
		}
		if (zcfg != null) {
			map.put("num", 7);
			map.put("ejid", zcfg.getId());
//			zcfgList = articleService.queryTopArticle(map);
		}
		return SUCCESS;
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

	public List getTpxwList() {
		return tpxwList;
	}

	public void setTpxwList(List tpxwList) {
		this.tpxwList = tpxwList;
	}

	public List getSyxwList() {
		return syxwList;
	}

	public void setSyxwList(List syxwList) {
		this.syxwList = syxwList;
	}

	public List getTzggList() {
		return tzggList;
	}

	public void setTzggList(List tzggList) {
		this.tzggList = tzggList;
	}

	public List getZwgkList() {
		return zwgkList;
	}

	public void setZwgkList(List zwgkList) {
		this.zwgkList = zwgkList;
	}

	public List getZcfgList() {
		return zcfgList;
	}

	public void setZcfgList(List zcfgList) {
		this.zcfgList = zcfgList;
	}

	public List getTpList() {
		return tpList;
	}

	public void setTpList(List tpList) {
		this.tpList = tpList;
	}

	public Category getTpxw() {
		return tpxw;
	}

	public void setTpxw(Category tpxw) {
		this.tpxw = tpxw;
	}

	public Category getSyxw() {
		return syxw;
	}

	public void setSyxw(Category syxw) {
		this.syxw = syxw;
	}

	public Category getTzgg() {
		return tzgg;
	}

	public void setTzgg(Category tzgg) {
		this.tzgg = tzgg;
	}

	public Category getZwgk() {
		return zwgk;
	}

	public void setZwgk(Category zwgk) {
		this.zwgk = zwgk;
	}

	public Category getZcfg() {
		return zcfg;
	}

	public void setZcfg(Category zcfg) {
		this.zcfg = zcfg;
	}
	
}
