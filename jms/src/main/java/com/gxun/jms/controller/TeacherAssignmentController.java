package com.gxun.jms.controller;

import com.gxun.jms.pojo.*;
import com.gxun.jms.service.TeacherAssignmentService;
import com.gxun.jms.util.IsNumberUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@RestController
public class TeacherAssignmentController {
    @Autowired
    private TeacherAssignmentService teacherAssignmentService;


    @PostMapping("/searchDoneTeacherAssignment")
    public ModelAndView searchDoneTeacherAssignment(HttpServletRequest request, HttpServletResponse response)
    {

        StudentAssignment studentAssignment = new StudentAssignment();
        IsNumberUtil isNumberUtil = new IsNumberUtil();
        studentAssignment.setTeacherID((int)request.getSession().getAttribute("teacherID"));

        Boolean flag = isNumberUtil.isInteger(request.getParameter("homeworkID"));
        Boolean flag1 = isNumberUtil.isInteger(request.getParameter("studentID"));
        if(!request.getParameter("homeworkID").trim().equals("") && flag)
        {
            studentAssignment.setHomeworkID(Integer.parseInt(request.getParameter("homeworkID")));
        }
        if(!request.getParameter("studentID").trim().equals("") && flag1)
        {
            studentAssignment.setStudentID(Integer.parseInt(request.getParameter("studentID")));
        }
        if(!request.getParameter("homeworkDescribe").trim().equals(""))
        {
            studentAssignment.setHomeworkDescribe(request.getParameter("homeworkDescribe"));
        }
        if(!request.getParameter("courseName").trim().equals(""))
        {
            studentAssignment.setCourseName(request.getParameter("courseName"));
        }
        if(!request.getParameter("className").trim().equals(""))
        {
        studentAssignment.setClassName(request.getParameter("className"));
        }
        if(!request.getParameter("studentName").trim().equals(""))
        {
            studentAssignment.setStudentName(request.getParameter("studentName"));
        }
        ArrayList<StudentAssignment> searchedDoneTeacherAssignments = teacherAssignmentService.searchDoneTeacherAssignment(studentAssignment);
        request.getSession().setAttribute("doneTeacherAssignments", searchedDoneTeacherAssignments);
        return new ModelAndView("TeacherIndex");
    }

    @PostMapping("/searchUndoneTeacherAssignment")
        public ModelAndView searchUndoneTeacherAssignment(HttpServletRequest request, HttpServletResponse response)
        {

            StudentAssignment studentAssignment = new StudentAssignment();
            IsNumberUtil isNumberUtil = new IsNumberUtil();
            studentAssignment.setTeacherID((int)request.getSession().getAttribute("teacherID"));

            Boolean flag = isNumberUtil.isInteger(request.getParameter("homeworkID"));
            Boolean flag1 = isNumberUtil.isInteger(request.getParameter("studentID"));
            if(!request.getParameter("homeworkID").trim().equals("") && flag)
            {
                studentAssignment.setHomeworkID(Integer.parseInt(request.getParameter("homeworkID")));
            }
            if(!request.getParameter("studentID").trim().equals("") && flag1)
            {
                studentAssignment.setStudentID(Integer.parseInt(request.getParameter("studentID")));
            }
            if(!request.getParameter("homeworkDescribe").trim().equals(""))
            {
                studentAssignment.setHomeworkDescribe(request.getParameter("homeworkDescribe"));
            }
            if(!request.getParameter("courseName").trim().equals(""))
            {
                studentAssignment.setCourseName(request.getParameter("courseName"));
            }
            if(!request.getParameter("className").trim().equals(""))
            {
                studentAssignment.setClassName(request.getParameter("className"));
            }
            if(!request.getParameter("studentName").trim().equals(""))
            {
                studentAssignment.setStudentName(request.getParameter("studentName"));
            }
            if(Integer.parseInt(request.getParameter("stateSelect")) != 0)
            {
                studentAssignment.setAssignSubmissionFlag(Integer.parseInt(request.getParameter("stateSelect")));
            }
            ArrayList<StudentAssignment> undoneTeacherAssignments = teacherAssignmentService.searchUndoneTeacherAssignment(studentAssignment);
            request.getSession().setAttribute("undoneTeacherAssignments", undoneTeacherAssignments);
            return new ModelAndView("TeacherIndex1");
        }

