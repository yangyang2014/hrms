package com.hrms.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrms.bean.log;
import com.hrms.dao.logMapper;
import com.hrms.util.commonUtil;

@Service
public class LogService {
	@Autowired
	logMapper logMapper;
	public void addSystemLog(String username , String operation) {
		log log = new log();
		if(username != null&operation != null) {
			log.setUsername(username);
			log.setOperation(operation);
			log.setTime(commonUtil.getCurrentTime());
			logMapper.insert(log);
		}
	}
	public ArrayList<log> getLogs() {
		return (ArrayList<log>) logMapper.selectByExample(null);
	}
}
