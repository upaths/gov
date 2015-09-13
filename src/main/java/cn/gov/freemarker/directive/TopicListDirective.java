package cn.gov.freemarker.directive;

import cn.gov.freemarker.DataChecker;
import cn.gov.model.Topic;
import cn.gov.service.TopicService;
import freemarker.core.Environment;
import freemarker.template.*;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by 王勇 on 2015/9/9.
 */
public class TopicListDirective implements TemplateDirectiveModel {
    private TopicService topicService;
    private static final String SORT_NAME = "sort";
    private static final String PAGE_NUMBER_NAME = "page";
    private static final String PAGE_SIZE_NAME = "size";
    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        String sort = null;
        int page = -1;
        int size = -1;
        Iterator paramIterator = params.entrySet().iterator();
        while (paramIterator.hasNext()) {
            Map.Entry ent = (Map.Entry) paramIterator.next();
            String paramName = (String) ent.getKey();
            TemplateModel paramValue = (TemplateModel)
                    ent.getValue();
            if (paramName.equals(PAGE_NUMBER_NAME)) {
                page = DataChecker.checkInt(paramValue, paramName);
            }else if (paramName.equals(PAGE_SIZE_NAME)) {
                size = DataChecker.checkInt(paramValue, paramName);
            }else if (paramName.equals(SORT_NAME)) {
                sort = paramValue.toString();
            } else {
                throw new TemplateModelException("不支持参数: " + paramName);
            }
        }
        if (page > 0 && size < 0) {
            throw new TemplateModelException("参数" + PAGE_NUMBER_NAME + "必须与" + PAGE_SIZE_NAME + "同时存在");
        }
        List<Topic> topicList = topicService.queryTopic(sort, page, size);
        int cnt = topicService.countTopic();
        // 执行真正指令的执行部分:
        if (body != null) {
            // 如果有循环变量，那么就设置它:
            if (loopVars.length > 0) {
                // 数据
                loopVars[0] = ObjectWrapper.DEFAULT_WRAPPER.wrap(topicList);
                if (loopVars.length > 1) {
                    // 当前页码
                    loopVars[1] = new SimpleNumber(page);
                }
                if (loopVars.length > 2) {
                    // 总页数
                    loopVars[2] = new SimpleNumber(cnt % size == 0 ? (cnt == 0 ? 1 : cnt / size) : cnt / size + 1);
                }
            }
            // 执行嵌入体部分（和 FTL 中的<#nested>一样）。
            // 这种情况下，我们不提供一个特殊的 writer 作为参数:
            body.render(env.getOut());
        }
    }

    public TopicService getTopicService() {
        return topicService;
    }

    public void setTopicService(TopicService topicService) {
        this.topicService = topicService;
    }
}
