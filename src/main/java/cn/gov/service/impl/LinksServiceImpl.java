package cn.gov.service.impl;

import java.util.List;

import cn.gov.dao.LinksMapper;
import cn.gov.model.Links;
import cn.gov.model.LinksExample;
import cn.gov.service.LinksService;

public class LinksServiceImpl implements LinksService {
	private LinksExample linksExample;
	private LinksMapper linksMapper;
	public void insert(Links links) {
		linksMapper.insert(links);
	}

	public int update(Links links) {
		return linksMapper.updateByPrimaryKey(links);
	}

	public int delete(Integer id) {
		return linksMapper.deleteByPrimaryKey(id);
	}

	public List query() {
		linksExample.clear();
		linksExample.setOrderByClause("px");
		return linksMapper.selectByExample(linksExample);
	}

	public int queryCount() {
		linksExample.clear();
		return linksMapper.countByExample(linksExample);
	}

	public LinksExample getLinksExample() {
		return linksExample;
	}

	public void setLinksExample(LinksExample linksExample) {
		this.linksExample = linksExample;
	}

	public LinksMapper getLinksMapper() {
		return linksMapper;
	}

	public void setLinksMapper(LinksMapper linksMapper) {
		this.linksMapper = linksMapper;
	}
	
}
