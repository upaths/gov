package cn.gov.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cn.gov.model.Article;
import cn.gov.model.Category;
import cn.gov.model.Config;
import cn.gov.service.ArticleService;
import cn.gov.service.CategoryService;
import cn.gov.service.ConfigService;
import cn.gov.service.LinksService;
import cn.gov.util.AlertUtil;
import org.json.simple.JSONArray;

public class BottomAction extends BasicAction {
	private LinksService linksService;
	private ConfigService configService;
	private List list;
	private Config config;
	
	public String execute() {
		list = linksService.query();
		config = configService.queryConfig();
		return SUCCESS;
	}

	public LinksService getLinksService() {
		return linksService;
	}

	public void setLinksService(LinksService linksService) {
		this.linksService = linksService;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public ConfigService getConfigService() {
		return configService;
	}

	public void setConfigService(ConfigService configService) {
		this.configService = configService;
	}

	public Config getConfig() {
		return config;
	}

	public void setConfig(Config config) {
		this.config = config;
	}

	@SuppressWarnings("unchecked")
    public static class ArticleAction extends BasicAction {
        private Article article;
        private Category category;
        private ArticleService articleService;
        private CategoryService categoryService;
        private List<Category> cateList;
        private Integer cateId;
        private String sysdate;

        private Integer yjid;
        private Integer ejid;
        private String bt;
        private List list;

        private List tpxwList;
        private List rdxwList;
        private Map rsMap;

        public String toAdd() {
            cateList = categoryService.queryFirstLevel();
            sysdate = new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
            return "toAdd";
        }

        public String toUpdate() {
            cateList = categoryService.queryFirstLevel();
            article = articleService.queryArticleById(article.getId());
            cateId = categoryService.queryByPrimaryKey(article.getLb()).getParentId();
            return "toUpdate";
        }

        public String getChildList() {
            if (cateId != null && !"".equals(cateId)) {
                cateList = categoryService.queryChilds(cateId);
            }else {
                cateList = new ArrayList();
            }

            response.setCharacterEncoding("UTF-8");
            try {
                JSONArray jsonArray = new JSONArray();
                for (Category c : cateList) {
                    Map map = new HashMap();
                    map.put("id", c.getId());
                    map.put("mc", c.getMc());
                    map.put("parentId", c.getParentId());
                    map.put("px", c.getPx());
                    jsonArray.add(map);
                }
                response.getWriter().write(jsonArray.toJSONString());
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }

        public String query() {
            if (getPageBean().getPageSize() < 0) {
                getPageBean().setPageSize(15);
            }
            if (null != yjid){
                getPageBean().addParam("yjid", yjid.toString());
            }
            if (null != ejid){
                getPageBean().addParam("ejid", ejid.toString());
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
            cateList = categoryService.queryFirstLevel();
            return "query";
        }

        public String insert() {
            article.setYdcs(0);
            articleService.insert(article);
            AlertUtil.alertThenGo(response, "添加成功！", "article_query.action");
            return null;
        }

        public String update() {
            articleService.update(article);
            AlertUtil.alertThenGo(response, "更新成功！", "article_query.action");
            return null;
        }

        public String delete() {
            articleService.delete(article.getId());
            AlertUtil.alertThenGo(response, "删除成功！", "article_query.action");
            return null;
        }

        /**
         * 更新推荐、显示
         */
        public String updateTjXs() {
            articleService.updateSelective(article);
            AlertUtil.alertThenGo(response, "更新成功！", "article_query.action");
            return null;
        }

        public String showCat1() {
            category = categoryService.queryByPrimaryKey(yjid);
            rsMap = new LinkedHashMap();
            cateList = categoryService.queryChilds(yjid);
            Map map = new HashMap();
            map.put("num", 8);
            for (int i = 0; cateList != null && i < cateList.size(); i++) {
                map.put("ejid", cateList.get(i).getId());
                rsMap.put(cateList.get(i), articleService.queryTopArticle(map));
            }
            return SUCCESS;
        }

        public String showCat2() {
            category = categoryService.queryByPrimaryKey(ejid);
            if (getPageBean().getPageSize() < 0) {
                getPageBean().setPageSize(15);
            }
            if (null != ejid){
                getPageBean().addParam("ejid", ejid.toString());
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
            return SUCCESS;
        }

        public String search() {
            if (getPageBean().getPageSize() < 0) {
                getPageBean().setPageSize(15);
            }
            if (null != yjid){
                getPageBean().addParam("yjid", yjid.toString());
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
            return SUCCESS;
        }

        public String showNews() {
            article = articleService.queryArticleById(article.getId());
            // 更新阅读次数
            Article a = new Article();
            a.setId(article.getId());
            a.setYdcs((article.getYdcs()==null?0:article.getYdcs())+1);
            articleService.updateSelective(a);
            return SUCCESS;
        }

        public String picNews() {
            Category tpxw = categoryService.queryByMc("图片新闻");
            if (getPageBean().getPageSize() < 0) {
                getPageBean().setPageSize(15);
            }
            if (null != tpxw.getId()){
                getPageBean().addParam("ejid", tpxw.getId().toString());
            }
            getPageBean().addParam("sfyt", "1");
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
            for (int i = 0; i < list.size(); i++) {
                Map tpxwMap = (Map)list.get(i);
                Pattern p = Pattern.compile("<img .*? src=\"(.+?)\" .*?/>");
                Matcher m = p.matcher((String)tpxwMap.get("nr"));
                if (m.find()) {
                    tpxwMap.put("image", m.group(1));
                }
            }
            return SUCCESS;
        }

        public String slide() {
            Category tpxw = categoryService.queryByMc("图片新闻");
            Map map = new HashMap();
            if (tpxw != null) {
                map.put("num", 7);
                map.put("ejid", tpxw.getId());
                map.put("sfyt", 1);
                tpxwList = articleService.queryTopArticle(map);
                for (int i = 0; i < tpxwList.size(); i++) {
                    Map tpxwMap = (Map)tpxwList.get(i);
                    Pattern p = Pattern.compile("<img .*? src=\"(.+?)\" .*?/>");
                    Matcher m = p.matcher((String)tpxwMap.get("nr"));
                    if (m.find()) {
                        tpxwMap.put("image", m.group(1));
                    }
                }
            }
            return SUCCESS;
        }

        public String hot() {
            Map map = new HashMap();
            map.put("num", 11);
            rdxwList = articleService.queryHotArticle(map);
            return SUCCESS;
        }

        public ArticleService getArticleService() {
            return articleService;
        }

        public void setArticleService(ArticleService articleService) {
            this.articleService = articleService;
        }

        public CategoryService getCategoryService() {
            return categoryService;
        }

        public void setCategoryService(CategoryService categoryService) {
            this.categoryService = categoryService;
        }

        public List<Category> getCateList() {
            return cateList;
        }

        public void setCateList(List<Category> cateList) {
            this.cateList = cateList;
        }

        public Integer getCateId() {
            return cateId;
        }

        public void setCateId(Integer cateId) {
            this.cateId = cateId;
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

        public Integer getYjid() {
            return yjid;
        }

        public void setYjid(Integer yjid) {
            this.yjid = yjid;
        }

        public Integer getEjid() {
            return ejid;
        }

        public void setEjid(Integer ejid) {
            this.ejid = ejid;
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

        public List getTpxwList() {
            return tpxwList;
        }

        public void setTpxwList(List tpxwList) {
            this.tpxwList = tpxwList;
        }

        public List getRdxwList() {
            return rdxwList;
        }

        public void setRdxwList(List rdxwList) {
            this.rdxwList = rdxwList;
        }

        public Map getRsMap() {
            return rsMap;
        }

        public void setRsMap(Map rsMap) {
            this.rsMap = rsMap;
        }

        public Category getCategory() {
            return category;
        }

        public void setCategory(Category category) {
            this.category = category;
        }

    }
}
