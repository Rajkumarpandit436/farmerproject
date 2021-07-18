
package com.farmer.open.discussion.entities;


public class Feedback {
    
    private int id;
    private String email;
    private String text;

    public Feedback(int id, String email, String text) {
        this.id = id;
        this.email = email;
        this.text = text;
    }

    public Feedback(String email, String text) {
        this.email = email;
        this.text = text;
    }

    public Feedback() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
    
    
}
