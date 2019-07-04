package com.gxun.jms.service;

import com.gxun.jms.dao.AdminMapper;
import com.gxun.jms.pojo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AdminService {
    @Autowired
    private AdminMapper adminMapper;

    public ArrayList<StudentView> getStudent(StudentView student)
    {
        return adminMapper.getStudent(student);
    }

    public ArrayList<TeacherView> getTeacher(TeacherView teacherView)
    {
        return adminMapper.getTeacher(teacherView);
    }

    public ArrayList<College> getCollege()
    {
        return adminMapper.getCollege();
    }

    public void insertStudent(Student student)
    {
        adminMapper.insertStudent(student);
    }

    public void insertTeacher(Teacher teacher)
    {
        adminMapper.insertTeacher(teacher);
    }

    public Student getAStudent( Student student){

        return adminMapper.getAStudent(student);
    }

    public void insertStudentTwo(Student student)
    {
        adminMapper.insertStudentTwo(student);
    }

    public Teacher getATeacher(Teacher teacher)
    {
        return adminMapper.getATeacher(teacher);
    }

    public void insertTeacherTwo(Teacher teacher)
    {
        adminMapper.insertTeacherTwo(teacher);
    }

    public void deleteStudent(int studentID)
    {
        adminMapper.deleteStudent(studentID);
    }

    public void deleteTeacher(int teacherID)
    {
        adminMapper.deleteTeacher(teacherID);
    }

    public ArrayList<Question> getAllQuestion( Question question)
    {
        return adminMapper.getAllQuestion(question);
    }
}
