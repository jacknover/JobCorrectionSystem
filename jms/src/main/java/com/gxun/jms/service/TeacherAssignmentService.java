package com.gxun.jms.service;

import com.gxun.jms.dao.TeacherAssignmentMapper;
import com.gxun.jms.pojo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class TeacherAssignmentService {

    @Autowired
    private TeacherAssignmentMapper teacherAssignmentMapper;

    public ArrayList<StudentAssignment> getDoneTeacherAssignment(int teacherID){
        return teacherAssignmentMapper.getDoneTeacherAssignment(teacherID);
    }

    public ArrayList<StudentAssignment> getUndoneTeacherAssignment(int teacherID){
        return teacherAssignmentMapper.getUndoneTeacherAssignment(teacherID);
    }

    public ArrayList<StudentAssignment> searchDoneTeacherAssignment(StudentAssignment teacherAssignment)
    {
        return teacherAssignmentMapper.searchDoneTeacherAssignment(teacherAssignment);
    }

    public ArrayList<StudentAssignment> searchUndoneTeacherAssignment(StudentAssignment teacherAssignment){
        return teacherAssignmentMapper.searchUndoneTeacherAssignment(teacherAssignment);
    }

    public ArrayList<ClassBean> getAllClass(int teacherID) {
        return teacherAssignmentMapper.getAllClass(teacherID);
    }

    public ArrayList<Course> getAllCourse(int teacherID) {
        return teacherAssignmentMapper.getAllCourse(teacherID);
    }

    public ArrayList<Student> getStudents(int classID) {
        return teacherAssignmentMapper.getStudents(classID);
    }

    public void insertAssign(Assign assign){
         teacherAssignmentMapper.insertAssign(assign);
    }

    public void insertHomework(Homework homework) {
        teacherAssignmentMapper.insertHomework(homework);
    }

    public Homework getHomework(int courseID, String homeworkName)
    {
        return teacherAssignmentMapper.getHomework(courseID, homeworkName);
    }

    public ArrayList<Question> getQuestion(Question question)
    {
        return teacherAssignmentMapper.getQuestion(question);
    }

    public void insertHomeworkContent(int homeworkID, int questionNum)
    {
        teacherAssignmentMapper.insertHomeworkContent(homeworkID, questionNum);
    }

    public void insertWrite(int studentID, int homeworkID, int questionID)
    {
        teacherAssignmentMapper.insertWrite(studentID, homeworkID, questionID);
    }

    public ArrayList<HomeworkView> getStudentHomework(int studentID, int homeworkID)
    {
        return teacherAssignmentMapper.getStudentHomework(studentID, homeworkID);
    }

    public void updateQuestionScore(WriteQuestion writeQuestion)
    {
        teacherAssignmentMapper.updateQuestionScore(writeQuestion);
    }

    public void updateQuestionScoreTwo(Assign assign)
    {
        teacherAssignmentMapper.updateQuestionScoreTwo(assign);
    }

    public void updatePassword( int teacherID, String password)
    {
        teacherAssignmentMapper.updatePassword(teacherID, password);
    }

    public ArrayList<StudentAssignment> getHomeworkDetail(String className,int homeworkID)
    {
        return teacherAssignmentMapper.getHomeworkDetail(className, homeworkID);
    }
}
