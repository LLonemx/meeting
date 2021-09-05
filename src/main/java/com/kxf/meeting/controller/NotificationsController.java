package com.kxf.meeting.controller;

import com.kxf.meeting.model.Employee;
import com.kxf.meeting.service.MeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

/**
 * 通知页面
 */
@Controller
public class NotificationsController {

    @Autowired
    private MeetingService meetingService;

    /**
     * 返回到通知页面并把参加的会议列出来
     *
     * @return 返回到通知页面
     */
    @GetMapping("/notifications")
    public String notifications(Model model, HttpSession session) {
        Employee currentUser = (Employee) session.getAttribute("currentUser");
        Integer employeeid = currentUser.getEmployeeId();
        model.addAttribute("ms", meetingService.getSevenDayMeeting(employeeid));
        model.addAttribute("cms", meetingService.getCancelMeeting());
        return "notifications";
    }
}
