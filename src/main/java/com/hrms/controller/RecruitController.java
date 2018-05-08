package com.hrms.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hrms.bean.Msg;
import com.hrms.bean.Recruitment;
import com.hrms.bean.RecruitmentExample;
import com.hrms.service.RecruitmentService;
import com.hrms.util.GenerateDocxUtil;
import com.hrms.util.commonUtil;

@Controller
public class RecruitController {
	@Autowired
	RecruitmentService recruitmentService;

	@RequestMapping(value = "/getRecruitmentTask", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<Recruitment>> getRecruitments() {
		List<Recruitment> recruitments = recruitmentService.getRecruitments();
		return new ResponseEntity<List<Recruitment>>(recruitments, HttpStatus.OK);
	}

	@RequestMapping(value = "/getRecruitmentTaskById/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Msg> getRecruitmentById(@PathVariable(value="id") String id) throws ParseException {
		if(id==null) {
			return new ResponseEntity<Msg>(HttpStatus.NOT_FOUND);
		}
		Recruitment recruitment = recruitmentService.getRecruitmentById(Integer.parseInt(id));
		return new ResponseEntity<Msg>(Msg.success().add("recruit", recruitment), HttpStatus.OK);
	}

	@RequestMapping(value = "/addRecruitmentTask", method = RequestMethod.POST)
	@ResponseBody
	public Msg addRecruitmentTask(@RequestParam("name") String name, @RequestParam("principal") String principal,
			@RequestParam("time") String time, @RequestParam("address") String address,
			@RequestParam("destination") String destination, @RequestParam("employeeinneed") String employeeinneed)
			throws ParseException {
		Date timeDate = (Date) commonUtil.stringToDate(time).getExtend().get("time");
		System.out.println(timeDate);
		Recruitment recruit = new Recruitment(null, name, principal, timeDate, address, destination, employeeinneed);
		recruitmentService.addRecruitment(recruit);
		return Msg.success().add("recruit", recruit);
	}

	@RequestMapping(value = "/generateRecruitmentDocx", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> generateRecruitmentDocx(@RequestParam("name") String name) throws Docx4JException, IOException, ParseException {
		RecruitmentExample recruitExample = new RecruitmentExample();
		Recruitment recruitment = recruitmentService.getRecruitmentByName(name).get(0);
		GenerateDocxUtil.generateRecruimentDocx("E:\\code\\templateDOC\\recruitmentInfo.docx",
				"E:\\code\\templateDOC\\" + name + ".docx", recruitment);
		return new ResponseEntity<Integer>(1, HttpStatus.OK);
	}

}
