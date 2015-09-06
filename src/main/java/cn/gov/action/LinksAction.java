package cn.gov.action;

import java.util.List;

import cn.gov.model.LinkCategory;
import cn.gov.model.Links;
import cn.gov.service.LinkCategoryService;
import cn.gov.service.LinksService;
import cn.gov.util.AlertUtil;

public class LinksAction extends BasicAction {
	private Links links;
	private LinksService linksService;
	private List list;
	private int sort;
	private LinkCategoryService linkCategoryService;
	private List<LinkCategory> linkCategoryList;

	public String query() {
		list = linksService.query();
		sort = linksService.queryCount() + 1;
		linkCategoryList = linkCategoryService.queryLinkCategory();
		return "query";
	}
	
	public String insert() {
		linksService.insert(links);
		AlertUtil.alertThenGo(response, "添加成功！", "links_query.action");
		return null;
	}

	public String update() {
		linksService.update(links);
		AlertUtil.alertThenGo(response, "更新成功！", "links_query.action");
		return null;
	}
	
	public String delete() {
		linksService.delete(links.getId());
		AlertUtil.alertThenGo(response, "删除成功！", "links_query.action");
		return null;
	}

	public Links getLinks() {
		return links;
	}

	public void setLinks(Links links) {
		this.links = links;
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

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public LinkCategoryService getLinkCategoryService() {
		return linkCategoryService;
	}

	public void setLinkCategoryService(LinkCategoryService linkCategoryService) {
		this.linkCategoryService = linkCategoryService;
	}

	public List<LinkCategory> getLinkCategoryList() {
		return linkCategoryList;
	}

	public void setLinkCategoryList(List<LinkCategory> linkCategoryList) {
		this.linkCategoryList = linkCategoryList;
	}
}
