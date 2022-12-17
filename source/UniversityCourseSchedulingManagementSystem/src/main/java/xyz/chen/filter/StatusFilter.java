package xyz.chen.filter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import xyz.chen.service.StatusInfoService;

import javax.servlet.*;
import java.io.IOException;

/**
 * @author Rw-chen
 * @version 0.1
 */

@Configuration("statusFilter")
public class StatusFilter implements Filter {

    @Autowired
    private StatusInfoService statusInfoService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    //
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("------进入过滤器--------:" + this.getClass());
        servletRequest.setAttribute("list", statusInfoService.getAllStatusInfo()); // 将查到的信息保存到request
        // 请求向下传递
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
