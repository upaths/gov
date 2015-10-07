package cn.gov.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CheckReportLoginFilter implements Filter {

	public void destroy() {
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("report_user");
		String url = request.getServletPath();
		if (url.endsWith(".jsp") && !url.contains("/report/admin/index.jsp") && !url.contains("/report/admin/to_login.jsp") && (username == null || "".equals(username))) {
			response.sendRedirect(request.getContextPath()+"/report/admin/to_login.jsp");
		}else {
			chain.doFilter(arg0, arg1);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
