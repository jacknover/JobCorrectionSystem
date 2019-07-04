package com.gxun.jms.dao;

import com.gxun.jms.pojo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface AdminMapper {
    public ArrayList<StudentView> getStudent(@Param("student") StudentView student);

    public ArrayList<TeacherView> getTeacher(@Param("teacher") TeacherView teacher);

    public ArrayList<College> getCollege();

    public void insertStudent(@Param("student") Student student);

    public Student getAStudent(@Param("student") Student student);

    public void insertStudentTwo(@Param("student") Student student);

    public void insertTeacher(@Param("teacher")Teacher teacher);

    public Teacher getATeacher(@Param("teacher") Teacher teacher);

    public void insertTeacherTwo(@Param("teacher") Teacher teacher);

    public void deleteStudent(@Param("studentID") int studentID);

    public void deleteTeacher(@Param("teacherID") int teacherID);

    public ArrayList<Question> getAllQuestion(@Param("question") Question question);
}
