package com.gxun.jms.controller;

import com.gxun.jms.pojo.*;
import com.gxun.jms.service.AdminService;
import com.gxun.jms.util.IsNumberUtil;
import com.gxun.jms.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.event.MouseListener;
import java.util.ArrayList;

@RestController
public class AdminController {
    @Autowired
    private AdminService adminService;

    @PostMapping("/searchStudent")
    public ModelAndView searchStudent(HttpServletRequest request, HttpServletResponse response)
    {
        StudentView studentView = new StudentView();
        IsNumberUtil isNumberUtil = new IsNumberUtil();

        Boolean flag = isNumberUtil.isInteger(request.getParameter("studentID"));
        if(!request.getParameter("studentID").trim().equals("") && flag)
        {
            studentView.setStudentID(Integer.parseInt(request.getParameter("studentID")));
        }
        if(!request.getParameter("studentName").trim().equals(""))
        {
            studentView.setStudentName(request.getParameter("studentName"));
        }
        if(!request.getParameter("className").trim().equals(""))
        {
            studentView.setClassName(request.getParameter("className"));
        }
        if(!request.getParameter("collegeName").trim().equals(""))
        {
            studentView.setCollegeName(request.getParameter("collegeName"));
        }

        if(Integer.parseInt(request.getParameter("stateSelect")) != 0)
        {
            studentView.setActiveFlag(Integer.parseInt(request.getParameter("stateSelect")));
        }

        ArrayList<StudentView> studentViews = adminService.getStudent(studentView);
        request.getSession().setAttribute("students", studentViews);
        ModelAndView mav = new ModelAndView("AdminIndex");
        return mav;
    }

    @PostMapping("/searchTeacher")
    public ModelAndView searchTeacher(HttpServletRequest request, HttpServletResponse response)
    {
        TeacherView teacherView = new TeacherView();
        IsNumberUtil isNumberUtil = new IsNumberUtil();
        Boolean flag = isNumberUtil.isInteger(request.getParameter("teacherID"));
        if(!request.getParameter("teacherID").trim().equals("") && flag)
        {
            teacherView.setTeacherID(Integer.parseInt(request.getParameter("teacherID")));
        }
        if(!request.getParameter("teacherName").trim().equals(""))
        {
            teacherView.setTeacherName(request.getParameter("teacherName"));
        }
        if(!request.getParameter("collegeName").trim().equals(""))
        {
            teacherView.setCollegeName(request.getParameter("collegeName"));
        }

        if(Integer.parseInt(request.getParameter("stateSelect")) != 0)
        {
            teacherView.setActiveFlag(Integer.parseInt(request.getParameter("stateSelect")));
        }

        ArrayList<TeacherView> teacherViews = adminService.getTeacher(teacherView);
        request.getSession().setAttribute("teachers", teacherViews);
        ModelAndView mav = new ModelAndView("AdminIndex1");
        return mav;
    }

    @PostMapping("/addStudent")
    public ModelAndView AddStudent(HttpServletRequest request, HttpServletResponse response)
    {
        Md5Util md5Util = new Md5Util();
        String studentName = request.getParameter("studentName");
        IsNumberUtil isNumberUtil = new IsNumberUtil();
        boolean flag = isNumberUtil.isChinese(studentName);
        if(studentName.trim().equals("") || studentName == null || !flag)
        {
            ModelAndView mav = new ModelAndView("AddStudent");
            request.setAttribute("wrong", 1);
            return mav;
        }
        int collegeID = Integer.parseInt(request.getParameter("collegeSelect"));
        int classID = Integer.parseInt(request.getParameter("classSelect"));
        Student student = new Student();
        student.setStudentName(studentName);
        student.setCollegeID(collegeID);
        student.setClassID(classID);
        student.setStudentPassword(md5Util.encrypt("123456"));
        adminService.insertStudent(student);

        Student a = adminService.getAStudent(student);
        a.setStudentLoginID(""+a.getCollegeID()+""+a.getClassID()+""+a.getStudentID());

        adminService.insertStudentTwo(a);
        ModelAndView mav = new ModelAndView("AdminIndex");

        ArrayList<StudentView> studentViews = adminService.getStudent(null);
        request.getSession().setAttribute("students", studentViews);
        request.setAttribute("msg", 1);
        return mav;
    }