        @PostMapping("/AssignHomeworkStepOne")
        public ModelAndView assignHomeworkStepOne(HttpServletRequest request, HttpServletResponse response)
        {
            int classID = Integer.parseInt(request.getParameter("classSelect"));
            ArrayList<Student> students = teacherAssignmentService.getStudents(classID);
            request.getSession().setAttribute("students", students);
            int courseID = Integer.parseInt(request.getParameter("courseSelect"));
            String homeworkName = request.getParameter("homeworkName");
            String deadTime = request.getParameter("deadTime");
            DateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
                try {
                    date=format.parse(deadTime);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            if(deadTime == null || deadTime.trim().equals(""))
            {
                ModelAndView mav = new ModelAndView("AssignHomeworkStepOne");
                request.setAttribute("wrong", 1);
                return mav;
            }

            Homework homework = new Homework();
            homework.setCourseID(courseID);
            homework.setHomeworkDescribe(homeworkName);
            teacherAssignmentService.insertHomework(homework);
            Homework homework1 = new Homework();
            homework1 = teacherAssignmentService.getHomework(courseID, homeworkName);
            int homeworkID = homework1.getHomeworkID();
            request.getSession().setAttribute("homeworkID", homeworkID);
            request.getSession().setAttribute("courseID", courseID);
            Question question = new Question();
            question.setCourseID(courseID);
            ArrayList<Question> questions = teacherAssignmentService.getQuestion(question);
            request.setAttribute("questions", questions);

            Assign assign = new Assign();
            assign.setTeacherID((int)request.getSession().getAttribute("teacherID"));
            assign.setHomeworkID(homeworkID);
            assign.setAssignScore(-1);
            assign.setAssignExampleFlag(0);
            assign.setAssignCheckFlag(0);
            assign.setAssignSubmissionFlag(-1);
            assign.setAssignDeadTime(deadTime);
            for(int i = 0; i < students.size(); i++)
            {
                assign.setStudentID(students.get(i).getStudentID());
                teacherAssignmentService.insertAssign(assign);
            }

            ModelAndView mav = new  ModelAndView("AssignHomeworkStepTwo");
            return mav;
        }

        @PostMapping("/addQuestion")
        public ModelAndView addQuestion(HttpServletRequest request, HttpServletResponse response)
        {
            int homeworkID = (int)request.getSession().getAttribute("homeworkID");
            String[] questionNums = request.getParameterValues("addhomework");
            if(questionNums == null)
            {
                ModelAndView mav = new ModelAndView("AssignHomeworkStepOne");
                request.setAttribute("wrong1",1);
                return mav;
            }
            for(String temp : questionNums)
            {
                teacherAssignmentService.insertHomeworkContent(homeworkID, Integer.parseInt(temp));
            }
            ArrayList<Student> students = (ArrayList) request.getSession().getAttribute("students");
            for(Student temp : students)
            {
                for(String str : questionNums)
                {
                    teacherAssignmentService.insertWrite(temp.getStudentID(), homeworkID, Integer.parseInt(str));
                }
            }

            ArrayList<StudentAssignment> undoneTeacherAssignments = new ArrayList<>();
            undoneTeacherAssignments = teacherAssignmentService.getUndoneTeacherAssignment((int)request.getSession().getAttribute("teacherID"));
            request.getSession().setAttribute("undoneTeacherAssignments", undoneTeacherAssignments);

            ModelAndView mav = new ModelAndView("TeacherIndex1");
            request.setAttribute("msg",1);
            return mav;

        }

        @PostMapping("/searchQuestion")
        public ModelAndView searchQuestion(HttpServletRequest request, HttpServletResponse response)
        {
            Question question = new Question();
            question.setCourseID((int)request.getSession().getAttribute("courseID"));
            question.setQuestionType(Integer.parseInt(request.getParameter("type")));
            question.setQuestionDifficulty(Integer.parseInt(request.getParameter("difficuty")));
            if(request.getParameter("name") != null)
                question.setQuestionContent(request.getParameter("name"));

            ArrayList<Question> questions = teacherAssignmentService.getQuestion(question);
            request.setAttribute("questions",questions);
            ModelAndView mav = new ModelAndView("AssignHomeworkStepTwo");
            return mav;
        }

        @GetMapping("/checkHomework")
        public ModelAndView checkHomework(HttpServletRequest request, HttpServletResponse response)
        {
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            int homeworkID = Integer.parseInt(request.getParameter("homeworkID"));
            request.getSession().setAttribute("homeworkID", homeworkID);
            request.getSession().setAttribute("studentID", studentID);
            String homeworkName = request.getParameter("homeworkName");
            ArrayList<HomeworkView> homeworkViews = teacherAssignmentService.getStudentHomework(studentID, homeworkID);
            request.getSession().setAttribute("list", homeworkViews);
            request.setAttribute("homeworkName", homeworkName);
            ModelAndView mav = new ModelAndView("CheckHomework");
            return mav;
        }

        @PostMapping("/submitCheckedHomework")
        public ModelAndView submitCheckedHomework(HttpServletRequest request, HttpServletResponse response)
        {
            int sum = 0;
            int res = 0;
            WriteQuestion writeQuestion;
            String scores[] = request.getParameterValues("scores");
            ArrayList<HomeworkView> homeworkViews = (ArrayList<HomeworkView>) request.getSession().getAttribute("list");
            for(int i = 0; i < homeworkViews.size(); i++)
            {
                sum += homeworkViews.get(i).getExpr1();
                res += Integer.parseInt(scores[i]);
                writeQuestion = new WriteQuestion();
                writeQuestion.setHomeworkID((int)request.getSession().getAttribute("homeworkID"));
                writeQuestion.setStudentID((int)request.getSession().getAttribute("studentID"));
                writeQuestion.setQuestionID(homeworkViews.get(i).getQuestionID());
                writeQuestion.setQuestionScore(Float.parseFloat(scores[i]));
                teacherAssignmentService.updateQuestionScore(writeQuestion);
            }

            float totalScore = (float) res/sum * 100;
            BigDecimal b2 = new BigDecimal(totalScore);
            float f1 = b2.setScale(1, BigDecimal.ROUND_HALF_UP).floatValue();

            Assign assign = new Assign();
            assign.setHomeworkID((int)request.getSession().getAttribute("homeworkID"));
            assign.setStudentID((int)request.getSession().getAttribute("studentID"));
            assign.setTeacherID((int)request.getSession().getAttribute("teacherID"));
            assign.setAssignScore(f1);

            teacherAssignmentService.updateQuestionScoreTwo(assign);

            ArrayList<StudentAssignment> doneTeacherAssignments = new ArrayList<>();
            doneTeacherAssignments = teacherAssignmentService.getDoneTeacherAssignment((int)request.getSession().getAttribute("teacherID"));
            request.getSession().setAttribute("doneTeacherAssignments", doneTeacherAssignments);

            ArrayList<StudentAssignment> undoneTeacherAssignments = new ArrayList<>();
            undoneTeacherAssignments = teacherAssignmentService.getUndoneTeacherAssignment((int)request.getSession().getAttribute("teacherID"));
            request.getSession().setAttribute("undoneTeacherAssignments", undoneTeacherAssignments);

            ModelAndView mav = new ModelAndView("TeacherIndex1");
            return mav;
        }

    @GetMapping("/teacherWatchHomework")
    public ModelAndView teacherWatchHomework(HttpServletRequest request, HttpServletResponse response)
    {
        int studentID = Integer.parseInt(request.getParameter("studentID"));
        int homeworkID = Integer.parseInt(request.getParameter("homeworkID"));
        String homeworkName = request.getParameter("homeworkName");
        ArrayList<HomeworkView> homeworkViews = teacherAssignmentService.getStudentHomework(studentID, homeworkID);
        request.setAttribute("list", homeworkViews);
        request.setAttribute("homeworkName", homeworkName);
        ModelAndView mav = new ModelAndView("TeacherWatchHomework");
        return mav;
    }

    @GetMapping("/homeworkDetail")
    public ModelAndView homeworkDetail(HttpServletRequest request, HttpServletResponse response)
    {
        String className = request.getParameter("className").trim();
        int homeworkID = Integer.parseInt(request.getParameter("homeworkID"));
        String homeworkName = request.getParameter("homeworkName");

        ArrayList<StudentAssignment> studentAssignments = teacherAssignmentService.getHomeworkDetail(className, homeworkID);
        ModelAndView mav = new ModelAndView("HomeworkDetail");
        request.setAttribute("studentAssignments", studentAssignments);
        request.setAttribute("className", className);
        request.setAttribute("homeworkName",homeworkName);
        return mav;
    }
    }


