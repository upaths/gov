package cn.gov.service.impl;

import java.util.List;

import cn.gov.cache.SiteCache;
import cn.gov.dao.LinksMapper;
import cn.gov.model.Links;
import cn.gov.model.LinksExample;
import cn.gov.service.LinkCategoryService;
import cn.gov.service.LinksService;

public class LinksServiceImpl implements LinksService {
	private LinksMapper linksMapper;
	private LinkCategoryService linkCategoryService;
	public void initCache() {
		SiteCache.updateLinkListCache(linkCategoryService.queryLinkCategory(), this.query());
	}
	public void insert(Links links) {
		linksMapper.insert(links);
		// 更新缓存
		SiteCache.updateLinkListCache(linkCategoryService.queryLinkCategory(), this.query());
	}

	public int update(Links links) {
		int cnt = linksMapper.updateByPrimaryKey(links);
		// 更新缓存
		SiteCache.updateLinkListCache(linkCategoryService.queryLinkCategory(), this.query());
		return cnt;
	}

	public int delete(Integer id) {
		int cnt = linksMapper.deleteByPrimaryKey(id);
		// 更新缓存
		SiteCache.updateLinkListCache(linkCategoryService.queryLinkCategory(), this.query());
		return cnt;
	}

	public List query() {
		LinksExample linksExample = new LinksExample();
		linksExample.setOrderByClause("sort");
		return linksMapper.selectByExample(linksExample);
	}

	public int queryCount() {
		return linksMapper.countByExample(null);
	}

	@Override
	public List<Links> queryLinksByCatid(Integer catid) {
		LinksExample linksExample = new LinksExample();
		linksExample.createCriteria().andCatIdEqualTo(catid);
		linksExample.setOrderByClause("sort");
		return linksMapper.selectByExample(linksExample);
	}

	public LinksMapper getLinksMapper() {
		return linksMapper;
	}

	public void setLinksMapper(LinksMapper linksMapper) {
		this.linksMapper = linksMapper;
	}

	public LinkCategoryService getLinkCategoryService() {
		return linkCategoryService;
	}

	public void setLinkCategoryService(LinkCategoryService linkCategoryService) {
		this.linkCategoryService = linkCategoryService;
	}
}
