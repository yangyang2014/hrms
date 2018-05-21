package com.hrms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hrms.bean.user;
import com.hrms.service.UserService;

@Controller
public class UserController {
	@Autowired UserService userService;
	
	@RequestMapping(value="getAllUsers")
	public ResponseEntity<List<user>> getAllUsers(){
		List<user> users = userService.getAllUsers();
		return new ResponseEntity<List<user>>(users,HttpStatus.OK);
	}
}
