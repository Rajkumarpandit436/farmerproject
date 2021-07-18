
package com.farmer.open.discussion.entities;

import java.security.Timestamp;

/**
 *
 * @author PANDIT
 */
public class User {
    private int id;
    private String user_type;
    private String user_name;
    private String user_contact;
    private String email_address;
    private String password;
    private String gender;
    private Timestamp reg_date;
    private String state;
    private String district;
    private int pincode;
    private int otp;
    
    //constructor

    public User(int id, String user_type, String user_name, String user_contact, String email_address, String password, String gender, Timestamp reg_date, String state, String district, int pincode, int otp) {
        this.id = id;
        this.user_type = user_type;
        this.user_name = user_name;
        this.user_contact = user_contact;
        this.email_address = email_address;
        this.password = password;
        this.gender = gender;
        this.reg_date = reg_date;
        this.state = state;
        this.district = district;
        this.pincode = pincode;
        this.otp=otp;
    }

    public User(String user_type, String user_name, String user_contact, String email_address, String password, String gender, String state, String district, int pincode, int otp) {
        this.user_type = user_type;
        this.user_name = user_name;
        this.user_contact = user_contact;
        this.email_address = email_address;
        this.password = password;
        this.gender = gender;
        this.state = state;
        this.district = district;
        this.pincode = pincode;
        this.otp = otp;
    }
    
    

    public User(String user_type, String user_name, String user_contact, String email_address, String password, String gender, String state, String district, int pincode) {
        this.user_type = user_type;
        this.user_name = user_name;
        this.user_contact = user_contact;
        this.email_address = email_address;
        this.password = password;
        this.gender = gender;
        this.state = state;
        this.district = district;
        this.pincode = pincode;
    }
    
    

    public User(int id, String user_type, String user_name, String user_contact, String email_address, String password, String gender, Timestamp reg_date) {
        this.id = id;
        this.user_type = user_type;
        this.user_name = user_name;
        this.user_contact= user_contact;
        this.email_address = email_address;
        this.password = password;
        this.gender = gender;
        this.reg_date = reg_date;
    }

    public User() {
    }

    public User(String user_type, String user_name, String user_contact, String email_address, String password, String gender) {
        this.user_type = user_type;
        this.user_name = user_name;
        this.user_contact=user_contact;
        this.email_address = email_address;
        this.password = password;
        this.gender = gender;
        
    }

    public User(String email_address, String password) {
        this.email_address = email_address;
        this.password = password;
    }

    public User(int id, String user_name, String user_contact, String email_address, String password) {
        this.id = id;
        this.user_name = user_name;
        this.user_contact = user_contact;
        this.email_address = email_address;
        this.password = password;
    }

    public User(String user_name, String user_contact, String email_address, String password) {
        this.user_name = user_name;
        this.user_contact = user_contact;
        this.email_address = email_address;
        this.password = password;
    }

    public User(String user_contact, String email_address, String password) {
        this.user_contact = user_contact;
        this.email_address = email_address;
        this.password = password;
    }

    public User(String email) {
        this.email_address = email_address;
    }
    
    

    public Timestamp getReg_date() {
        return reg_date;
    }

    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public int getPincode() {
        return pincode;
    }

    //getters and setters
    public void setPincode(int pincode) {
        this.pincode = pincode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    
    public String getUser_contact(){
        return user_contact;
    }
    
    public void setUser_Contact( String user_contact){
        this.user_contact = user_contact;
    }

    public String getEmail_address() {
        return email_address;
    }

    public void setEmail_address(String email_address) {
        this.email_address = email_address;
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

    public Timestamp getRed_date() {
        return reg_date;
    }

    public void setRed_date(Timestamp red_date) {
        this.reg_date = red_date;
    }
    
    
    
}
