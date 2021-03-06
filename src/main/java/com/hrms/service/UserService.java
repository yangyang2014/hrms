package com.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrms.bean.user;
import com.hrms.bean.userExample;
import com.hrms.dao.userMapper;

@Service
public class UserService {
	@Autowired
	userMapper userMapper;
	public List<user> validate(String name, String password) {
		userExample userExample = new userExample();
		userExample.or().andUsernameEqualTo(name).andPasswordEqualTo(password);
		List<user> users = userMapper.selectByExample(userExample);
		
		if(users.isEmpty()) {
			return null;//不存在该用户
		}
		return users;
	}
	public List<user> getAllUsers() {
		List<user> users = userMapper.selectByExample(null);
		return users;
	}
	public int changePassword(user user, String password) {
		
		user.setPassword(password);
		userExample userExample = new userExample();
		userExample.or().andUsernameEqualTo(user.getUsername());
		
		return userMapper.updateByExample(user, userExample);
	}
	public int deleteUser(user user) {
		userMapper.deleteByPrimaryKey(user.getId());
		return 1;
	}
	public int addUser(user user) {
		user.setPassword("123456");
		user.setRemark("暂无");
		userMapper.insert(user);
		return 1;
		
	}
	
}
