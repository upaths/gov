package cn.gov.action;

import java.util.List;

import cn.gov.model.Links;
import cn.gov.service.LinksService;
import cn.gov.util.AlertUtil;

public class LinksAction extends BasicAction {
	private Links links;
	private LinksService linksService;
	private List list;
	private int px;

	public String query() {
		list = linksService.query();
		px = linksService.queryCount() + 1;
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

	public int getPx() {
		return px;
	}

	public void setPx(int px) {
		this.px = px;
	}
	
}
