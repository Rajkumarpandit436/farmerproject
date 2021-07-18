/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.entities;

import java.security.Timestamp;

/**
 *
 * @author PANDIT
 */
public class Query {

    private int id;
    private String email;
    private String question;
    private String category;
    private Timestamp time;


    public Query(int id, String email, String category, String question, Timestamp time) {
        this.id = id;
        this.email = email;
        this.question = question;
        this.category = category;
        this.time = time;
    }

    public Query(String email, String category, String question) {
        this.email = email;
        this.question = question;
        this.category = category;
    }

    
    public Query() {
    }

    public Query(int id, String email, String question, String category) {
        this.id = id;
        this.email = email;
        this.question = question;
        this.category=category;
    }

    public Query(String question, String email) {
        this.question = question;
        this.email = email;
    }

    public Query(String question, Timestamp time) {
        this.question = question;
        this.time = time;
    }

    public Query(String question) {
        this.question = question;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    
}
