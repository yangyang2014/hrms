package com.hrms.bean;

import java.util.List;

public class Department {
    private Integer id;
    private String name;
    private String remark;
    private List<Employee> employees;
    private Integer empNum;
    public Department() {
		super();
	}

	public Department(Integer id, String name, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.remark = remark;
	}

	public Department(Integer id, String name, String remark, List<Employee> employees) {
		super();
		this.id = id;
		this.name = name;
		this.remark = remark;
		this.employees = employees;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public Integer getEmpNum() {
		return empNum;
	}

	public void setEmpNum(Integer empNum) {
		this.empNum = empNum;
	}
}