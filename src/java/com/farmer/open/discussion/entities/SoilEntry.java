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
public class SoilEntry {
   private String soil_name;

    public SoilEntry(String soil_name) {
        this.soil_name = soil_name;
    }

    public SoilEntry() {
    }

    public String getSoil_name() {
        return soil_name;
    }

    public void setSoil_name(String soil_name) {
        this.soil_name = soil_name;
    }

   
   
}
