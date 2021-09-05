package com.kxf.meeting.service;

import com.kxf.meeting.mapper.DepartmentMapper;
import com.kxf.meeting.model.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    /**
     * 通过部门编号获取部门
     *
     * @param id 部门编号
     * @return 部门
     */
    public Department getDepById(Integer id) {
        return departmentMapper.getDepById(id);
    }

    /**
     * 获取所有部门
     *
     * @return List<Department>
     */
    public List<Department> getAllDeps() {
        return departmentMapper.getAllDeps();
    }

    /**
     * 增加部门
     * 增加部门前判断部门是否存在，存在则不添加部门，不存在则添加
     *
     * @param departmentname 部门名称
     * @return Integer
     */
    public Integer adddepartment(String departmentname) {
        Department dep = departmentMapper.getDepByName(departmentname);
        if (dep != null) {
            return -1;
        }

        return departmentMapper.adddepartment(departmentname);
    }

    /**
     * 删除部门
     *
     * @param departmentid 部门编号
     * @return Integer
     */
    public Integer deletedep(Integer departmentid) {
        return departmentMapper.deletedep(departmentid);
    }

    /**
     * 更新部门
     *
     * @param id   部门编号
     * @param name 部门名称
     * @return Integer
     */
    public Integer updatedep(Integer id, String name) {
        return departmentMapper.updatedep(id, name);
    }
}
