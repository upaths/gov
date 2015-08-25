package cn.gov.freemarker.directive;

import cn.gov.model.Article;
import cn.gov.service.ArticleService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.Writer;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by 王勇 on 2015/8/25.
 */
public class ArticleDirective implements TemplateDirectiveModel {
    private ArticleService articleService;
    private static final String CATEGORY_ID_NAME = "catid";
    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        int catid = -1;
        Iterator paramIter = params.entrySet().iterator();
        while (paramIter.hasNext()) {
            Map.Entry ent = (Map.Entry) paramIter.next();
            String paramName = (String) ent.getKey();
            TemplateModel paramValue = (TemplateModel)
                    ent.getValue();
            if (paramName.equals(CATEGORY_ID_NAME)) {
                if (!(paramValue instanceof TemplateNumberModel)) {
                    throw new TemplateModelException("The \"" +
                            CATEGORY_ID_NAME + "\" parameter " +
                            "must be a number.");
                }
                catid = ((TemplateNumberModel) paramValue)
                        .getAsNumber().intValue();
                if (catid < 0) {
                    throw new TemplateModelException("The \"" +
                            CATEGORY_ID_NAME + "\" parameter " +
                            "can't be negative.");
                }
            } else {
                throw new TemplateModelException(
                        "Unsupported parameter: " + paramName);
            }
        }
        List<Article> list = articleService.queryArticlesByCategoryId(catid);
        // 执行真正指令的执行部分:
        Writer out = env.getOut();
        if (body != null) {
            for (int i = 0; i < list.size(); i++) {
                Article article = list.get(i);
                // 如果有循环变量，那么就设置它:
                if (loopVars.length > 0) {
                    loopVars[0] = ObjectWrapper.DEFAULT_WRAPPER.wrap(article);
                }
                // 执行嵌入体部分（和 FTL 中的<#nested>一样）。
                // 这种情况下，我们不提供一个特殊的 writer 作为参数:
                body.render(env.getOut());
            }
        }
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }
}
