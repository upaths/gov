package cn.gov.model;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 * Created by 王勇 on 2015/8/3.
 */
public class CategoryTree extends Category {
    public CategoryTree(Category category) {
        super();
        Field[] superFields = category.getClass().getDeclaredFields();
        if (superFields != null && superFields.length > 0) {
            for (Field superField : superFields) {
                try {
                    char[] cs = superField.getName().toCharArray();
                    cs[0] -= 32;
                    String MethodName = String.valueOf(cs);
                    Object value = category.getClass().getMethod("get" + MethodName, null).invoke(category, null);
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
    private List<CategoryTree> childs;

    public List<CategoryTree> getChilds() {
        return childs;
    }

    public void setChilds(List<CategoryTree> childs) {
        this.childs = childs;
    }
}
