package com.kxf.meeting.controller;

import com.kxf.meeting.model.BaseModel;
import com.kxf.meeting.model.Department;
import com.kxf.meeting.model.Employee;
import com.kxf.meeting.model.Meeting;
import com.kxf.meeting.service.DepartmentService;
import com.kxf.meeting.service.EmployeeService;
import com.kxf.meeting.service.MeetingService;
import com.kxf.meeting.util.GsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 登录
 */
@Controller
public class LoginController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private MeetingService meetingService;
    //登陆页面
    @RequestMapping("/")
    public String login() {
        return "login";
    }

    /**
     * 判断登录信息
     *
     * @param username    用户名
     * @param password    密码
     * @param model
     * @param httpSession 会话，用来保存用户登录信息
     * @return 登录成功到通知页面  登录失败不跳转呆在登陆页面
     */
    @ResponseBody
    @RequestMapping(value = "/doLogin", method = RequestMethod.GET)
    public String doLogin(String username, String password, Model model, HttpSession httpSession) {
        BaseModel baseModel=new BaseModel();
        Employee employee = employeeService.doLogin(username, password);
        if (employee == null) {
            baseModel.setCode(201);
            baseModel.setMessage("账号密码错误，请重新输入");
            return GsonUtil.GsonString(baseModel);
        } else {
            if (employee.getStatus() == 0) {
                baseModel.setCode(201);
                baseModel.setMessage("审核未通过，登陆失败");
                return GsonUtil.GsonString(baseModel);
            } else if (employee.getStatus() == 2) {
                baseModel.setCode(201);
                baseModel.setMessage("登陆失败");
                return GsonUtil.GsonString(baseModel);
            } else {
                employee.setCode(200);
                return GsonUtil.GsonString(employee);
            }
        }
    }

    /**
     * 注册
     *
     * @param model
     * @return 返回register页面
     */
    @RequestMapping("/register")
    public String register(Model model) {
        List<Department> deps = departmentService.getAllDeps();
        model.addAttribute("deps", deps);
        return "register";
    }

    /**
     * 判断注册信息
     * @param employee 用户注册的信息
     * @param model
     * @return 成功返回到登录页面   失败数据回填，继续呆在注册页面
     */
    @RequestMapping("/doReg")
    public String doReg(Employee employee, Model model) {
        Integer result = employeeService.doReg(employee);
        if (result == 1) {
            return "redirect:/";
        } else {
            model.addAttribute("error", "注册失败");
            model.addAttribute("employee", employee);
            return "forward:/register";
        }
    }
    @ResponseBody
    @RequestMapping(value = "/getmeetingdetails",method = RequestMethod.GET)
    public String getmeetingdetails(String meetingname){
        Meeting meeting=meetingService.getmeetingByname(meetingname);
        return GsonUtil.GsonString(meeting);
    }
}
