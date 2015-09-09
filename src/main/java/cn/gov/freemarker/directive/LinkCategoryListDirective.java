package cn.gov.freemarker.directive;

import cn.gov.model.LinkCategory;
import cn.gov.service.LinkCategoryService;
import freemarker.core.Environment;
import freemarker.template.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by 王勇 on 2015/9/9.
 */
public class LinkCategoryListDirective implements TemplateDirectiveModel {
    private LinkCategoryService linkCategoryService;
    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        List<LinkCategory> linkCategoryList = linkCategoryService.queryLinkCategory();
        // 执行真正指令的执行部分:
        if (body != null) {
            if (loopVars.length > 0) {
                loopVars[0] = ObjectWrapper.DEFAULT_WRAPPER.wrap(linkCategoryList);
            }
            // 执行嵌入体部分（和 FTL 中的<#nested>一样）。
            // 这种情况下，我们不提供一个特殊的 writer 作为参数:
            body.render(env.getOut());
        }
    }

    public LinkCategoryService getLinkCategoryService() {
        return linkCategoryService;
    }

    public void setLinkCategoryService(LinkCategoryService linkCategoryService) {
        this.linkCategoryService = linkCategoryService;
    }
}
