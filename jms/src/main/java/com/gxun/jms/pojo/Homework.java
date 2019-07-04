package com.gxun.jms.pojo;

public class Homework {
    private int courseID;
    private int homeworkID;
    private float homeworkScore;
    private String homeworkDescribe;

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public int getHomeworkID() {
        return homeworkID;
    }

    public void setHomeworkID(int homeworkID) {
        this.homeworkID = homeworkID;
    }

    public float getHomeworkScore() {
        return homeworkScore;
    }

    public void setHomeworkScore(float homeworkScore) {
        this.homeworkScore = homeworkScore;
    }

    public String getHomeworkDescribe() {
        return homeworkDescribe;
    }

    public void setHomeworkDescribe(String homeworkDescribe) {
        this.homeworkDescribe = homeworkDescribe;
    }
}
