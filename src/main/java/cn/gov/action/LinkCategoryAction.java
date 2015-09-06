package cn.gov.action;

import cn.gov.model.LinkCategory;
import cn.gov.service.LinkCategoryService;
import cn.gov.util.AlertUtil;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/1.
 */
public class LinkCategoryAction extends BasicAction {

    private List<LinkCategory> list;
    private LinkCategory linkCategory;
    private Integer id;
    private LinkCategoryService linkCategoryService;


    public String query() {
        list = linkCategoryService.queryLinkCategory();
        return "query";
    }

    public String insert() {
        linkCategoryService.insertLinkCategory(linkCategory);
        AlertUtil.alertThenGo(response, "添加成功！", "link_cat_query.action");
        return null;
    }

    public String update() {
        linkCategoryService.updateLinkCategory(linkCategory);
        AlertUtil.alertThenGo(response, "更新成功！", "link_cat_query.action");
        return null;
    }

    public String delete() {
        linkCategoryService.deleteLinkCategory(id);
        AlertUtil.alertThenGo(response, "删除成功！", "link_cat_query.action");
        return null;
    }

    public List<LinkCategory> getList() {
        return list;
    }

    public void setList(List<LinkCategory> list) {
        this.list = list;
    }

    public LinkCategory getLinkCategory() {
        return linkCategory;
    }

    public void setLinkCategory(LinkCategory linkCategory) {
        this.linkCategory = linkCategory;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LinkCategoryService getLinkCategoryService() {
        return linkCategoryService;
    }

    public void setLinkCategoryService(LinkCategoryService linkCategoryService) {
        this.linkCategoryService = linkCategoryService;
    }
}
