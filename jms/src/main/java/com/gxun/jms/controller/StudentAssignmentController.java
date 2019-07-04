package com.gxun.jms.controller;

import com.gxun.jms.pojo.HomeworkView;
import com.gxun.jms.pojo.StudentAssignment;
import com.gxun.jms.service.StudentAssignmentService;
import com.gxun.jms.service.TeacherAssignmentService;
import com.gxun.jms.util.IsNumberUtil;
import com.gxun.jms.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

@RestController
public class StudentAssignmentController {
    @Autowired
    private StudentAssignmentService studentAssignmentService;
    @Autowired
    private TeacherAssignmentService teacherAssignmentService;

    @PostMapping("/searchDoneStudentAssignment")
    public ModelAndView searchDoneStudentAssignment(HttpServletRequest request, HttpServletResponse response)
    {
        IsNumberUtil isNumberUtil = new IsNumberUtil();
        StudentAssignment studentAssignment = new StudentAssignment();
        studentAssignment.setStudentID((int)request.getSession().getAttribute("studentID"));

        Boolean flag = isNumberUtil.isInteger(request.getParameter("homeworkID"));
        if(!request.getParameter("homeworkID").trim().equals("") && flag)
        {
            studentAssignment.setHomeworkID(Integer.parseInt(request.getParameter("homeworkID")));
        }
        if(!request.getParameter("homeworkDescribe").trim().equals(""))
        {
            studentAssignment.setHomeworkDescribe(request.getParameter("homeworkDescribe"));
        }
        if(!request.getParameter("courseName").trim().equals(""))
        {
            studentAssignment.setCourseName(request.getParameter("courseName"));
        }
        if(!request.getParameter("teacherName").trim().equals(""))
        {
            studentAssignment.setTeacherName(request.getParameter("teacherName"));
        }
        ArrayList<StudentAssignment> searchedDoneStudentAssignments = studentAssignmentService.searchDoneAssignment(studentAssignment);
        request.getSession().setAttribute("doneStudentAssignments", searchedDoneStudentAssignments);
        return new ModelAndView("StudentIndex");
    }

    @PostMapping("/searchUndoneStudentAssignment")
    public ModelAndView searchUndoneStudentAssignment(HttpServletRequest request, HttpServletResponse response){
        IsNumberUtil isNumberUtil = new IsNumberUtil();
        StudentAssignment studentAssignment = new StudentAssignment();
        studentAssignment.setStudentID((int)request.getSession().getAttribute("studentID"));

        Boolean flag = isNumberUtil.isInteger(request.getParameter("homeworkID"));
        if(!request.getParameter("homeworkID").trim().equals("") && flag)
        {
            studentAssignment.setHomeworkID(Integer.parseInt(request.getParameter("homeworkID")));
        }
        if(!request.getParameter("homeworkDescribe").trim().equals(""))
        {
            studentAssignment.setHomeworkDescribe(request.getParameter("homeworkDescribe"));
        }
        if(!request.getParameter("courseName").trim().equals(""))
        {
            studentAssignment.setCourseName(request.getParameter("courseName"));
        }
        if(!request.getParameter("teacherName").trim().equals(""))
        {
            studentAssignment.setTeacherName(request.getParameter("teacherName"));
        }
        ArrayList<StudentAssignment> searchedUndoneStudentAssignments = studentAssignmentService.searchUndoneAssignment(studentAssignment);
        request.getSession().setAttribute("undoneStudentAssignments", searchedUndoneStudentAssignments);
        for(StudentAssignment temp : searchedUndoneStudentAssignments)
        {
            System.out.println(temp.toString());
        }
        return new ModelAndView("StudentIndex1");
    }

    @GetMapping("/writeHomework")
    public ModelAndView writeHomework(HttpServletRequest request, HttpServletResponse response)
    {
        int studentID = Integer.parseInt(request.getParameter("studentID"));
        int homeworkID = Integer.parseInt(request.getParameter("homeworkID"));
        request.getSession().setAttribute("homeworkID", homeworkID);
        String homeworkName = request.getParameter("homeworkName");
        ArrayList<HomeworkView> homeworkViews = studentAssignmentService.getHomework(studentID, homeworkID);
        request.getSession().setAttribute("list", homeworkViews);
        request.setAttribute("homeworkName", homeworkName);
        ModelAndView mav = new ModelAndView("WriteHomework");
        return mav;
    }

