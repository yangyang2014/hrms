package com.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrms.bean.Department;
import com.hrms.dao.DepartmentMapper;

@Service
public class DepartmentService {
	@Autowired
	DepartmentMapper departmentMapper;
	
	public List<Department> getAll(){
		List<Department> departments = departmentMapper.selectByExample(null);
		for(Department department:departments) {
			department.setEmpNum(department.getEmployees().size());
			department.setEmployees(null);
		}
		return departments;	
	}

	public List<Department> getAllWithEmployee(){
		List<Department> departments = departmentMapper.selectByExample(null);
		for(Department department:departments) {
			department.setEmpNum(department.getEmployees().size());
		}
		return departments;	
	}

	public int saveDeptmentByExample(Department department) {
		return departmentMapper.insert(department);
		
	}

	public Department getDept(Integer id) {
		return departmentMapper.selectByPrimaryKey(id);
	}

	public int updateDeptment(Department department) {
		return departmentMapper.updateByPrimaryKey(department);
	}

	public int deleteDeptmentById(Integer id) {
		return departmentMapper.deleteByPrimaryKey(id);
	}
}
