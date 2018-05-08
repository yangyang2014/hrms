package com.hrms.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hrms.bean.Employee;
import com.hrms.bean.EmployeeExample;
import com.hrms.bean.Msg;
import com.hrms.service.EmployeeService;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	/*
	 * 导入jackson
	 * @param pn 
	 * @return
	 * */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 8);// 显示的页码数，记录数
		// startPage 紧跟的查询就是分页查询
		List<Employee> emps = employeeService.getALL();
		PageInfo page = new PageInfo(emps, 5);// 表格下面，连续显示的页码数为5
		return Msg.success().add("pageInfo",page);
	}
	
	@RequestMapping("/saveEmp")
	@ResponseBody
	public Msg saveEmp(Employee emp) {
		employeeService.saveEmp(emp);
		return Msg.success();	
	}

	@RequestMapping(value="/getEmp/{id}", method=RequestMethod.POST)
	@ResponseBody
	public Msg getEmp(@PathVariable(value="id") String id) {
		Employee emp = employeeService.getEmpById(id);
		return Msg.success().add("emp", emp);	
	}

	@RequestMapping(value="/deleteEmp/{id}", method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmp(@PathVariable(value="id") String id) {
		System.out.println("id="+id+", delete operation");
		employeeService.deleteEmpById(Integer.parseInt(id));
		return Msg.success();
		
	}
	
	@RequestMapping(value="/updateEmp/{id}", method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(@PathVariable(value="id") String id,Employee emp) {
		System.out.println("id="+id+",emp="+emp.getEmpName());
		emp.setEmpId(Integer.parseInt(id));
		employeeService.updateEmp(emp);
		return Msg.success();
	}
	
	// @RequestMapping("/emps")
	public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		// 引入分页插件 pagehelper
		// ??????????????????
		PageHelper.startPage(pn, 5);// 显示的页码数，记录数
		// startPage 紧跟的查询就是分页查询
		List<Employee> emps = employeeService.getALL();
		PageInfo page = new PageInfo(emps, 5);// 表格下面，连续显示的页码数为5
		model.addAttribute("pageInfo", page);
		return "list";
	}
}
