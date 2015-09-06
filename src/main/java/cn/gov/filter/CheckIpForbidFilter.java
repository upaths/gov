package cn.gov.filter;

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
    private IpForbidService ipForbidService;
    private List<IpForbid> ipForbidList;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.updateIpForbidList();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        boolean flag = false;
        if (ipForbidList != null && ipForbidList.size() > 0) {
            String ip = IpUtil.getClientIp((HttpServletRequest)servletRequest);
            if (ip != null && !"".equals(ip)) {
                for (IpForbid ipForbid : ipForbidList) {
                    if (ip.equals(ipForbid.getIp())) {
                        flag = true;
                        break;
                    }
                }
            }
        }
        if (flag) {
            HttpServletResponse response = ((HttpServletResponse)servletResponse);
            response.sendError(403);
        }else {
            filterChain.doFilter(servletRequest, servletResponse);
        }

    }

    @Override
    public void destroy() {

    }

    public void updateIpForbidList() {
        // 线程安全
        ipForbidList = Collections.synchronizedList(ipForbidService.queryForbiddenIp());
    }

    public IpForbidService getIpForbidService() {
        return ipForbidService;
    }

    public void setIpForbidService(IpForbidService ipForbidService) {
        this.ipForbidService = ipForbidService;
    }
}
