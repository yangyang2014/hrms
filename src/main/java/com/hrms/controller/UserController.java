package com.hrms.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hrms.bean.user;
import com.hrms.service.LogService;
import com.hrms.service.UserService;
import com.hrms.util.commonUtil;
import com.hrms.util.constant;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	LogService logService;

	@RequestMapping(value = "getAllUsers")
	public ResponseEntity<List<user>> getAllUsers() {
		List<user> users = userService.getAllUsers();
		return new ResponseEntity<List<user>>(users, HttpStatus.OK);
	}
	
	@RequestMapping(value = "addUser")
	public ResponseEntity<String> addUser(user user) {
		userService.addUser(user);
		logService.addSystemLog(constant.username, "添加了"+constant.Role.gerRole(Integer.parseInt(user.getRoleid()))+":"+user.getUsername());
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	@RequestMapping(value="changePassword")
	public ResponseEntity<String> changePassword(String password,HttpServletRequest request){
		List<Object> passValidate = new ArrayList<Object>();
		passValidate.add(password);
		boolean isValidate = commonUtil.isNullOrEmpty(passValidate);
		if(isValidate) {
			return new ResponseEntity<String>("输入值为空",HttpStatus.OK);
		}
		HttpSession session = request.getSession();
		user user = (user) session.getAttribute("user");
	//	System.out.println("password="+password+" username="+username);
		userService.changePassword(user,password);
		logService.addSystemLog(constant.username, "修改了密码");
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@RequestMapping(value="resetPassword")
	public ResponseEntity<String> resetPassword(user user){
//		System.out.println("username="+user.getUsername());
		userService.changePassword(user,"123456");
		logService.addSystemLog(constant.username, "重置"+user.getUsername()+"密码");
		return  new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@RequestMapping(value="deleteUser")
	public ResponseEntity<String> deleteUser(user user){
//		System.out.println("username="+user.getUsername());
		userService.deleteUser(user);
		logService.addSystemLog(constant.username, "删除了一个用户");
		return  new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	
	
}