    @PostMapping("/addTeacher")
    public ModelAndView addTeacher(HttpServletRequest request, HttpServletResponse response)
    {
        Md5Util md5Util = new Md5Util();
        String teacherName = request.getParameter("teacherName");
        IsNumberUtil isNumberUtil = new IsNumberUtil();
        boolean flag = isNumberUtil.isChinese(teacherName);
        if(teacherName.trim().equals("") || teacherName == null || !flag)
        {
            ModelAndView mav = new ModelAndView("AddTeacher");
            request.setAttribute("wrong", 1);
            return mav;
        }
        int collegeID = Integer.parseInt(request.getParameter("collegeSelect"));
        Teacher teacher = new Teacher();
        teacher.setTeacherName(teacherName);
        teacher.setCollegeID(collegeID);
        teacher.setTeacherPassword(md5Util.encrypt("123456"));
        adminService.insertTeacher(teacher);

        Teacher a = adminService.getATeacher(teacher);
        a.setTeacherLoginID(""+a.getCollegeID()+""+a.getTeacherID());

        adminService.insertTeacherTwo(a);
        ModelAndView mav = new ModelAndView("AdminIndex1");

        ArrayList<TeacherView> teacherViews = adminService.getTeacher(null);
        request.getSession().setAttribute("teachers", teacherViews);
        request.setAttribute("msg", 1);
        return mav;
    }

    @GetMapping("/deleteStudent")
    public ModelAndView deleteStudent(HttpServletRequest request, HttpServletResponse response)
    {
        int studentID = Integer.parseInt(request.getParameter("studentID"));
        adminService.deleteStudent(studentID);
        request.setAttribute("delete", 1);
        ModelAndView mav = new ModelAndView("AdminIndex");

        ArrayList<StudentView> studentViews = adminService.getStudent(null);
        request.getSession().setAttribute("students", studentViews);

        return mav;
    }

    @GetMapping("/deleteTeacher")
    public ModelAndView deleteTeacher(HttpServletRequest request, HttpServletResponse response)
    {
        int teacherID = Integer.parseInt(request.getParameter("teacherID"));
        adminService.deleteTeacher(teacherID);
        request.setAttribute("delete", 1);
        ModelAndView mav = new ModelAndView("AdminIndex1");


        ArrayList<TeacherView> teacherViews = adminService.getTeacher(null);
        request.getSession().setAttribute("teachers", teacherViews);

        return mav;
    }

    @GetMapping("/questionBank")
    public ModelAndView questionBank(HttpServletRequest request, HttpServletResponse response)
    {
        ArrayList<Question> questions = adminService.getAllQuestion(null);
        request.setAttribute("questions", questions);
        ModelAndView mav = new ModelAndView("QuestionBank");
        return mav;
    }

    @PostMapping("/searchAllQuestion")
    public ModelAndView searchAllQuestion(HttpServletRequest request, HttpServletResponse response)
    {
        Question question = new Question();
        question.setCourseID(Integer.parseInt(request.getParameter("course")));
        question.setQuestionType(Integer.parseInt(request.getParameter("type")));
        question.setQuestionDifficulty(Integer.parseInt(request.getParameter("difficuty")));
        if(request.getParameter("name") != null)
            question.setQuestionContent(request.getParameter("name"));
        ArrayList<Question> questions = adminService.getAllQuestion(question);
        request.setAttribute("questions", questions);
        ModelAndView mav = new ModelAndView("QuestionBank");
        return mav;
    }
}
