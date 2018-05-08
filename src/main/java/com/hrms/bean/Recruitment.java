package com.hrms.bean;

import java.util.Date;

public class Recruitment {
    private Integer id;

    private String name;

    private String principal;

    private Date time;

    private String address;

    private String destination;

    private String employeeinneed;

    public Recruitment() {
		super();
	}

	

	public Recruitment(Integer id, String name, String principal, Date time, String address, String destination,
			String employeeinneed) {
		super();
		this.id = id;
		this.name = name;
		this.principal = principal;
		this.time = time;
		this.address = address;
		this.destination = destination;
		this.employeeinneed = employeeinneed;
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

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal == null ? null : principal.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination == null ? null : destination.trim();
    }

    public String getEmployeeinneed() {
        return employeeinneed;
    }

    public void setEmployeeinneed(String employeeinneed) {
        this.employeeinneed = employeeinneed == null ? null : employeeinneed.trim();
    }
}