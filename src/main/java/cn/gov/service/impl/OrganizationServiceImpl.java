package cn.gov.service.impl;

import java.util.List;

import cn.gov.dao.OrganizationMapper;
import cn.gov.model.Organization;
import cn.gov.model.OrganizationExample;
import cn.gov.service.OrganizationService;

public class OrganizationServiceImpl implements OrganizationService {
	private OrganizationMapper organizationMapper;
	
	public void insert(Organization organization) {
		organizationMapper.insert(organization);
	}

	public int update(Organization organization) {
		// updateByPrimaryKeySelective 只是更新新的model中不为空的字段
		// updateByPrimaryKey 会将为空的字段在数据库中置为NULL
		return organizationMapper.updateByPrimaryKeySelective(organization);
	}

	public List queryAll() {
		return organizationMapper.selectByExampleWithBLOBs(null);
	}
	
	public List<Organization> queryFirstLevel() {
		OrganizationExample organizationExample = new OrganizationExample();
		organizationExample.createCriteria().andParentIdIsNull();
		organizationExample.setOrderByClause("px");
		return organizationMapper.selectByExampleWithBLOBs(organizationExample);
	}

	public List<Organization> queryChilds(Integer parentId) {
		OrganizationExample organizationExample = new OrganizationExample();
		organizationExample.createCriteria().andParentIdEqualTo(parentId);
		organizationExample.setOrderByClause("px");
		return organizationMapper.selectByExampleWithBLOBs(organizationExample);
	}
	
	public int delete(Integer id) {
		return organizationMapper.deleteByPrimaryKey(id);
	}
	
	public int deleteChilds(Integer parentId) {
		OrganizationExample organizationExample = new OrganizationExample();
		organizationExample.createCriteria().andParentIdEqualTo(parentId);
		return organizationMapper.deleteByExample(organizationExample);
	}

	public Organization queryByPrimaryKey(Integer id) {
		return organizationMapper.selectByPrimaryKey(id);
	}

	public OrganizationMapper getOrganizationMapper() {
		return organizationMapper;
	}

	public void setOrganizationMapper(OrganizationMapper organizationMapper) {
		this.organizationMapper = organizationMapper;
	}

}
