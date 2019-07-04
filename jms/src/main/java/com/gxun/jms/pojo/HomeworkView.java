package com.gxun.jms.pojo;

public class HomeworkView {
    private int studentID;
    private int homeworkID;
    private int questionID;
    private String studentAnswer;
    private float questionScore;
    private int questionType;
    private int courseID;
    private String questionContent;
    private  String questionOptionA;
    private String questionOptionB;
    private String questionOptionC;
    private String questionOptionD;
    private String questionRightAnswer;
    private float Expr1;

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

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getStudentAnswer() {
        return studentAnswer;
    }

    public void setStudentAnswer(String studentAnswer) {
        this.studentAnswer = studentAnswer;
    }

    public float getQuestionScore() {
        return questionScore;
    }

    public void setQuestionScore(float questionScore) {
        this.questionScore = questionScore;
    }

    public int getQuestionType() {
        return questionType;
    }

    public void setQuestionType(int questionType) {
        this.questionType = questionType;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public String getQuestionOptionA() {
        return questionOptionA;
    }

    public void setQuestionOptionA(String questionOptionA) {
        this.questionOptionA = questionOptionA;
    }

    public String getQuestionOptionB() {
        return questionOptionB;
    }

    public void setQuestionOptionB(String questionOptionB) {
        this.questionOptionB = questionOptionB;
    }

    public String getQuestionOptionC() {
        return questionOptionC;
    }

    public void setQuestionOptionC(String questionOptionC) {
        this.questionOptionC = questionOptionC;
    }

    public String getQuestionOptionD() {
        return questionOptionD;
    }

    public void setQuestionOptionD(String questionOptionD) {
        this.questionOptionD = questionOptionD;
    }

    public String getQuestionRightAnswer() {
        return questionRightAnswer;
    }

    public void setQuestionRightAnswer(String questionRightAnswer) {
        this.questionRightAnswer = questionRightAnswer;
    }

    public float getExpr1() {
        return Expr1;
    }

    public void setExpr1(float expr1) {
        Expr1 = expr1;
    }
}
