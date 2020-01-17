package com.bedrock2.surway.models;


public class Survey{
    String title,description;
    int questionCount;

    public Survey(String title, String description, int questionCount) {
        this.title = title;
        this.description = description;
        this.questionCount = questionCount;
    }
    
}