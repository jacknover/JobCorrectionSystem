package com.gxun.jms.dao;

import com.gxun.jms.pojo.Student;
import com.gxun.jms.pojo.Teacher;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LoginMapper {
    public Student studentLogin(@Param("studentLoginID") String studentLoginID, @Param("studentPassword") String studentPassword);

    public Teacher teacherLogin(@Param("teacherLoginID")String teacherLoginID, @Param("teacherPassword")String teacherPassword);
}
