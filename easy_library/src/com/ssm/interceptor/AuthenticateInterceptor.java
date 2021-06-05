package com.ssm.interceptor;

import com.ssm.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author: Luoxi
 * @Time: 2021-06-01 (星期二)
 * @Project: easy_library
 * @Package: com.ssm.interceptor
 * @Version: JDK15
 * @Description:
 */
public class AuthenticateInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String uri = httpServletRequest.getRequestURI();
        User user = (User) httpServletRequest.getSession().getAttribute("login");

        // 对用户或管理员开放不同权限
        if (uri.contains("listUserBooks") || uri.contains("borrowBook") || uri.contains("returnBook")){
            if (user.getPermission() == 2){
                return true;
            }
        } else {
            if (user.getPermission() == 1){
                return true;
            }
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
