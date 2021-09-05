package com.kxf.meeting.mapper;

import com.kxf.meeting.model.Department;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentMapper {

    /**
     * 根据部门编号获取部门信息
     *
     * @param id 部门编号
     * @return 部门信息
     */
    Department getDepById(@Param("id") Integer id);

    /**
     * 获取所有部门信息
     *
     * @return list集合里包含所有的部门信息
     */
    List<Department> getAllDeps();

    /**
     * 增加部门
     *
     * @param departmentname 部门名称
     * @return 部门增加成功返回增加成功的数量
     */
    Integer adddepartment(String departmentname);

    /**
     * 通过部门名称获取部门信息
     *
     * @param departmentname 部门名称
     * @return 部门信息
     */
    Department getDepByName(String departmentname);

    /**
     * 通过部门编号删除部门
     *
     * @param departmentid 部门编号
     * @return 部门删除成功返回删除成功的数量
     */
    Integer deletedep(Integer departmentid);

    /**
     * 更新部门名称
     *
     * @param id   部门编号
     * @param name 部门名称
     * @return 部门更新成功返回更新成功的数量
     */
    Integer updatedep(@Param("id") Integer id, @Param("name") String name);
}
