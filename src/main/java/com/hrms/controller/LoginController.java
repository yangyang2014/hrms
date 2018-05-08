package com.hrms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping("/login")
	@ResponseBody
	public ModelAndView login(@RequestParam(value = "name") String name,
			@RequestParam(value = "password") String password, HttpServletRequest request) {
		System.out.println("name=" + name + ",password=" + password);
		if (name.equals("admin") && password.equals("123456")) {
		
			return new ModelAndView("../index");
		} else {
			return new ModelAndView("../login");
		}

	}
}
