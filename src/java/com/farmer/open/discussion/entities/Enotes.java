/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.entities;

/**
 *
 * @author PANDIT
 */
public class Enotes {
    private int id;
    private String title;
    private String desc;
    private int uid;

    public Enotes(int id, String title, String desc, int uid) {
        this.id = id;
        this.title = title;
        this.desc = desc;
        this.uid = uid;
    }

    public Enotes(String title, String desc, int uid) {
        this.title = title;
        this.desc = desc;
        this.uid = uid;
    }
    
    public Enotes(String title, String desc){
        this.title=title;
        this.desc=desc;
    }

    public Enotes(int id, String title, String desc) {
        this.id = id;
        this.title = title;
        this.desc = desc;
    }

    
    public Enotes() {
    }
    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
    
    
}
