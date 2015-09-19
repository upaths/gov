package cn.gov.freemarker.directive;

import cn.gov.freemarker.DataChecker;
import cn.gov.model.Article;
import cn.gov.service.ArticleService;
import freemarker.core.Environment;
import freemarker.template.*;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by 王勇 on 2015/9/9.
 */
public class ArticleListDirective implements TemplateDirectiveModel {

    private ArticleService articleService;
    private static final String CATEGORY_ID_NAME = "catid";
    private static final String POSITION_ID_NAME = "posid";
    private static final String SORT_NAME = "sort";
    private static final String PAGE_NUMBER_NAME = "page";
    private static final String PAGE_SIZE_NAME = "size";
    private static final String TITLE_NAME = "title";
    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        int catid = -1;
        int posid = -1;
        String sort = null;
        String title = null;
        int page = -1;
        int size = -1;
        Iterator paramIterator = params.entrySet().iterator();
        while (paramIterator.hasNext()) {
            Map.Entry ent = (Map.Entry) paramIterator.next();
            String paramName = (String) ent.getKey();
            TemplateModel paramValue = (TemplateModel)
                    ent.getValue();
            if (paramName.equals(CATEGORY_ID_NAME)) {
                catid = DataChecker.checkInt(paramValue, paramName);
            }else if (paramName.equals(POSITION_ID_NAME)) {
                posid = DataChecker.checkInt(paramValue, paramName);
            }else if (paramName.equals(PAGE_NUMBER_NAME)) {
                page = DataChecker.checkInt(paramValue, paramName);
            }else if (paramName.equals(PAGE_SIZE_NAME)) {
                size = DataChecker.checkInt(paramValue, paramName);
            }else if (paramName.equals(SORT_NAME)) {
                sort = paramValue.toString();
            }else if (paramName.equals(TITLE_NAME)) {
                title = paramValue.toString();
            } else {
                throw new TemplateModelException("不支持参数: " + paramName);
            }
        }
        if (page > 0 && size < 0) {
            throw new TemplateModelException("参数" + PAGE_NUMBER_NAME + "必须与" + PAGE_SIZE_NAME + "同时存在");
        }
        List<Article> list = null;
        int cnt = 0;
        list = articleService.queryDisplayArticle(catid, posid, title, sort, page, size);
        cnt = articleService.countDisplayArticle(catid, posid, title);
        // 执行真正指令的执行部分:
        if (body != null) {
            // 如果有循环变量，那么就设置它:
            if (loopVars.length > 0) {
                // 数据
                loopVars[0] = ObjectWrapper.DEFAULT_WRAPPER.wrap(list);
                if (loopVars.length > 1) {
                    // 当前页码
                    loopVars[1] = new SimpleNumber(page);
                }
                if (loopVars.length > 2) {
                    // 总页数
                    loopVars[2] = new SimpleNumber(cnt % size == 0 ? (cnt == 0 ? 1 : cnt / size) : cnt / size + 1);
                }
                if (loopVars.length > 3) {
                    // 总页数
                    loopVars[3] = new SimpleNumber(cnt);
                }
            }
            // 执行嵌入体部分（和 FTL 中的<#nested>一样）。
            // 这种情况下，我们不提供一个特殊的 writer 作为参数:
            body.render(env.getOut());
        }
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }
}
