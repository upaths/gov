package cn.gov.action;

import cn.gov.model.Config;
import cn.gov.service.ConfigService;
import cn.gov.util.AlertUtil;

public class ConfigAction extends BasicAction {
	
	private ConfigService configService;
	
	private Config config;
	
	private String msg;
	
	public String query() {
		config = configService.queryConfig();
		return SUCCESS;
	}
	public String upt() {
		configService.updateConifg(config);
		AlertUtil.alertThenGo(response, "操作成功！", "config_query.action");
		return null;
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
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
