package com.hrms.dao;

import com.hrms.bean.Employee;
import com.hrms.bean.EmployeeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper {
    long countByExample(EmployeeExample example);
    int deleteByExample(EmployeeExample example);
    int deleteByPrimaryKey(Integer empId);
    int insert(Employee record);
    int insertSelective(Employee record);
    List<Employee> selectByExample(EmployeeExample example);
    List<Employee> selectByDeptId(Integer deptId);
    Employee selectByPrimaryKey(Integer empId);
    List<Employee> selectByExampleWithDept(EmployeeExample example);
    Employee selectByPrimaryKeyWithDept(Integer empId);
    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);
    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);
    int updateByPrimaryKeySelective(Employee record);
    int updateByPrimaryKey(Employee record);
}