    @PostMapping("/submitHomework")
    public ModelAndView submitHomework(HttpServletRequest request, HttpServletResponse response)
    {
        int studentID = (int)request.getSession().getAttribute("studentID");
        int homeworkID = (int) request.getSession().getAttribute("homeworkID");
        String answers[] = request.getParameterValues("answers");
        ArrayList<HomeworkView> homeworkViews = (ArrayList<HomeworkView>) request.getSession().getAttribute("list");
        for(int i = 0; i < homeworkViews.size(); i++){
            studentAssignmentService.submitHomework(studentID, homeworkID, homeworkViews.get(i).getQuestionID(), answers[i]);
        }

        ModelAndView mav = new ModelAndView("StudentIndex1");
        request.setAttribute("msg", "1");
        return mav;
    }

    @GetMapping("/comfirmHomework")
    public ModelAndView confirmHomework(HttpServletRequest request, HttpServletResponse response)
    {
        int studentID = (int)request.getSession().getAttribute("studentID");
        int homeworkID = (int) request.getSession().getAttribute("homeworkID");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        studentAssignmentService.confirmHomework(studentID, homeworkID, df.format(new Date()));

        ArrayList<StudentAssignment> doneStudentAssignments = new ArrayList<>();
        doneStudentAssignments = studentAssignmentService.getDoneAssignment(studentID);
        request.getSession().setAttribute("doneStudentAssignments", doneStudentAssignments);

        ArrayList<StudentAssignment> undoneStudentAssignments = new ArrayList<>();
        undoneStudentAssignments = studentAssignmentService.getUndoneAssignment(studentID);
        request.getSession().setAttribute("undoneStudentAssignments", undoneStudentAssignments);

        ModelAndView mav = new ModelAndView("StudentIndex");
        request.setAttribute("msg", "2");
        return mav;

    }

    @GetMapping("/studentWatchHomework")
    public ModelAndView studentWatchHomework(HttpServletRequest request, HttpServletResponse response)
    {
        int studentID = Integer.parseInt(request.getParameter("studentID"));
        int homeworkID = Integer.parseInt(request.getParameter("homeworkID"));
        String homeworkName = request.getParameter("homeworkName");
        ArrayList<HomeworkView> homeworkViews = teacherAssignmentService.getStudentHomework(studentID, homeworkID);
        request.setAttribute("list", homeworkViews);
        request.setAttribute("homeworkName", homeworkName);
        ModelAndView mav = new ModelAndView("StudentWatchHomework");
        return mav;
    }

    @PostMapping("/updatePassword")
    public ModelAndView updatePassword(HttpServletRequest request, HttpServletResponse response)
    {
        Md5Util md5Util = new Md5Util();
        String userType = (String) request.getSession().getAttribute("type");
        String oldPassword = request.getParameter("pastpws");
        String newPassword = request.getParameter("newpws");
        String new1Password = request.getParameter("pws");

        if(userType.equals("student"))
        {
            ModelAndView mav = new ModelAndView("StudentMessage");
            String studentPassword = (String)request.getSession().getAttribute("studentPassword");
            if(!studentPassword.equals(md5Util.encrypt(oldPassword)) || !newPassword.equals(new1Password))
            {
                request.setAttribute("wrong", 1);
                return mav;
            }
            else
            {
                studentAssignmentService.updatePassword((int)request.getSession().getAttribute("studentID"), md5Util.encrypt(newPassword));
                request.setAttribute("ok", 1);
                return mav;
            }
        }

        else if(userType.equals("teacher"))
        {
            ModelAndView mav = new ModelAndView("TeacherMessage");
            String teacherPassword = (String) request.getSession().getAttribute("teacherPassword");
            if(!teacherPassword.equals(md5Util.encrypt(oldPassword)) || !newPassword.equals(new1Password))
            {
                request.setAttribute("wrong", 1);
                return mav;
            }
            else
            {
                teacherAssignmentService.updatePassword((int)request.getSession().getAttribute("teacherID"), md5Util.encrypt(newPassword));
                request.setAttribute("ok",1);
                return mav;
            }
        }

        return null;
    }
}
