package com.hrms.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrms.bean.Job;
import com.hrms.bean.JobExample;
import com.hrms.dao.JobMapper;
import com.hrms.util.commonUtil;

@Service
public class JobService {
	@Autowired
	JobMapper jobMapper;

	public Integer addJob(Job job) {
		job.setJobno(commonUtil.generateJobNO(job.getJobname(), job.getDeptno()));
		return jobMapper.insert(job);
	}

	public ArrayList<Job> selectByDept(String deptName) {
		JobExample jobExample = new JobExample();
		
		if (!deptName.equals("allDepts")) {
			System.out.println(deptName);
			jobExample.or().andDeptnoEqualTo(deptName);
		}
		ArrayList<Job> jobs = (ArrayList<Job>) jobMapper.selectByExample(jobExample);
		return jobs;
	}

	public ArrayList<Job> selectAll() {
		ArrayList<Job> jobs = (ArrayList<Job>) jobMapper.selectByExample(null);
		return jobs;
	}

	public Job selectById(Integer id) {
		Job job = jobMapper.selectByPrimaryKey(id);
		return job;
	}

}
