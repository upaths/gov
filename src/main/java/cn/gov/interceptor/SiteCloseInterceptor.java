package cn.gov.interceptor;

import cn.gov.cache.SiteCache;
import cn.gov.model.Config;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * Created by 王勇 on 2015/9/13.
 */
public class SiteCloseInterceptor extends AbstractInterceptor {
    @Override
    public String intercept(ActionInvocation ai) throws Exception {
        Config config = SiteCache.getConfig();
        if (config != null && config.getToggle() != null && config.getToggle() == true) {
            return "close";
        }else {
            return ai.invoke();
        }
    }
}
