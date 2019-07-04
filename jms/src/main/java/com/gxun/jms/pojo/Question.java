package com.gxun.jms.pojo;

public class Question {
    private int questionID;
    private int questionType;
    private int courseID;
    private String questionContent;
    private int questionDifficulty;
    private String questionOptionA;
    private String questionOptionB;
    private String questionOptionC;
    private String questionOptionD;
    private String rightAnswer;
    private float questionScore;

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
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

    public int getQuestionDifficulty() {
        return questionDifficulty;
    }

    public void setQuestionDifficulty(int questionDifficulty) {
        this.questionDifficulty = questionDifficulty;
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

    public String getRightAnswer() {
        return rightAnswer;
    }

    public void setRightAnswer(String rightAnswer) {
        this.rightAnswer = rightAnswer;
    }

    public float getQuestionScore() {
        return questionScore;
    }

    public void setQuestionScore(float questionScore) {
        this.questionScore = questionScore;
    }

}
