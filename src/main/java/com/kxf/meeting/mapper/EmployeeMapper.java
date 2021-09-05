package com.kxf.meeting.mapper;

import com.kxf.meeting.model.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {

    /**
     * 通过用户名查询员工
     *
     * @param username 用户名
     * @return 员工
     */
    Employee loadEmpByUsername(String username);

    /**
     * 做注册
     *
     * @param employee 员工
     * @return 注册返回值
     */
    Integer doReg(Employee employee);

    /**
     * 按状态获取所有员工
     *
     * @param status 状态
     * @return List<Employee>
     */
    List<Employee> getAllEmpsByStatus(Integer status);

    /**
     * 更新状态
     *
     * @param employeeid 员工ID
     * @param status     状态
     * @return Integer
     */
    Integer updatestatus(@Param("employeeid") Integer employeeid, @Param("status") Integer status);

    /**
     * 根据status分页获得员工
     *
     * @param employee 员工
     * @param page     从第几行数据开始查
     * @param pageSize 查几条数据
     * @return List<Employee>
     */
    List<Employee> getAllEmps(@Param("emp") Employee employee, @Param("page") Integer page,
                              @Param("pagesize") Integer pageSize);

    /**
     * 根据status获得员工的数量
     *
     * @param employee 员工
     * @return 数量
     */
    Long getTotal(Employee employee);

    /**
     * 通过部门编号获取员工
     *
     * @param depId 部门编号
     * @return List<Employee>
     */
    List<Employee> getEmpsByDepId(Integer depId);

    /**
     * 通过employeeid集合获取员工的信息
     *
     * @param list List<Integer>
     * @return List<Employee>
     */
    List<Employee> getAllEmpsByid(List<Integer> list);

    /**
     * 修改密码
     *
     * @param username    用户名
     * @param newpassword 新密码
     */
    void doChang(@Param("username") String username, @Param("newpassword") String newpassword);
}
