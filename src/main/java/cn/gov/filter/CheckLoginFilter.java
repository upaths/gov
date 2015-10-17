package cn.gov.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckLoginFilter implements Filter {

	public void destroy() {
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("user");
		String url = request.getServletPath();
		if (url.endsWith(".jsp") && (username == null || "".equals(username))) {
			response.sendRedirect(request.getContextPath()+"/fail.html");
		}else {
			chain.doFilter(arg0, arg1);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
