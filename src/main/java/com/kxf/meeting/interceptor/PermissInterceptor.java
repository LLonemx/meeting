package com.kxf.meeting.interceptor;

import com.kxf.meeting.model.Employee;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 拦截器
 */
public class PermissInterceptor implements HandlerInterceptor {

    AntPathMatcher pathMatcher = new AntPathMatcher();

    /**
     * 默认页面、登陆相关页面、注册相关页面放行不拦截
     * role：1为普通用户  2为管理员
     * 获取session判断是否是管理员访问，管理员访问管理员相关页面就放行，普通用户访问管理员相关页面就拦截并输出forbidden
     * 用户没登录，去访问除了注册页面的任意页面都会跳回到登陆页面
     *
     * @param request
     * @param response
     * @param handler
     * @return true为放行 false拦截
     * @throws Exception
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        if ("/".equals(requestURI) || "/doLogin".equals(requestURI) || "/register".equals(requestURI)
                || "/doReg".equals(requestURI)) {
            return true;
        }

        HttpSession session = request.getSession(true);

        Employee currentUser = (Employee) session.getAttribute("currentUser");

        if (pathMatcher.match("/admin/**", requestURI)) {
            if (currentUser != null) {
                if (currentUser.getRole() == 2) {
                    return true;
                } else {
                    response.getWriter().write("forbidden");
                    return false;
                }
            }
        } else {
            if (currentUser != null) {
                return true;
            }
        }

        response.sendRedirect("/");

        return false;
    }
}
