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
public class Expert {

    private int id;
    private String name;
    private String email;
    private String occupation;
    private String identity;
    private String phone;
    private String pic;
    private String password;
    private String state;
    private String region;
    private String district;
    private String pincode;
    private String gender;
    private String docnum;

    public Expert(int id, String name, String email, String occupation, String identity, String phone, String pic, String password, String state, String region, String district, String pincode, String gender, String docnum) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.occupation = occupation;
        this.identity = identity;
        this.phone = phone;
        this.pic = pic;
        this.password = password;
        this.state = state;
        this.region = region;
        this.district = district;
        this.pincode = pincode;
        this.gender = gender;
        this.docnum = docnum;
    }

    public Expert(String name, String email, String occupation, String identity, String phone, String pic, String password, String state, String region, String district, String pincode, String gender, String docnum) {
        this.name = name;
        this.email = email;
        this.occupation = occupation;
        this.identity = identity;
        this.phone = phone;
        this.pic = pic;
        this.password = password;
        this.state = state;
        this.region = region;
        this.district = district;
        this.pincode = pincode;
        this.gender = gender;
        this.docnum = docnum;
    }

    public Expert(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public Expert() {
    }

    public String getDocnum() {
        return docnum;
    }

    public void setDocnum(String docnum) {
        this.docnum = docnum;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

}
