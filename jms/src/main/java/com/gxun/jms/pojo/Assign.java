package com.gxun.jms.pojo;

public class Assign {
    private int teacherID;
    private int studentID;
    private int homeworkID;
    private float assignScore;
    private int assignExampleFlag;
    private int assignSubmissionFlag;
    private int assignCheckFlag;
    private String assignSubmissionTime;
    private String assignDeadTime;

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public int getHomeworkID() {
        return homeworkID;
    }

    public void setHomeworkID(int homeworkID) {
        this.homeworkID = homeworkID;
    }

    public float getAssignScore() {
        return assignScore;
    }

    public void setAssignScore(float assignScore) {
        this.assignScore = assignScore;
    }

    public int getAssignExampleFlag() {
        return assignExampleFlag;
    }

    public void setAssignExampleFlag(int assignExampleFlag) {
        this.assignExampleFlag = assignExampleFlag;
    }

    public int getAssignSubmissionFlag() {
        return assignSubmissionFlag;
    }

    public void setAssignSubmissionFlag(int assignSubmissionFlag) {
        this.assignSubmissionFlag = assignSubmissionFlag;
    }

    public int getAssignCheckFlag() {
        return assignCheckFlag;
    }

    public void setAssignCheckFlag(int assignCheckFlag) {
        this.assignCheckFlag = assignCheckFlag;
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
}
