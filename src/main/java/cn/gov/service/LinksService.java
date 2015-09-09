package cn.gov.service;

import java.util.List;

import cn.gov.model.Links;

public interface LinksService {
	
	public void insert(Links Links);

	public int update(Links Links);

	public int delete(Integer id);

	public List query();
	
	public int queryCount();

	public List<Links> queryLinksByCatid(Integer catid);
}
