package com.hrms.bean;

public class Job {
    private int jobid;

    private String jobno;

    private String deptno;

    private String jobremark;

    private int jobplannum;

    private String jobname;

    public int getJobid() {
        return jobid;
    }

    public void setJobid(int jobid) {
        this.jobid = jobid;
    }

    public String getJobno() {
        return jobno;
    }

    public void setJobno(String jobno) {
        this.jobno = jobno == null ? null : jobno.trim();
    }

    public String getDeptno() {
        return deptno;
    }

    public void setDeptno(String deptno) {
        this.deptno = deptno == null ? null : deptno.trim();
    }

    public String getJobremark() {
        return jobremark;
    }

    public void setJobremark(String jobremark) {
        this.jobremark = jobremark == null ? null : jobremark.trim();
    }

    public int getJobplannum() {
        return jobplannum;
    }

    public void setJobplannum(int jobplannum) {
        this.jobplannum = jobplannum;
    }

    public String getJobname() {
        return jobname;
    }

    public void setJobname(String jobname) {
        this.jobname = jobname == null ? null : jobname.trim();
    }
}