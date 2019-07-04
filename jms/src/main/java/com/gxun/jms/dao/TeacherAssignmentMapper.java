package com.gxun.jms.dao;

import com.gxun.jms.pojo.StudentAssignment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import com.gxun.jms.pojo.*;

@Mapper
public interface TeacherAssignmentMapper {

    public ArrayList<StudentAssignment> getDoneTeacherAssignment(@Param("teacherID") int teacherID);

    public ArrayList<StudentAssignment> getUndoneTeacherAssignment(@Param("teacherID") int teacherID);

    public ArrayList<StudentAssignment> searchDoneTeacherAssignment(@Param("teacherAssignment") StudentAssignment teacherAssignment);

    public ArrayList<StudentAssignment> searchUndoneTeacherAssignment(@Param("teacherAssignment") StudentAssignment teacherAssignment);

    public ArrayList<ClassBean> getAllClass(@Param("teacherID") int teacherID);

    public ArrayList<Course> getAllCourse(@Param("teacherID") int teacherID);

    public ArrayList<Student> getStudents(@Param("classID") int classID);

    public void insertHomework(@Param("homework") Homework homework);

    public void insertAssign(@Param("assignment") Assign assign);

    public Homework getHomework(@Param("courseID") int courseID, @Param("homeworkName") String homeworkName);

    public ArrayList<Question> getQuestion(@Param("question") Question question);

    public void insertHomeworkContent(@Param("homeworkID") int homeworkID, @Param("questionNum") int questionNum);

    public void insertWrite(@Param("studentID") int studentID, @Param("homeworkID") int homeworkID, @Param("questionID") int questionID);

    public ArrayList<HomeworkView> getStudentHomework(@Param("studentID") int studentID, @Param("homeworkID") int homeworkID);

    public void updateQuestionScore(@Param("writeQuestion") WriteQuestion writeQuestion);

    public void updateQuestionScoreTwo(@Param("score") Assign assign);

    public void updatePassword(@Param("teacherID") int teacherID, @Param("password") String password);

    public ArrayList<StudentAssignment> getHomeworkDetail(@Param("className") String className, @Param("homeworkID") int homeworkID);
}
