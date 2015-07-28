package cn.gov.service.impl;

import java.util.List;

import cn.gov.dao.ConfigMapper;
import cn.gov.model.Config;
import cn.gov.model.ConfigExample;
import cn.gov.service.ConfigService;

public class ConfigServiceImpl implements ConfigService {
	private ConfigMapper configMapper;
	private ConfigExample configExample;
	public boolean isExist() {
		configExample.clear();
		return configMapper.countByExample(configExample) > 0;
	}

	public Config queryConfig() {
		configExample.clear();
		List list = configMapper.selectByExample(configExample);
		return  list!= null && list.size() > 0 ? (Config)list.get(0) : null;
	}

	public void updateConifg(Config config) {
		if (isExist()) {
			configExample.clear();
			configMapper.updateByExample(config, configExample);
		}else {
			configMapper.insert(config);
		}
	}

	public ConfigMapper getConfigMapper() {
		return configMapper;
	}

	public void setConfigMapper(ConfigMapper configMapper) {
		this.configMapper = configMapper;
	}

	public ConfigExample getConfigExample() {
		return configExample;
	}

	public void setConfigExample(ConfigExample configExample) {
		this.configExample = configExample;
	}
	
}
