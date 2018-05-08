package com.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hrms.bean.Employee;
import com.hrms.dao.EmployeeMapper;

@Service
public class EmployeeService {
	@Autowired
	EmployeeMapper employMapper;
	public List<Employee> getALL() {
		List<Employee> result = employMapper.selectByExampleWithDept(null);
		return result;
	}
	public void saveEmp(Employee emp) {
		employMapper.insertSelective(emp);	
	}
	public Employee getEmpById(String id) {
		return employMapper.selectByPrimaryKey(Integer.parseInt(id));
	}
	public int updateEmp(Employee emp) {
		return employMapper.updateByPrimaryKey(emp);
	}
	public Integer deleteEmpById(int id) {
		return employMapper.deleteByPrimaryKey(id);
	}
	
	
}
      