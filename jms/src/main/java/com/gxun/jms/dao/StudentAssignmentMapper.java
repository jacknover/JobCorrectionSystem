package com.gxun.jms.dao;

import com.gxun.jms.pojo.HomeworkView;
import com.gxun.jms.pojo.Question;
import com.gxun.jms.pojo.StudentAssignment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface StudentAssignmentMapper {

    public ArrayList<StudentAssignment> getDoneAssignment(@Param("studentID")int studentID);

    public ArrayList<StudentAssignment> getUndoneAssignment(@Param("studentID")int studentID);

    public ArrayList<StudentAssignment> searchDoneAssignment(@Param("studentAssignment") StudentAssignment studentAssignment);

    public ArrayList<StudentAssignment> searchUndoneAssignment(@Param("studentAssignment")StudentAssignment studentAssignment);

    public ArrayList<HomeworkView> getHomework(@Param("studentID") int studentID, @Param("homeworkID") int homeworkID);

    public void submitHomework(@Param("studentID") int studentID, @Param("homeworkID") int homeworkID, @Param("questionID") int question, @Param("answer") String answer);

    public void confirmHomework(@Param("studentID") int studentID, @Param("homeworkID") int homeworkID, @Param("time") String time);

    public String getACollege(@Param("collegeID") int collegeID);

    public String getAClass(@Param("classID") int classID);

    public void updatePassword(@Param("studentID") int studentID, @Param("password") String password);
}
