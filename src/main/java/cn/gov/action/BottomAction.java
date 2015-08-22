package cn.gov.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cn.gov.model.Article;
import cn.gov.model.Category;
import cn.gov.model.Config;
import cn.gov.service.ArticleService;
import cn.gov.service.CategoryService;
import cn.gov.service.ConfigService;
import cn.gov.service.LinksService;
import cn.gov.util.AlertUtil;
import org.json.simple.JSONArray;

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
