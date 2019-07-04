package com.gxun.jms.service;

import com.gxun.jms.dao.LoginMapper;
import com.gxun.jms.pojo.Student;
import com.gxun.jms.pojo.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private LoginMapper loginMapper;

    public Student studentLogin(String studentLoginID, String studentPassword)
    {

        return loginMapper.studentLogin(studentLoginID, studentPassword);
    }

    public Teacher teacherLogin(String teacherLoginID, String teacherPassword){
        return loginMapper.teacherLogin(teacherLoginID, teacherPassword);
    }
}
