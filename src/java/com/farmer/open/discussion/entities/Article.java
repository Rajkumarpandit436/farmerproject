
package com.farmer.open.discussion.entities;


public class Article {
    private int id;
    private String articletitle;
    private String articledesc;
    private int uid;
    private String user_type;

    public Article(int id, String articletitle, String articledesc, int uid, String user_type) {
        this.id = id;
        this.articletitle = articletitle;
        this.articledesc = articledesc;
        this.uid = uid;
        this.user_type = user_type;
    }

    public Article(String articletitle, String articledesc, int uid, String user_type) {
        this.articletitle = articletitle;
        this.articledesc = articledesc;
        this.uid = uid;
        this.user_type = user_type;
    }

    public Article() {
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getArticletitle() {
        return articletitle;
    }

    public void setArticletitle(String articletitle) {
        this.articletitle = articletitle;
    }

    public String getArticledesc() {
        return articledesc;
    }

    public void setArticledesc(String articledesc) {
        this.articledesc = articledesc;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
    
    
}
