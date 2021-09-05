package com.kxf.meeting.controller;

import com.kxf.meeting.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 批准帐户
 * status=0为待批准
 * status=1为批准通过
 * status=2为批准未通过
 */
@Controller
@RequestMapping("/admin")
public class ApproveaccountController {

    @Autowired
    private EmployeeService employeeService;

    //待批准状态码为0
    public static final Integer PENDING_APPROVE = 0;

    /**
     * 获取所有待批准的用户
     *
     * @param model
     * @return 返回视图到approveaccount.ftl
     */
    @RequestMapping("/approveaccount")
    public String approveaccount(Model model) {
        model.addAttribute("emps", employeeService.getAllEmpsByStatus(PENDING_APPROVE));

        return "approveaccount";
    }

    /**
     * 更新用户状态(status)
     *
     * @param employeeid 员工ID
     * @param status     更新的状态
     * @return 重定向到 取所有待批准的用户 页面
     */
    @RequestMapping("/updatestatus")
    public String updatestatus(Integer employeeid, Integer status) {
        Integer result = employeeService.updatestatus(employeeid, status);

        return "redirect:/admin/approveaccount";
    }
}
