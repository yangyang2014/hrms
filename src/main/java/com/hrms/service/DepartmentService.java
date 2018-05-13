package com.hrms.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrms.bean.Department;
import com.hrms.dao.DepartmentMapper;

@Service
public class DepartmentService {
	@Autowired
	DepartmentMapper departmentMapper;

	public List<Department> getAll() {
		List<Department> departments = departmentMapper.selectByExample(null);
		for (Department department : departments) {
			department.setEmpNum(department.getEmployees().size());
			department.setEmployees(null);
		}
		return departments;
	}

	public List<Department> getAllWithEmployee() {
		List<Department> departments = departmentMapper.selectByExample(null);
		for (Department department : departments) {
			department.setEmpNum(department.getEmployees().size());
		}
		return departments;
	}

	public int insertDeptmentByExample(Department department) {
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

	public List<Department> getDeptByName(String deptName) {
		return departmentMapper.getDeptByName(deptName);
	}

	public boolean validateDeptment(String deptName) {
		return !getDeptByName(deptName).isEmpty();// 存在就返回true,否则false
	}
}
