/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.servlets;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 *
 * @author PANDIT
 */

public class MyAuth extends Authenticator{
    
    String UserName=null;
    String Password=null;
    
    public MyAuth(String UserName, String Password){
        this.UserName=UserName;
        this.Password=Password;
    }
    
    @Override
    public PasswordAuthentication getPasswordAuthentication(){
        return new PasswordAuthentication(UserName, Password);
        
    }
}



