package com.gxun.jms.service;

import com.gxun.jms.dao.StudentAssignmentMapper;
import com.gxun.jms.pojo.HomeworkView;
import com.gxun.jms.pojo.Question;
import com.gxun.jms.pojo.StudentAssignment;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class StudentAssignmentService {
    @Autowired
    private StudentAssignmentMapper studentAssignmentMapper;

    public ArrayList<StudentAssignment> getDoneAssignment(int studentID)
    {
        return studentAssignmentMapper.getDoneAssignment(studentID);
    }

    public ArrayList<StudentAssignment> getUndoneAssignment(int studentID)
    {
        return studentAssignmentMapper.getUndoneAssignment(studentID);
    }

    public ArrayList<StudentAssignment> searchDoneAssignment(StudentAssignment studentAssignment)
    {
        return studentAssignmentMapper.searchDoneAssignment(studentAssignment);
    }

    public ArrayList<StudentAssignment> searchUndoneAssignment(StudentAssignment studentAssignment)
    {
        return studentAssignmentMapper.searchUndoneAssignment(studentAssignment);
    }

    public ArrayList<HomeworkView> getHomework(int studentID, int homeworkID)
    {
        return studentAssignmentMapper.getHomework(studentID, homeworkID);
    }

    public void submitHomework(int studentID, int homeworkID, int questionID, String answer)
    {
        studentAssignmentMapper.submitHomework(studentID, homeworkID, questionID, answer);
    }

    public void confirmHomework(int studentID, int homeworkID, String time)
    {
        studentAssignmentMapper.confirmHomework(studentID, homeworkID, time);
    }

    public String getACollege(int collegeID)
    {
        return studentAssignmentMapper.getACollege(collegeID);
    }

    public String getAClass(int classID)
    {
        return studentAssignmentMapper.getAClass(classID);
    }

    public void updatePassword(int studentID, String password)
    {
        studentAssignmentMapper.updatePassword(studentID, password);
    }
}
