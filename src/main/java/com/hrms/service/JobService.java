package com.hrms.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrms.bean.Department;
import com.hrms.bean.DepartmentExample;
import com.hrms.bean.EmployeeExample;
import com.hrms.bean.Job;
import com.hrms.bean.JobExample;
import com.hrms.dao.DepartmentMapper;
import com.hrms.dao.EmployeeMapper;
import com.hrms.dao.JobMapper;
import com.hrms.util.commonUtil;

@Service
public class JobService {
	@Autowired
	JobMapper jobMapper;
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;

	public Integer addJob(Job job) {
		job.setJobno(commonUtil.generateJobNO(job.getJobname(), job.getDeptno()));
		return jobMapper.insert(job);
	}

	/* 根据部门编号查找岗位 */
	public ArrayList<Job> selectByDeptNO(String deptNO) {
		JobExample jobExample = new JobExample();
		if (!deptNO.equals("allDepts")) {
			System.out.println(deptNO);
			jobExample.or().andDeptnoEqualTo(deptNO);
		}
		ArrayList<Job> jobs = (ArrayList<Job>) jobMapper.selectByExample(jobExample);
		return getJobsWithDeptNameAndCurrentNum(jobs);
	}

	/* 将岗位信息转为带有部门名和现有人数的岗位 */
	public ArrayList<Job> getJobsWithDeptNameAndCurrentNum(ArrayList<Job> jobs) {
		ArrayList<Job> jobsresult = new ArrayList<Job>();
		for (Job job : jobs) {
			DepartmentExample departmentExample = new DepartmentExample();
			departmentExample.or().andNumberEqualTo(job.getDeptno());
			Department department = departmentMapper.selectByExample(departmentExample).get(0);
			job.setDeptName(department.getName());
			EmployeeExample employeeExample = new EmployeeExample();
			employeeExample.or().andJobIdEqualTo(job.getJobid());
			job.setCurrentnum(employeeMapper.selectByExample(employeeExample).size());
			jobsresult.add(job);
		}
		return jobsresult;
	}

	public ArrayList<Job> selectAll() {
		System.out.println("in jobservice selectAll");
		ArrayList<Job> jobs = (ArrayList<Job>) jobMapper.selectByExample(null);
		return getJobsWithDeptNameAndCurrentNum(jobs);
	}

	public Job selectById(Integer id) {
		Job job = jobMapper.selectByPrimaryKey(id);
		return job;
	}

	public Integer delete(String jobsId) {
		Integer[] jobsIdInteger = commonUtil.analyze(jobsId);
		for (Integer jobId : jobsIdInteger) {
			jobMapper.deleteByPrimaryKey(jobId);
		}
		return 1;// 1:表示删除成功
	}

	/* 根据部门查找岗位名 */
	public ArrayList<Job> selectJobByDeptId(String deptId) {
		System.out.println("in selectJobByDeptId");
		Department department = departmentMapper.selectByPrimaryKey(Integer.parseInt(deptId));
		return selectByDeptNO(department.getNumber());
	}

}
