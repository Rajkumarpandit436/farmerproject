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
public class Reply {

    private int id;
    private int q_id;
    private String email;
    private String question;
    private String response;
    private String category;
    private Timestamp date;

    public Reply() {
    }

    public Reply(int id, int q_id, String email, String question, String response, String category, Timestamp date) {
        this.id = id;
        this.q_id = q_id;
        this.email = email;
        this.question = question;
        this.response = response;
        this.category = category;
        this.date = date;
    }

    public Reply(String category,String question, String response, String email, int q_id) {
        this.q_id = q_id;
        this.email = email;
        this.question = question;
        this.response = response;
        this.category = category;
    }

    
//    public Reply(int id, int q_id, String email, String question, String response, Timestamp date) {
//        this.id = id;
//        this.q_id = q_id;
//        this.email = email;
//        this.question = question;
//        this.response = response;
//        this.date = date;
//    }
//
//    public Reply(int q_id, String response, String question, String email) {
//        this.q_id = q_id;
//        this.email = email;
//        this.question = question;
//        this.response = response;
//    }
//
//    
//    public Reply(int id, int q_id, String email, String response, Timestamp date) {
//        this.id = id;
//        this.q_id = q_id;
//        this.email = email;
//        this.response = response;
//        this.date = date;
//    }

//    public Reply(String response, String email, int q_id) {
//
//        this.response = response;
//        this.email = email;
//        this.q_id = q_id;
//    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQ_id() {
        return q_id;
    }

    public void setQ_id(int q_id) {
        this.q_id = q_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    
}
