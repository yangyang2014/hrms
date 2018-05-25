package com.hrms.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hrms.bean.Employee;
import com.hrms.bean.EmployeeExample;
import com.hrms.bean.Job;
import com.hrms.bean.user;
import com.hrms.bean.userExample;
import com.hrms.dao.EmployeeMapper;
import com.hrms.dao.JobMapper;
import com.hrms.dao.userMapper;
import com.hrms.util.Chinese2Alph;
import com.hrms.util.commonUtil;

@Service
public class EmployeeService {
	@Autowired
	EmployeeMapper employMapper;
	@Autowired
	userMapper userMapper;
	public List<Employee> getALL() {
		List<Employee> result = employMapper.selectByExampleWithDept(null);
//		List<Employee> emps = new ArrayList<Employee>();
//		for(Employee e:result) {
//			Job job = jobMapper.selectByPrimaryKey(e.getJobid());
//			System.out.println(job.getJobname());
//			e.setJob(job);
//			emps.add(e);
//		}
		return result;
	}
	/*将员工信息保存到员工表和用户表中*/
	public void saveEmp(Employee emp) {
		System.out.println("in service saveEmp");
		String empno = 	commonUtil.generateEmpNO(emp.getEmpName());
		emp.setEmpno(empno);
		employMapper.insertSelective(emp);	
		user user = new user();
		user.setUsername(empno);
		user.setPassword("123456");
		user.setRoleid("3");
		userMapper.insert(user);
	}
	public Employee getEmpById(String id) {
		return employMapper.selectByPrimaryKeyWithDept(Integer.parseInt(id));
	}
	public int updateEmp(Employee emp) {
		return employMapper.updateByPrimaryKey(emp);
	}
	/*职工表和用户表都需要删除掉*/
	public Integer deleteEmpById(int id) {
		Employee emp = employMapper.selectByPrimaryKey(id);
		userExample userExample = new userExample();
		userExample.or().andUsernameEqualTo(emp.getEmpno());
		userMapper.deleteByExample(userExample);
		return employMapper.deleteByPrimaryKey(id);
	}
	
	/*修改职工岗位*/
	public int changeEmpJob(Integer id,Integer jobid) {
		System.out.println("service in change empjob");
		Employee employee = employMapper.selectByPrimaryKey(id);
		System.out.println("获取："+employee.getJobid());
		employee.setJobid(jobid);
		System.out.println("employee:"+employee.getEmpName()+employee.getJobid());
		return employMapper.updateByPrimaryKey(employee);
	}
	public Employee getEmpByEmpNO(String empNO) {
		EmployeeExample empExample = new EmployeeExample();
		empExample.or().andEmpNOEqualTo(empNO);
		return employMapper.selectByExampleWithDept(empExample).get(0);
		 
	}	
}
      