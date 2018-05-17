package com.hrms.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hrms.bean.Job;
import com.hrms.service.JobService;
import com.hrms.util.commonUtil;

@Controller
public class JobController {

	@Autowired
	JobService jobService;

	@RequestMapping("/addJob")
	@ResponseBody
	public ResponseEntity<Integer> addJob(Job job) {
		List<Object> validateData = new ArrayList<>();
		validateData.add(job.getJobname());
		validateData.add(job.getJobplannum());
		validateData.add(job.getDeptno());

		if (commonUtil.isNullOrEmpty(validateData)) {
			return new ResponseEntity<Integer>(0, HttpStatus.OK);
		}
		Integer result = jobService.addJob(job);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);

	}

	@RequestMapping("/selectJobByDept")
	@ResponseBody
	public ResponseEntity<ArrayList<Job>> selectByDept(String deptNO) {
		System.out.println("----in selectByDept-----");
		ArrayList<Job> jobs = jobService.selectByDept(deptNO);
		return new ResponseEntity<>(jobs,HttpStatus.OK);

	}

	@RequestMapping("/selectAllJob")
	@ResponseBody
	public ResponseEntity<ArrayList<Job>> selectAll() {
		ArrayList<Job> jobs = jobService.selectAll();
		return new ResponseEntity<>(jobs,HttpStatus.OK);

	}

	@RequestMapping("/selectJobById")
	@ResponseBody
	public ResponseEntity<Job> selectById(Integer id) {
		Job job = jobService.selectById(id);
		return new ResponseEntity<>(job,HttpStatus.OK);

	}

}
