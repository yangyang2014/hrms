package com.hrms.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrms.bean.Recruitment;
import com.hrms.bean.RecruitmentExample;
import com.hrms.dao.RecruitmentMapper;

@Service
public class RecruitmentService {
	@Autowired
	RecruitmentMapper recruitmentMapper;

	public List<Recruitment> getRecruitments() {
		List<Recruitment> recruitments = recruitmentMapper.selectByExample(null);
		return recruitments;
	}

	public Integer addRecruitment(Recruitment recruitment) {
		Integer result = recruitmentMapper.insert(recruitment);
		return result;
	}

	public List<Recruitment> getRecruitmentByName(String name) {
		List<Recruitment> recruitments = recruitmentMapper.selectByName(name);
		return recruitments;
	}

	public Recruitment getRecruitmentById(Integer id) {
		Recruitment recruitment = recruitmentMapper.selectByPrimaryKey(id);
		return recruitment;
	}

}
