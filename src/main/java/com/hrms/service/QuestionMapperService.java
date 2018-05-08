package com.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrms.bean.Question;
import com.hrms.bean.QuestionExample;
import com.hrms.dao.QuestionMapper;

@Service
public class QuestionMapperService {
	@Autowired
	QuestionMapper questionMapper;
	public long getCount() {
		long sum = questionMapper.countByExample(null);
		return sum;
		
	}
	public List<Question> getQuestionByIds(QuestionExample questionExample) {
		List<Question> questions = questionMapper.selectByExample(questionExample);
		return questions;
	}
}
