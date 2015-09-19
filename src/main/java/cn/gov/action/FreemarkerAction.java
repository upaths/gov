package cn.gov.action;

import cn.gov.cache.SiteCache;
import cn.gov.model.Article;
import cn.gov.model.Category;
import cn.gov.model.Topic;
import cn.gov.service.ArticleService;
import cn.gov.service.CategoryService;
import cn.gov.service.TopicService;

import java.io.IOException;
import java.util.List;

/**
 * Created by 王勇 on 2015/9/12.
 */
public class FreemarkerAction extends BasicAction {
    private Integer id;
    private Integer pid;
    private Integer catid;
    private Integer page;
    private Integer size = 10;
    private String title;
    private CategoryService categoryService;
    private ArticleService articleService;
    private TopicService topicService;
    public String index() {
        pid = 0;
        return SUCCESS;
    }

    public String list() {
        Category category = SiteCache.getCategoryMap().get(id);
        // 为list_child.ftl标签准备参数
        if(category.getParentId() > 0) {
            pid = category.getParentId();
        }else {
            pid = id;
            List<Category> childs = categoryService.queryChilds(id);
            if (childs != null && childs.size() > 0) {
                for (Category child : childs) {
                    if (child.getTemplet() != null && !"".equals(child.getTemplet())) {
                        id = child.getId();
                        break;
                    }
                }
            }
        }
        return SUCCESS;
    }

    public String search() {
        if (page == null) {
            page = 1;
        }
        return SUCCESS;
    }

    public String content() throws IOException {
        Article article = articleService.queryArticleById(id);
        article.setReadTime(article.getReadTime()==null?1:article.getReadTime()+1);
        articleService.updateSelective(article);
        if (article.getRedirect() != null && article.getRedirect() && article.getUrl() != null) {
            response.sendRedirect("http://"+article.getUrl());
            return null;
        }
        Category category = SiteCache.getCategoryMap().get(article.getCatId());
        // 文件
        if ("5".equals(category.getCategoryType())) {
            response.sendRedirect(request.getContextPath()+article.getDoc());
            return null;
        }
        // 为导航栏样式准备参数
        if(category.getParentId() > 0) {
            pid = category.getParentId();
            catid = category.getId();
        }else {
            pid = category.getId();
            List<Category> childs = categoryService.queryChilds(id);
            if (childs != null && childs.size() > 0) {
                catid = childs.get(0).getId();
            }
        }
        return SUCCESS;
    }

    public String topic() {
        if (id  == null) {
            List<Topic> topicList = topicService.queryTopic("month desc", 1, 1);
            if (topicList != null && topicList.size() > 0) {
                id = topicList.get(0).getId();
            }
        }
        Category category = SiteCache.getCategoryMap().get(catid);
        // 为导航栏样式准备参数
        if(category.getParentId() > 0) {
            pid = category.getParentId();
            catid = category.getId();
        }else {
            pid = category.getId();
            List<Category> childs = categoryService.queryChilds(id);
            if (childs != null && childs.size() > 0) {
                catid = childs.get(0).getId();
            }
        }
        return SUCCESS;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getCatid() {
        return catid;
    }

    public void setCatid(Integer catid) {
        this.catid = catid;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
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

    public TopicService getTopicService() {
        return topicService;
    }

    public void setTopicService(TopicService topicService) {
        this.topicService = topicService;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
