package com.hrms.dao;

import com.hrms.bean.log;
import com.hrms.bean.logExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface logMapper {
    long countByExample(logExample example);

    int deleteByExample(logExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(log record);

    int insertSelective(log record);

    List<log> selectByExample(logExample example);

    log selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") log record, @Param("example") logExample example);

    int updateByExample(@Param("record") log record, @Param("example") logExample example);

    int updateByPrimaryKeySelective(log record);

    int updateByPrimaryKey(log record);
}