package cn.gov.freemarker.directive;

import cn.gov.freemarker.DataChecker;
import cn.gov.model.Message;
import cn.gov.model.MessageReply;
import cn.gov.service.MessageService;
import freemarker.core.Environment;
import freemarker.template.*;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by 王勇 on 2015/9/9.
 */
public class MessageReplyListDirective implements TemplateDirectiveModel {
    private MessageService messageService;
    private static final String MESSAGE_ID = "msgId";
    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        Integer msgId = null;
        Iterator paramIterator = params.entrySet().iterator();
        while (paramIterator.hasNext()) {
            Map.Entry ent = (Map.Entry) paramIterator.next();
            String paramName = (String) ent.getKey();
            TemplateModel paramValue = (TemplateModel)
                    ent.getValue();
            if (paramName.equals(MESSAGE_ID)) {
                msgId = DataChecker.checkInt(paramValue, paramName);
            } else {
                throw new TemplateModelException("不支持参数: " + paramName);
            }
        }
        List<MessageReply> msgReplyList = messageService.queryMsgReply(msgId);
        int cnt = messageService.countDisplayMessage();
        // 执行真正指令的执行部分:
        if (body != null) {
            // 如果有循环变量，那么就设置它:
            if (loopVars.length > 0) {
                // 数据
                loopVars[0] = ObjectWrapper.DEFAULT_WRAPPER.wrap(msgReplyList);
            }
            // 执行嵌入体部分（和 FTL 中的<#nested>一样）。
            // 这种情况下，我们不提供一个特殊的 writer 作为参数:
            body.render(env.getOut());
        }
    }

    public MessageService getMessageService() {
        return messageService;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }
}
