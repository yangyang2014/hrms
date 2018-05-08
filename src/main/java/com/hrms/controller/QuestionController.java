package com.hrms.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hrms.bean.Msg;
import com.hrms.bean.Question;
import com.hrms.bean.QuestionExample;
import com.hrms.dao.QuestionMapper;
import com.hrms.service.QuestionMapperService;

@Controller
public class QuestionController {
	@Autowired
	QuestionMapperService questionMapperService;

	@RequestMapping(value = "/getProgress/{id}", method = RequestMethod.GET)
	public ResponseEntity<Msg> getProgress(@PathVariable Integer id) {
		if (id == 5) {
			return new ResponseEntity<Msg>(Msg.success().add("status", "第" + id + "笔试题选择完毕,即将为您显示操作结果，请稍等。。。"),
					HttpStatus.OK);
		}
		return new ResponseEntity<Msg>(Msg.success().add("status", "第" + id + "笔试题选择完毕"), HttpStatus.OK);
	}

	@RequestMapping(value = "/getQuestion", method = RequestMethod.GET)
	public ResponseEntity<Msg> getRandomQuestion() {
		long sum = questionMapperService.getCount();
		Random rand = new Random();
		List<Integer> questionIds = new ArrayList<Integer>();
		while (questionIds.size() < 5) {
			Integer num = 1+rand.nextInt(new Long(sum).intValue());// +1为了防止出现0，因为表中的id从1开始。
			if (!questionIds.contains(num)) {
				questionIds.add(num);
			}
			
		}
		System.out.println(questionIds.toString());
		// 生成查询条件
		QuestionExample questionExample = new QuestionExample();
		questionExample.or().andIdIn(questionIds);
		//查询并返回值
		List<Question> questions = questionMapperService.getQuestionByIds(questionExample);
		return new ResponseEntity<Msg>(Msg.success().add("questions", questions),HttpStatus.OK);
	}

	 
}
