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
public class SoilDetails {
    
    private int id;
    private String soiltype;
    private String about;
    private String uses;
    private String classification;

    public SoilDetails(int id, String soiltype, String about, String uses, String classification) {
        this.id = id;
        this.soiltype = soiltype;
        this.about = about;
        this.uses = uses;
        this.classification = classification;
    }

    public SoilDetails(String soiltype, String about, String uses, String classification) {
        this.soiltype = soiltype;
        this.about = about;
        this.uses = uses;
        this.classification = classification;
    }

    public SoilDetails(int id, String about, String uses, String classification) {
        this.id = id;
        this.about = about;
        this.uses = uses;
        this.classification = classification;
    }

    
    public SoilDetails() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSoiltype() {
        return soiltype;
    }

    public void setSoiltype(String soiltype) {
        this.soiltype = soiltype;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getUses() {
        return uses;
    }

    public void setUses(String uses) {
        this.uses = uses;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }
    
    
}
