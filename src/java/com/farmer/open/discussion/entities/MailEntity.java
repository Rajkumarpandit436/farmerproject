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
public class MailEntity {
    
    private String to;
    private String sub;
    private String msg_body;
    private String code;

    public MailEntity(String to, String sub, String msg_body) {
        this.to = to;
        this.sub = sub;
        this.msg_body = msg_body;
    }

    public MailEntity(String to, String sub, String msg_body, String code) {
        this.to = to;
        this.sub = sub;
        this.msg_body = msg_body;
        this.code = code;
    }
    
    

    public MailEntity() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    
    
    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSub() {
        return sub;
    }

    public void setSub(String sub) {
        this.sub = sub;
    }

    public String getMsg_body() {
        return msg_body;
    }

    public void setMsg_body(String msg_body) {
        this.msg_body = msg_body;
    }
    
    
}
