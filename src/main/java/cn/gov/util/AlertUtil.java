package cn.gov.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;


public class AlertUtil {
	/**
	 * 提示操作是否成功，并跳转到指定页面
	 */
	public static void alertThenGo(HttpServletResponse response, String msg, String url) {
		try {
			response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter outjs = response.getWriter();
			if (msg != null && msg.length() > 0) {
				outjs.print("<script>alert('"+msg+"!');</script>");
			}
			outjs.print("<script>window.location.href='"+url+"';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
