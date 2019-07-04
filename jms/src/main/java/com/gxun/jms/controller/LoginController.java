package com.gxun.jms.controller;

import com.gxun.jms.dao.AdminMapper;
import com.gxun.jms.pojo.*;
import com.gxun.jms.service.LoginService;
import com.gxun.jms.service.StudentAssignmentService;
import com.gxun.jms.service.TeacherAssignmentService;
import com.gxun.jms.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

@RestController
public class LoginController {

    @Autowired
    private LoginService loginService;
    @Autowired
    private StudentAssignmentService studentAssignmentService;
    @Autowired
    private TeacherAssignmentService teacherAssignmentService;
    @Autowired
    private AdminMapper adminMapper;

    @GetMapping("/index")
    public ModelAndView visit(){
        ModelAndView mav = new ModelAndView("Login");
        return mav;
    }

    @PostMapping("/Login")
    public ModelAndView studentLogin(HttpServletResponse response, HttpServletRequest request)
    {
        Md5Util md5Util = new Md5Util();
        ModelAndView mav = new ModelAndView("Login");
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setCharacterEncoding("utf-8");

        String userType = request.getParameter("typeGroup1");
        String loginID = request.getParameter("loginID");
        request.getSession().setAttribute("ID", loginID);
        String password = request.getParameter("password");
        if(userType == null)
        {
            mav = new ModelAndView("Login");
            request.setAttribute("type", "0");
            return mav;
        }
        if(loginID == null)
        {
            mav = new ModelAndView("Login");
            request.setAttribute("loginID", "0");
            return mav;
        }
        if(password == null)
        {
            mav = new ModelAndView("Login");
            request.setAttribute("password", "0");
            return mav;
        }

        if(userType.equals("student"))
        {
            Student student = loginService.studentLogin(loginID, md5Util.encrypt(password));
            if(student != null)
            {
                request.getSession().setAttribute("studentName", student.getStudentName());
                request.getSession().setAttribute("studentID", student.getStudentID());
                request.getSession().setAttribute("classID", student.getClassID());
                request.getSession().setAttribute("collegeID", student.getCollegeID());
                request.getSession().setAttribute("studentLoginID", student.getStudentLoginID());
                request.getSession().setAttribute("studentPassword", student.getStudentPassword());
                request.getSession().setAttribute("type", userType);

                String className = studentAssignmentService.getAClass(student.getClassID());
                request.getSession().setAttribute("className", className);
                String collegeName = studentAssignmentService.getACollege(student.getCollegeID());
                request.getSession().setAttribute("collegeName", collegeName);

                ArrayList<StudentAssignment> doneStudentAssignments = new ArrayList<>();
                doneStudentAssignments = studentAssignmentService.getDoneAssignment(student.getStudentID());
                request.getSession().setAttribute("doneStudentAssignments", doneStudentAssignments);
//                for(StudentAssignment studentAssignment : doneStudentAssignments)
//                {
//                    System.out.println(studentAssignment.toString());
//                }

                ArrayList<StudentAssignment> undoneStudentAssignments = new ArrayList<>();
                undoneStudentAssignments = studentAssignmentService.getUndoneAssignment(student.getStudentID());
                request.getSession().setAttribute("undoneStudentAssignments", undoneStudentAssignments);
//                for(StudentAssignment studentAssignment : undoneStudentAssignments)
//                {
//
//                    System.out.println(studentAssignment.toString());
//                }

                mav = new ModelAndView("StudentIndex");
                return mav;
            }
            else
            {
                mav = new ModelAndView("Login");
                request.setAttribute("wrong", "0");
                return mav;
            }
        }
        else if(userType.equals("teacher"))
        {
            Teacher teacher = loginService.teacherLogin(loginID, md5Util.encrypt(password));
            if(teacher != null)
            {
                request.getSession().setAttribute("teacherName", teacher.getTeacherName());
                request.getSession().setAttribute("teacherID", teacher.getTeacherID());
                request.getSession().setAttribute("teacherPassword", teacher.getTeacherPassword());
                request.getSession().setAttribute("collegeID", teacher.getCollegeID());
                request.getSession().setAttribute("teacherLoginID", teacher.getTeacherLoginID());
                request.getSession().setAttribute("type", userType);

                String collegeName = studentAssignmentService.getACollege(teacher.getCollegeID());
                request.getSession().setAttribute("collegeName", collegeName);

                ArrayList<StudentAssignment> doneTeacherAssignments = new ArrayList<>();
                doneTeacherAssignments = teacherAssignmentService.getDoneTeacherAssignment(teacher.getTeacherID());
                request.getSession().setAttribute("doneTeacherAssignments", doneTeacherAssignments);

                ArrayList<StudentAssignment> undoneTeacherAssignments = new ArrayList<>();
                undoneTeacherAssignments = teacherAssignmentService.getUndoneTeacherAssignment(teacher.getTeacherID());
                request.getSession().setAttribute("undoneTeacherAssignments", undoneTeacherAssignments);

                ArrayList<ClassBean> classList = teacherAssignmentService.getAllClass(teacher.getTeacherID());
                request.getSession().setAttribute("classList", classList);
                ArrayList<Course> courseList = teacherAssignmentService.getAllCourse(teacher.getTeacherID());
                request.getSession().setAttribute("courseList", courseList);

                mav = new ModelAndView("TeacherIndex");
                return mav;
            }
            else
            {
                mav = new ModelAndView("Login");
                request.setAttribute("wrong", "0");
                return mav;
            }
        }
        else if(userType.equals("admin"))
        {
            if(loginID.equals("admin") && password.equals("admin"))
            {
                ArrayList<ClassBean> classes = teacherAssignmentService.getAllClass(1);
                request.getSession().setAttribute("classes", classes);

                ArrayList<College> colleges = adminMapper.getCollege();
                request.getSession().setAttribute("colleges", colleges);

                ArrayList<StudentView> studentViews = adminMapper.getStudent(null);
                request.getSession().setAttribute("students", studentViews);

                ArrayList<TeacherView> teacherViews = adminMapper.getTeacher(null);
                request.getSession().setAttribute("teachers", teacherViews);

                mav = new ModelAndView("AdminIndex");
                return mav;
            }
            else
            {
                mav = new ModelAndView("Login");
                request.setAttribute("wrong", "0");
                return mav;
            }
        }
        return mav;
    }

}
