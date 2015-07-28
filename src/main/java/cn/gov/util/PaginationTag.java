package cn.gov.util;

import org.apache.struts2.views.jsp.ui.AbstractUITag;
import org.apache.struts2.components.Component;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.util.ValueStack;

public class PaginationTag extends AbstractUITag {
    private PageBean pageBean;
    private String url;

    public Component getBean(ValueStack arg0, HttpServletRequest arg1, HttpServletResponse arg2) {
        return new Pagination(arg0, arg1, arg2);
    }

    protected void populateParams() {
        super.populateParams();
        Pagination table = (Pagination) component;
        table.setPageBean(pageBean);
        table.setUrl(url);
    }

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
