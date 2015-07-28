package cn.gov.action;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import cn.gov.model.Category;
import cn.gov.model.Config;
import cn.gov.model.Organization;
import cn.gov.service.CategoryService;
import cn.gov.service.ConfigService;
import cn.gov.service.OrganizationService;

public class TopAction extends BasicAction {
	private ConfigService configService;
	private CategoryService categoryService;
	private OrganizationService organizationService;
	private Map<Category, List<Category>> catMap;
	private List<Organization> orgList;
	private Config config;
	
	public String execute() {
		config = configService.queryConfig();
		catMap = new LinkedHashMap<Category, List<Category>>();
		List<Category> tmpList = categoryService.queryFirstLevel();
		if (tmpList != null && tmpList.size() > 0) {
			for (int i = 0; i < tmpList.size() && i < 8; i++) {
				Category c = tmpList.get(i);
				List<Category> childs = categoryService.queryChilds(c.getId());
				catMap.put(c, childs);
			}
		}
		orgList = organizationService.queryFirstLevel();
		return SUCCESS;
	}

	public ConfigService getConfigService() {
		return configService;
	}

	public void setConfigService(ConfigService configService) {
		this.configService = configService;
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public Config getConfig() {
		return config;
	}

	public void setConfig(Config config) {
		this.config = config;
	}

	public OrganizationService getOrganizationService() {
		return organizationService;
	}

	public void setOrganizationService(OrganizationService organizationService) {
		this.organizationService = organizationService;
	}

	public List<Organization> getOrgList() {
		return orgList;
	}

	public void setOrgList(List<Organization> orgList) {
		this.orgList = orgList;
	}

	public Map<Category, List<Category>> getCatMap() {
		return catMap;
	}

	public void setCatMap(Map<Category, List<Category>> catMap) {
		this.catMap = catMap;
	}
	
}
