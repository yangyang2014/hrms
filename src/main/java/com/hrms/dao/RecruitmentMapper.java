package com.hrms.dao;

import com.hrms.bean.Recruitment;
import com.hrms.bean.RecruitmentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface RecruitmentMapper {
	long countByExample(RecruitmentExample example);

	int deleteByExample(RecruitmentExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(Recruitment record);

	int insertSelective(Recruitment record);

	List<Recruitment> selectByExample(RecruitmentExample example);

	Recruitment selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") Recruitment record, @Param("example") RecruitmentExample example);

	int updateByExample(@Param("record") Recruitment record, @Param("example") RecruitmentExample example);

	int updateByPrimaryKeySelective(Recruitment record);

	int updateByPrimaryKey(Recruitment record);

	@Select(value = "select * from recruit_task where name = #{name}")
	List<Recruitment> selectByName(String name);
}