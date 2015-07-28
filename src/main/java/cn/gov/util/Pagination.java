package cn.gov.util;

import org.apache.struts2.components.UIBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.util.ValueStack;

public class Pagination extends UIBean {
    protected static final String TEMPLATE = "pagination";
	private PageBean pageBean;
    private String url;
	public Pagination(ValueStack vs, HttpServletRequest request,
			HttpServletResponse response) {
		super(vs, request, response);
	}
	@Override
	protected String getDefaultTemplate() {
		return TEMPLATE;
	}

	@Override
	protected void evaluateExtraParams() {
		super.evaluateExtraParams();
		super.addParameter("pageBean", pageBean);
		super.addParameter("url", url);
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
