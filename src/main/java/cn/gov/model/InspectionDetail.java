package cn.gov.model;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;

/**
 * Created by 王勇 on 2015/9/20.
 */
public class InspectionDetail extends Inspection {
    private int report;
    public InspectionDetail(Inspection inspection) {
        super();
        Field[] superFields = inspection.getClass().getDeclaredFields();
        if (superFields != null && superFields.length > 0) {
            for (Field superField : superFields) {
                try {
                    char[] cs = superField.getName().toCharArray();
                    cs[0] -= 32;
                    String MethodName = String.valueOf(cs);
                    Object value = inspection.getClass().getMethod("get" + MethodName, null).invoke(inspection, null);
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

    public int getReport() {
        return report;
    }

    public void setReport(int report) {
        this.report = report;
    }
}
