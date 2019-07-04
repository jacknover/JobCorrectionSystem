package com.gxun.jms.pojo;

public class Teacher {
    private String teacherName;
    private int teacherID;
    private String teacherPassword;
    private int collegeID;
    private int activeFlag;
    private String teacherLoginID;

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public String getTeacherPassword() {
        return teacherPassword;
    }

    public void setTeacherPassword(String teacherPassword) {
        this.teacherPassword = teacherPassword;
    }

    public int getCollegeID() {
        return collegeID;
    }

    public void setCollegeID(int collegeID) {
        this.collegeID = collegeID;
    }

    public int getActiveFlag() {
        return activeFlag;
    }

    public void setActiveFlag(int activeFlag) {
        this.activeFlag = activeFlag;
    }

    public String getTeacherLoginID() {
        return teacherLoginID;
    }

    public void setTeacherLoginID(String teacherLoginID) {
        this.teacherLoginID = teacherLoginID;
    }
}
