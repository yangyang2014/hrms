package com.hrms.test;

import java.util.Date;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hrms.bean.Department;
import com.hrms.bean.Employee;
import com.hrms.bean.Question;
import com.hrms.bean.Recruitment;
import com.hrms.dao.DepartmentMapper;
import com.hrms.dao.EmployeeMapper;
import com.hrms.dao.QuestionMapper;
import com.hrms.dao.RecruitmentMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	RecruitmentMapper recruitmentMapper;
	@Autowired
	QuestionMapper questionMapper;
	@Autowired
	SqlSession sqlSession;

	@Test
	public void getCount() {
		long sum = questionMapper.countByExample(null);
		System.out.println(sum);
	}

	/*
	 * @Test public void addRecruit() { RecruitmentMapper mapper =
	 * sqlSession.getMapper(RecruitmentMapper.class); for(int i=0;i<10;i++) {
	 * Recruitment recruitment = new Recruitment("招聘"+i, "a", new Date(), "南京",
	 * "   ", "  "); mapper.insertSelective(recruitment); } }
	 */

	// 测试department
	// @Test
	// public void textMapper(){
	//// //1.创建SpringIOC容器
	//// ApplicationContext ioc = new
	// ClassPathXmlApplicationContext("applicationContext.xml");
	//// //2.从容器中获取mapper
	//// ioc.getBean(DepartmentMapper.class);
	//// System.out.println(departmentMapper);
	//// departmentMapper.insertSelective(new Department(null,"售后部","shouhou"));
	// //批量插入员工
	// EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
	// for(int i=0;i<1000;i++) {
	// String uid = UUID.randomUUID().toString().substring(0, 5)+i;
	// mapper.insertSelective(new Employee(null,uid,"M",uid+"abc@gmail.com",1));
	// }
	// System.out.println("批量完成");
	// }
}
