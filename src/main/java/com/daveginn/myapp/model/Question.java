package com.daveginn.myapp.model;

import java.util.List;

public class Question {
    private String question;
    private List<Choice> choices;

    public Question() {
    }

    public Question(String question, List<Choice> choices) {
        this.question = question;
        this.choices = choices;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<Choice> getChoices() {
        return choices;
    }

    public void setChoices(List<Choice> choices) {
        this.choices = choices;
    }
}
