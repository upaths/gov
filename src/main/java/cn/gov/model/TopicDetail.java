package cn.gov.model;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;

/**
 * Created by 王勇 on 2015/9/8.
 */
public class TopicDetail extends Topic {
    private int unchecked;
    private int checked;
    public TopicDetail(Topic topic) {
        super();
        Field[] superFields = topic.getClass().getDeclaredFields();
        if (superFields != null && superFields.length > 0) {
            for (Field superField : superFields) {
                try {
                    char[] cs = superField.getName().toCharArray();
                    cs[0] -= 32;
                    String MethodName = String.valueOf(cs);
                    Object value = topic.getClass().getMethod("get" + MethodName, null).invoke(topic, null);
                    this.getClass().getMethod("set" + MethodName, superField.getType()).invoke(this, value);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public int getUnchecked() {
        return unchecked;
    }

    public void setUnchecked(int unchecked) {
        this.unchecked = unchecked;
    }

    public int getChecked() {
        return checked;
    }

    public void setChecked(int checked) {
        this.checked = checked;
    }
}
