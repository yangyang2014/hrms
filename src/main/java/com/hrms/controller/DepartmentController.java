package com.hrms.controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hrms.bean.Department;
import com.hrms.bean.Msg;
import com.hrms.service.DepartmentService;
import com.hrms.util.Chinese2Alph;
import com.hrms.util.commonUtil;

@Controller
public class DepartmentController {
	@Autowired
	DepartmentService departmentService;

	@RequestMapping("/getDeptments")
	@ResponseBody
	public Msg getAllDeptment() {
		Msg result;
		List<Department> departments = departmentService.getAll();
		if (!departments.isEmpty()) {
			result = Msg.success().add("departments", departments);
		} else {
			result = Msg.fail();
		}
		return result;
	}

	@RequestMapping(value = "/getDeptment/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Department> getDeptment(@PathVariable Integer id) {

		Department department = departmentService.getDept(id);
		HttpStatus status = department != null ? HttpStatus.OK : HttpStatus.NOT_FOUND;
		return new ResponseEntity<Department>(department, status);
	}

	@RequestMapping("/saveDeptment")
	@ResponseBody
	public Msg saveDeptment(Department department) {
		System.out.println("departName=" + department.getName());
		String departmentNumber = "DEPT-" + new Chinese2Alph().String2Alpha(department.getName()) + "-"
				+ new Random().nextInt(10);
		department.setNumber(departmentNumber);
		departmentService.insertDeptmentByExample(department);
		return Msg.success();
	}

	/**
	 * 判断新增的部门与数据库中的存在重复
	 * 
	 * @param deptName
	 * @return
	 * @throws NullPointerException
	 */
	@RequestMapping(value = "/validateDeptment", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Integer> validateDeptment(String deptName) throws NullPointerException {
		// 请求值为空，返回异常信息
		if (commonUtil.isNullOrEmpty(deptName)) {
			return new ResponseEntity<Integer>(2, HttpStatus.OK);
		}
		boolean result = departmentService.validateDeptment(deptName);
		if (result) {// 存在该部门名
			return new ResponseEntity<Integer>(1, HttpStatus.OK);
		} else {// 不存在该部门名
			return new ResponseEntity<Integer>(0, HttpStatus.OK);
		}

	}

	@RequestMapping(value = "/updateDeptment/{id}", method = RequestMethod.PUT)
	@ResponseBody
	public ResponseEntity<Integer> updateDeptment(@PathVariable Integer id, Department department) {
		Integer result = departmentService.updateDeptment(department);
		HttpStatus status = result != null ? HttpStatus.OK : HttpStatus.BAD_REQUEST;
		return new ResponseEntity<Integer>(result, status);
	}

	@RequestMapping(value = "/deleteDeptment/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteDeptment(@PathVariable Integer id) {
		departmentService.deleteDeptmentById(id);
		return Msg.success();
	}

}
