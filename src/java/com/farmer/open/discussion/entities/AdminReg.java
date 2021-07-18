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
public class AdminReg {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String password;
    private String gender;
    private String docnum;
    private String docpic;

    public AdminReg(int id, String name, String email, String phone, String password, String gender, String docnum, String docpic) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.gender = gender;
        this.docnum = docnum;
        this.docpic = docpic;
    }

    public AdminReg(String name, String email, String phone, String password, String gender, String docnum, String docpic) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.gender = gender;
        this.docnum = docnum;
        this.docpic = docpic;
    }

    public AdminReg() {
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDocnum() {
        return docnum;
    }

    public void setDocnum(String docnum) {
        this.docnum = docnum;
    }

    public String getDocpic() {
        return docpic;
    }

    public void setDocpic(String docpic) {
        this.docpic = docpic;
    }
    
    
}
