package cn.gov.freemarker.directive;

import cn.gov.freemarker.DataChecker;
import cn.gov.model.Category;
import cn.gov.service.CategoryService;
import freemarker.core.Environment;
import freemarker.template.*;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by 王勇 on 2015/9/9.
 */
public class CategoryListDirective implements TemplateDirectiveModel {
    private CategoryService categoryService;
    private static final String PARENT_ID_NAME = "pid";
    private static final String PAGE_NUMBER_NAME = "page";
    private static final String PAGE_SIZE_NAME = "size";
    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        int pid = -1;
        int page = -1;
        int size = -1;
        Iterator paramIterator = params.entrySet().iterator();
        while (paramIterator.hasNext()) {
            Map.Entry ent = (Map.Entry) paramIterator.next();
            String paramName = (String) ent.getKey();
            TemplateModel paramValue = (TemplateModel)
                    ent.getValue();
            if (paramName.equals(PARENT_ID_NAME)) {
                pid = DataChecker.checkInt(paramValue, paramName);
            }else if (paramName.equals(PAGE_NUMBER_NAME)) {
                page = DataChecker.checkInt(paramValue, paramName);
            }else if (paramName.equals(PAGE_SIZE_NAME)) {
                size = DataChecker.checkInt(paramValue, paramName);
            } else {
                throw new TemplateModelException("不支持参数: " + paramName);
            }
        }

        if (pid < 0) {
            throw new TemplateModelException("参数" + PARENT_ID_NAME + "不能为空");
        }
        List<Category> categoryList = categoryService.queryDisplayCategoryByPid(pid, page, size);
        int cnt = categoryService.countDisplayCategoryByPid(pid);
        // 执行真正指令的执行部分:
        if (body != null) {
            if (loopVars.length > 0) {
                loopVars[0] = ObjectWrapper.DEFAULT_WRAPPER.wrap(categoryList);
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

    public CategoryService getCategoryService() {
        return categoryService;
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }
}
