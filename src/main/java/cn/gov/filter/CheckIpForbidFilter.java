package cn.gov.filter;

import cn.gov.cache.SiteCache;
import cn.gov.model.IpForbid;
import cn.gov.service.IpForbidService;
import cn.gov.util.IpUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

/**
 * Created by 王勇 on 2015/9/1.
 */
public class CheckIpForbidFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        String ip = IpUtil.getClientIp((HttpServletRequest)servletRequest);
        if (SiteCache.getIpForbidMap().get(ip) != null) {
            HttpServletResponse response = ((HttpServletResponse)servletResponse);
            response.sendError(403);
        }else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
