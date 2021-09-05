package com.kxf.meeting.service;

import com.kxf.meeting.mapper.EmployeeMapper;
import com.kxf.meeting.mapper.MeetingParticipantsMapper;
import com.kxf.meeting.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Autowired
    private MeetingParticipantsMapper meetingparticipantsMapper;

    /**
     * 登录
     * 先通过登录的用户名查询用户，判断用户是否存在，不存在则返回null
     * 或者判断用户输入的密码和查询出的密码是否一致，不一致则返回null
     * 其他情况返回员工信息
     *
     * @param username 用户名
     * @param password 密码
     * @return 员工
     */
    public Employee doLogin(String username, String password) {
        Employee employee = employeeMapper.loadEmpByUsername(username);
        if (employee == null || !employee.getPassword().equals(password)) {
            return null;
        }
        return employee;
    }

    /**
     * 做注册
     * 先通过注册的用户名查询用户，判断用户是否存在，存在则返回-1
     * 不存在则把用户设为普通用户并且把status设置为未审批
     * 然后注册
     *
     * @param employee 员工
     * @return Integer
     */
    public Integer doReg(Employee employee) {
        Employee emp = employeeMapper.loadEmpByUsername(employee.getUsername());
        if (emp != null) {
            return -1;
        }
        //普通用户
        employee.setRole(1);
        //status为未审批
        employee.setStatus(0);
        return employeeMapper.doReg(employee);
    }

    /**
     * 按状态获取所有员工
     *
     * @param status 状态
     * @return List<Employee>
     */
    public List<Employee> getAllEmpsByStatus(Integer status) {
        return employeeMapper.getAllEmpsByStatus(status);
    }

    /**
     * 更新状态
     *
     * @param employeeid 员工ID
     * @param status     状态
     * @return Integer
     */
    public Integer updatestatus(Integer employeeid, Integer status) {
        return employeeMapper.updatestatus(employeeid, status);
    }

    /**
     * 分页查询获得所有Emps
     *
     * @param employee 员工
     * @param page     页数
     * @param pageSize 查几条数据
     * @return
     */
    public List<Employee> getAllEmps(Employee employee, Integer page, Integer pageSize) {
        //这个page是从第几行数据开始查
        page = (page - 1) * pageSize;
        return employeeMapper.getAllEmps(employee, page, pageSize);
    }

    /**
     * 获取员工数量
     *
     * @param employee 员工
     * @return 员工数量
     */
    public Long getTotal(Employee employee) {
        return employeeMapper.getTotal(employee);
    }

    /**
     * 通过部门编号获取员工
     *
     * @param depId 部门编号
     * @return List<Employee>
     */
    public List<Employee> getEmpsByDepId(Integer depId) {
        return employeeMapper.getEmpsByDepId(depId);
    }

    /**
     * 通过meetingid获取员工信息
     *
     * @param meetingid Integer
     * @return List<Employee>
     */
    public List<Employee> getEmpsByid(Integer meetingid) {

        List<Integer> list = meetingparticipantsMapper.getAllBymeetingid(meetingid);

        return employeeMapper.getAllEmpsByid(list);

    }

    /**
     * 修改密码
     *
     * @param username    用户名
     * @param newpassword 新密码
     */
    public void doChang(String username, String newpassword) {
        employeeMapper.doChang(username, newpassword);
    }
}
