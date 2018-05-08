package com.hrms.test;

import java.util.List;

import javax.servlet.jsp.jstl.sql.Result;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.hrms.bean.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class PageTest {
	//传入Springmvc的Ioc
	@Autowired
	WebApplicationContext context;
	MockMvc mockMvc;
	@Before
	public void initMokeMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		MockMvcRequestBuilders.get("/emps").param("pn","1");
	}
	@Test
	public void testPn() throws Exception {
		MvcResult mvcResult =mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn","1")).andReturn();
		MockHttpServletRequest request = mvcResult.getRequest();
		PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
		System.out.println("当前页码："+pi.getPageNum());
		System.out.println("页面连续线显示的页码数：");
		int[] nums = pi.getNavigatepageNums();
		for(int i:nums) {
			System.out.println(" "+i);
		}
		List<Employee> emps = pi.getList();
		for(Employee emp : emps) {
			System.out.println(emp.getEmpName());
		}
	}
	
}
