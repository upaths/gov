package cn.gov.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import cn.gov.util.PageBean;

import com.opensymphony.xwork2.ActionSupport;

public class BasicAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	private PageBean pageBean = new PageBean();//分页的javaBean
	
	protected String url;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}
	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	
}
