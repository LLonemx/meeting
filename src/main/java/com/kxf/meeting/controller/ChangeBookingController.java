package com.kxf.meeting.controller;

import com.kxf.meeting.model.Employee;
import com.kxf.meeting.model.Meeting;
import com.kxf.meeting.model.MeetingDTO;
import com.kxf.meeting.service.EmployeeService;
import com.kxf.meeting.service.MeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ChangeBookingController {

    @Autowired
    private MeetingService meetingService;

    @Autowired
    private EmployeeService employeeService;

    /**
     * 返回我的预订页面
     *
     * @param httpSession HttpSession
     * @param model       Model
     * @return mybookings
     */
    @RequestMapping("/mybookings")
    public String mybookings(HttpSession httpSession, Model model) {
        Employee currentUser = (Employee) httpSession.getAttribute("currentUser");
        Integer employeeid = currentUser.getEmployeeId();
        List<MeetingDTO> list = meetingService.getmeetingofmybookCanCancle(employeeid);

        model.addAttribute("mlist", list);

        return "mybookings";
    }

    /**
     * 预订会议里的详情页面
     *
     * @param meetingid Integer
     * @param model     Model
     * @return mymeetingdetails页面
     */
    @RequestMapping("/mymeetingdetails")
    public String meetingdetails(Integer meetingid, Model model) {
        Meeting meeting = meetingService.getmeetingByid(meetingid);
        model.addAttribute("meeting", meeting);
        List<Employee> listEmployee = employeeService.getEmpsByid(meetingid);
        model.addAttribute("ems", listEmployee);
        return "mymeetingdetails";
    }

    /**
     * 撤销会议页面
     *
     * @param meetingid   Integer
     * @param meetingname String
     * @param model       Model
     * @return cancelmeeting页面
     */
    @GetMapping("/cancelmeeting")
    public String cancelmeeting(@RequestParam(name = "meetingid") Integer meetingid,
                                @RequestParam(name = "meetingname") String meetingname, Model model) {
        model.addAttribute("meetingid", meetingid);
        model.addAttribute("meetingname", meetingname);

        return "cancelmeeting";
    }

    /**
     * 撤销会议的操作
     *
     * @param meetingid      会议id
     * @param canceledreason 撤销原因
     * @return 请求转发到mybookings页面
     */
    @PostMapping("/dpCancel")
    public String doCancel(Integer meetingid, String canceledreason) {
        meetingService.cancelmeeting(meetingid, canceledreason);

        return "forward:mybookings";
    }
}
