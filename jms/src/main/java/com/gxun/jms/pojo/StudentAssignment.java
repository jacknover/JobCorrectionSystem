package com.gxun.jms.pojo;

public class StudentAssignment {
    private int teacherID;
    private String teacherName;
    private int studentID;
    private int courseID;
    private String courseName;
    private int homeworkID;
    private String homeworkDescribe;
    private String assignSubmissionTime;
    private String assignDeadTime;
    private float assignScore;
    private int assignSubmissionFlag;
    private  int assignCheckFlag;
    private String className;
    private String studentName;

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getAssignCheckFlag() {
        return assignCheckFlag;
    }

    public void setAssignCheckFlag(int assignCheckFlag) {
        this.assignCheckFlag = assignCheckFlag;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getHomeworkID() {
        return homeworkID;
    }

    public void setHomeworkID(int homeworkID) {
        this.homeworkID = homeworkID;
    }

    public String getHomeworkDescribe() {
        return homeworkDescribe;
    }

    public void setHomeworkDescribe(String homeworkDescribe) {
        this.homeworkDescribe = homeworkDescribe;
    }

    public String getAssignSubmissionTime() {
        return assignSubmissionTime;
    }

    public void setAssignSubmissionTime(String assignSubmissionTime) {
        this.assignSubmissionTime = assignSubmissionTime;
    }

    public String getAssignDeadTime() {
        return assignDeadTime;
    }

    public void setAssignDeadTime(String assignDeadTime) {
        this.assignDeadTime = assignDeadTime;
    }

    public float getAssignScore() {
        return assignScore;
    }

    public void setAssignScore(float assignScore) {
        this.assignScore = assignScore;
    }

    public int getAssignSubmissionFlag() {
        return assignSubmissionFlag;
    }

    public void setAssignSubmissionFlag(int assignSubmissionFlag) {
        this.assignSubmissionFlag = assignSubmissionFlag;
    }

    @Override
    public String toString() {
        return "StudentAssignment{" +
                "teacherID=" + teacherID +
                ", teacherName='" + teacherName + '\'' +
                ", studentID=" + studentID +
                ", courseID=" + courseID +
                ", courseName='" + courseName + '\'' +
                ", homeworkID=" + homeworkID +
                ", homeworkDescribe='" + homeworkDescribe + '\'' +
                ", assignSubmissionTime='" + assignSubmissionTime + '\'' +
                ", assignDeadTime='" + assignDeadTime + '\'' +
                ", assignScore=" + assignScore +
                ", assignSubmissionFlag=" + assignSubmissionFlag +
                ", assignCheckFlag=" + assignCheckFlag +
                ", className='" + className + '\'' +
                ", studentName='" + studentName + '\'' +
                '}';
    }

}
