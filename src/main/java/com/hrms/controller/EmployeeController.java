package com.hrms.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hrms.bean.Employee;
import com.hrms.bean.EmployeeExample;
import com.hrms.bean.Msg;
import com.hrms.service.EmployeeService;
import com.hrms.service.LogService;
import com.hrms.util.constant;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	@Autowired
	LogService logService;
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
		System.out.println("---save emp---");
		employeeService.saveEmp(emp);
		logService.addSystemLog(constant.username, "新增"+emp.getEmpName()+"员工");
		return Msg.success();	
	}

	@RequestMapping(value="/getEmp/{id}", method=RequestMethod.POST)
	@ResponseBody
	public Msg getEmp(@PathVariable(value="id") String id) {
		Employee emp = employeeService.getEmpById(id);
		return Msg.success().add("emp", emp);	
	}

	@RequestMapping(value="/getEmpById")
	@ResponseBody
	public Msg getEmpById(String id) {
		Employee emp = employeeService.getEmpById(id);
		return Msg.success().add("emp", emp);	
	}
	
	@RequestMapping(value="/getEmpByEmpNO")
	@ResponseBody
	public Msg getEmpByEmpNO(String empNO) {
		System.out.println("in controller empNO="+empNO);
		Employee emp = employeeService.getEmpByEmpNO(empNO);
		return Msg.success().add("emp", emp);	
	}
	
	@RequestMapping(value="/deleteEmp/{id}", method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmp(@PathVariable(value="id") String id) {
		System.out.println("id="+id+", delete operation");
		employeeService.deleteEmpById(Integer.parseInt(id));
		logService.addSystemLog(constant.username, "删除一个员工");
		return Msg.success();
	}
	
	@RequestMapping(value="/updateEmp/{id}", method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(@PathVariable(value="id") String id,Employee emp) {
		System.out.println("id="+id+",emp="+emp.getEmpName());
		emp.setEmpId(Integer.parseInt(id));
		employeeService.updateEmp(emp);
		logService.addSystemLog(constant.username, "修改"+emp.getEmpName()+"员工信息");
		return Msg.success();
	}
	/*调整员工岗位*/
	@RequestMapping(value="/changeEmpJob/{id}", method=RequestMethod.PUT)
	@ResponseBody
	public Msg changeEmpJob(@PathVariable(value="id") String id,Employee emp) {
		System.out.println("in change job controller");
		System.out.println("id="+id+",jobid="+emp.getJobid());
		employeeService.changeEmpJob(Integer.parseInt(id),emp.getJobid());
		logService.addSystemLog(constant.username, "调整"+emp.getEmpName()+"员工岗位");
		return Msg.success();
	}
	
	/*调整员工岗位*/
	@RequestMapping(value="/updateEmpContact")
	@ResponseBody  
	public  ResponseEntity updateEmpContact(String empId,String email) {
		System.out.println("empid:"+empId+":phone:"+email);
		Employee emp = new Employee();
		emp.setEmpId(Integer.parseInt(empId));
		emp.setEmail(email);
		employeeService.updateContact(emp);
		logService.addSystemLog(constant.username, "修改员工联系方式");
		return new ResponseEntity(HttpStatus.OK);
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
	
	@RequestMapping  (value="/getEmpdataByGender")
	@ResponseBody
	public HashMap<String,Integer> getEmpdataByGender(){
		System.out.println("in employeeController getEmpdataByGender");
		List<Employee> employees = employeeService.getALL();
		Integer manSum=0;
		Integer womanSum=0;
		for(Employee employee:employees) {
			if(employee.getGender().equals("m")) {
				manSum++;
			}else if(employee.getGender().equals("f")){
				womanSum++;
			}
		}
		HashMap<String,Integer> empGenderData = new HashMap<String,Integer>();
		empGenderData.put("m",manSum);
		empGenderData.put("f",womanSum);
		return empGenderData;
		
	}
}
