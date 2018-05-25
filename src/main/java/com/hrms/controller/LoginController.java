package com.hrms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hrms.bean.user;
import com.hrms.service.UserService;
import com.hrms.util.constant;

@Controller
public class LoginController {
	@Autowired
	UserService userService;

	@RequestMapping("/login")
	@ResponseBody
	public ModelAndView login(@RequestParam(value = "name") String name,
			@RequestParam(value = "password") String password, HttpServletRequest request) {

		System.out.println("name=" + name + ",password=" + password);
		List<user> users = userService.validate(name, password);
		if (users != null) {
			user user = users.get(0);
			int roleId = Integer.parseInt(user.getRoleid());
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setAttribute("username", user.getUsername());
			session.setAttribute("userid", user.getId());
			session.setAttribute("roleName", constant.Role.gerRole(roleId));
			session.setAttribute("roleId", user.getRoleid());
			return new ModelAndView("../index");
		} else {
			request.setAttribute("result", "登录信息有误,请重新输入！");
			return new ModelAndView("../login");
		}

	}
}
