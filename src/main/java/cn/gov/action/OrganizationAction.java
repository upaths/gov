package cn.gov.action;

import java.util.List;

import cn.gov.model.Organization;
import cn.gov.service.OrganizationService;
import cn.gov.util.AlertUtil;


public class OrganizationAction extends BasicAction {
	private Integer parentId;
	private Organization organization;
	private List list;
	private OrganizationService organizationService;
	private Integer id;
	
	public String toAdd() {
		list = organizationService.queryFirstLevel();
		return "toAdd";
	}
	
	public String toUpdate() {
		list = organizationService.queryFirstLevel();
		organization = organizationService.queryByPrimaryKey(organization.getId());
		return "toUpdate";
	}
	
	public String insert() {
		organizationService.insert(organization);
		AlertUtil.alertThenGo(response, "添加成功！", "organization_query.action");
		return null;
	}

	public String update() {
		organizationService.update(organization);
		AlertUtil.alertThenGo(response, "更新成功！", "organization_query.action");
		return null;
	}
	
	public String delete() {
		organizationService.delete(organization.getId());
		organizationService.deleteChilds(organization.getId());
		AlertUtil.alertThenGo(response, "删除成功！", "organization_query.action");
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public String query() {
		list = organizationService.queryFirstLevel();
		for (int i = 0; i < list.size();) {
			Organization o = (Organization)list.get(i);
			List tmp = organizationService.queryChilds(o.getId());
			if (tmp != null && tmp.size() > 0) {
				list.addAll(i + 1, tmp);
				i += tmp.size();
			}
			i++;
		}
		return "query";
	}
	
	public String showOrg() {
		if (id == null) {
			list = organizationService.queryFirstLevel();
			if (list != null && list.size() > 0) {
				organization = (Organization)list.get(0);
			}
		}else {
			organization = organizationService.queryByPrimaryKey(id);
			list = organizationService.queryChilds(id);
			if (list == null || list.size() <= 0) {
				if (organization.getParentId() == null) {
					list = organizationService.queryFirstLevel();
				}else {
					list = organizationService.queryChilds(organization.getParentId());
				}
			}
		}
		return SUCCESS;
	}
	
	public OrganizationService getOrganizationService() {
		return organizationService;
	}

	public void setOrganizationService(OrganizationService organizationService) {
		this.organizationService = organizationService;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}
