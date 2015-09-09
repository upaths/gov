package cn.gov.freemarker;

import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateNumberModel;

/**
 * Created by 王勇 on 2015/9/9.
 */
public class DataChecker {
    public static int checkInt(TemplateModel paramValue, String paramName) throws TemplateException {
        if (!(paramValue instanceof TemplateNumberModel)) {
            throw new TemplateModelException("参数 \"" + paramName + "\" 必须为数字.");
        }
        int result = ((TemplateNumberModel) paramValue).getAsNumber().intValue();
        if (result <= 0) {
            throw new TemplateModelException("参数 \"" + paramName + "\" 必须大于0.");
        }
        return result;
    }
}
