package cn.gov.service;

import java.util.List;

import cn.gov.model.Organization;


public interface OrganizationService {
	public void insert(Organization organization);
	
	public int update(Organization organization);
	
	public List queryAll();
	
	public int delete(Integer id);
	
	public int deleteChilds(Integer parentId);
	
	public List<Organization> queryFirstLevel();
	
	public List<Organization> queryChilds(Integer parentId);
	
	public Organization queryByPrimaryKey(Integer id);
	
}