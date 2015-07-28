package cn.gov.service;

import cn.gov.model.Config;

public interface ConfigService {
	public boolean isExist();
	
	public Config queryConfig();
	
	public void updateConifg(Config config);
}
