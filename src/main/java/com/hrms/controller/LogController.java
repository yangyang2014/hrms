package com.hrms.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hrms.bean.Job;
import com.hrms.bean.log;
import com.hrms.service.LogService;

@Controller
public class LogController {
	@Autowired
	LogService logService;

	@RequestMapping("/getLogs")
	@ResponseBody
	public ResponseEntity<ArrayList<log>> getLogs() {
		ArrayList<log> logs = logService.getLogs();
		return new ResponseEntity<ArrayList<log>>(logs, HttpStatus.OK);
	}
}
