package cn.gov.action;

import java.util.List;

import cn.gov.model.Config;
import cn.gov.service.ConfigService;
import cn.gov.service.LinksService;

public class BottomAction extends BasicAction {
	private LinksService linksService;
	private ConfigService configService;
	private List list;
	private Config config;
	
	public String execute() {
		list = linksService.query();
		config = configService.queryConfig();
		return SUCCESS;
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

	public ConfigService getConfigService() {
		return configService;
	}

	public void setConfigService(ConfigService configService) {
		this.configService = configService;
	}

	public Config getConfig() {
		return config;
	}

	public void setConfig(Config config) {
		this.config = config;
	}
	
}
