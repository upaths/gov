package cn.gov.service.impl;

import java.util.List;

import cn.gov.cache.SiteCache;
import cn.gov.dao.ConfigMapper;
import cn.gov.model.Config;
import cn.gov.model.ConfigExample;
import cn.gov.service.ConfigService;

public class ConfigServiceImpl implements ConfigService {
	private ConfigMapper configMapper;
	public void initCache() {
		SiteCache.updateConfigCache(this.queryConfig());
	}
	public boolean isExist() {
		ConfigExample configExample = new ConfigExample();
		return configMapper.countByExample(configExample) > 0;
	}

	public Config queryConfig() {
		List list = configMapper.selectByExample(null);
		return  list!= null && list.size() > 0 ? (Config)list.get(0) : null;
	}

	public void updateConifg(Config config) {
		if (isExist()) {
			configMapper.updateByExample(config, new ConfigExample());
		}else {
			configMapper.insert(config);
		}
		// 更新缓存
		SiteCache.updateConfigCache(this.queryConfig());
	}

	public ConfigMapper getConfigMapper() {
		return configMapper;
	}

	public void setConfigMapper(ConfigMapper configMapper) {
		this.configMapper = configMapper;
	}

}
