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
public class CropInfo {

    private int id;
    private String title;
    private String titleType;
    private String titleDesc;
    private String production;
    private String soilCat;
    private String soilDesc;
    private String fertDesc;
    private String titlepic;
    //private String pimage;

    public CropInfo(int id, String title, String titleType, String titleDesc, String production, String soilCat, String soilDesc, String fertDesc, String titlepic) {
        this.id = id;
        this.title = title;
        this.titleType = titleType;
        this.titleDesc = titleDesc;
        this.production = production;
        this.soilCat = soilCat;
        this.soilDesc = soilDesc;
        this.fertDesc = fertDesc;
        this.titlepic = titlepic;
        //this.pimage=pimage;
    }

    public CropInfo() {
    }

    public CropInfo(int id, String title, String titleType, String titleDesc, String production, String soilCat, String soilDesc, String fertDesc) {
        this.id = id;
        this.title = title;
        this.titleType = titleType;
        this.titleDesc = titleDesc;
        this.production = production;
        this.soilCat = soilCat;
        this.soilDesc = soilDesc;
        this.fertDesc = fertDesc;
    }

    public CropInfo(String title, String titleType, String titleDesc, String production, String soilCat, String soilDesc, String fertDesc, String titlepic) {
        this.title = title;
        this.titleType = titleType;
        this.titleDesc = titleDesc;
        this.production = production;
        this.soilCat = soilCat;
        this.soilDesc = soilDesc;
        this.fertDesc = fertDesc;
        this.titlepic = titlepic;
        //this.pimage = pimage;
    }

//    public String getPimage() {
//        return pimage;
//    }
//
//    public void setPimage(String pimage) {
//        this.pimage = pimage;
//    }

    
    public String getTitlepic() {
        return titlepic;
    }

    public void setTitlepic(String titlepic) {
        this.titlepic = titlepic;
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

    public String getTitleType() {
        return titleType;
    }

    public void setTitleType(String titleType) {
        this.titleType = titleType;
    }

    public String getTitleDesc() {
        return titleDesc;
    }

    public void setTitleDesc(String titleDesc) {
        this.titleDesc = titleDesc;
    }

    public String getProduction() {
        return production;
    }

    public void setProduction(String production) {
        this.production = production;
    }

    public String getSoilCat() {
        return soilCat;
    }

    public void setSoilCat(String soilCat) {
        this.soilCat = soilCat;
    }

    public String getSoilDesc() {
        return soilDesc;
    }

    public void setSoilDesc(String soilDesc) {
        this.soilDesc = soilDesc;
    }

    public String getFertDesc() {
        return fertDesc;
    }

    public void setFertDesc(String fertDesc) {
        this.fertDesc = fertDesc;
    }

}
