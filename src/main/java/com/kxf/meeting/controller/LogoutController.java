package com.kxf.meeting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LogoutController {

    /**
     * 退出用户
     *
     * @param request HttpServletRequest
     * @return 登录页面
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        //将session从页面中移除
        request.getSession().removeAttribute("currentUser");

        return "redirect:/";
    }
}
