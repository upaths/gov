package cn.gov.freemarker;

import cn.gov.cache.SiteCache;
import cn.gov.model.Category;
import com.opensymphony.xwork2.ActionInvocation;
import freemarker.template.TemplateException;
import org.apache.struts2.views.freemarker.FreemarkerResult;

import java.io.IOException;

/**
 * Created by 王勇 on 2015/9/12.
 */
public class ListFreemarkerResult extends FreemarkerResult {
    @Override
    public void doExecute(String location, ActionInvocation invocation) throws IOException, TemplateException {
        Integer id = (Integer)invocation.getInvocationContext().getValueStack().findValue("id");
        Category category = SiteCache.getCategoryMap().get(id);
        super.doExecute(category.getTemplet(), invocation);
    }
}
