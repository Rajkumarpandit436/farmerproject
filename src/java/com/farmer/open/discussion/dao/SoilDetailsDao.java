/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.dao;
import com.farmer.open.discussion.entities.SoilDetails;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author PANDIT
 */
public class SoilDetailsDao {
    
    private final Connection con;
    
    public SoilDetailsDao(Connection con){
        this.con=con;
    }
    
    public boolean saveSoilDetails(SoilDetails sd){
        boolean f=false;
        
        try{
            String saveSoil="insert into soildetails (soiltype,about,uses,classification)values(?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(saveSoil);
            ps.setString(1, sd.getSoiltype());
            ps.setString(2, sd.getAbout());
            ps.setString(3, sd.getUses());
            ps.setString(4, sd.getClassification());
            
            int i=ps.executeUpdate();
            
            if(i==1){
                
                f=true;
            }
        }catch(Exception e){
            
        }
        return f;
    }
    
    public List<SoilDetails> getSoilDetails(){
        List<SoilDetails> listsoildetail=new ArrayList<>();
        SoilDetails soildetails = null;
        
        try{
            
            String allSoildetail = "select * from soildetails";
            PreparedStatement ps=con.prepareStatement(allSoildetail);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                soildetails = new SoilDetails();
                soildetails.setId(rs.getInt("id"));
                soildetails.setAbout(rs.getString("about"));
                soildetails.setSoiltype(rs.getString("soiltype"));
                soildetails.setUses(rs.getString("uses"));
                soildetails.setClassification(rs.getString("classification"));
                listsoildetail.add(soildetails);
            }
            
        }catch(Exception e){
            
        }
        
        return listsoildetail;
        
    }
    
    public SoilDetails getSoilDetailsById(int id){
        SoilDetails sd=null;
        try{
            String getdetail="select * from soildetails where id=?";
            PreparedStatement ps=con.prepareStatement(getdetail);
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                sd=new SoilDetails();
                sd.setSoiltype(rs.getString("soiltype"));
                sd.setAbout(rs.getString("about"));
                sd.setUses(rs.getString("uses"));
                sd.setClassification(rs.getString("classification"));
            }
        }catch(Exception e){
            
        }
        return sd;
    }
    
    public boolean updateSoildetail(SoilDetails soildetail){
        boolean f=false;
        try{
            String updatedetails = "update soildetails set soiltype=?,about=?,uses=?,classification=? where id=?";
            PreparedStatement ps=con.prepareStatement(updatedetails);
            ps.setString(1, soildetail.getSoiltype());
            ps.setString(2, soildetail.getAbout());
            ps.setString(3, soildetail.getUses());
            ps.setString(4, soildetail.getClassification());
            ps.setInt(5, soildetail.getId());
            
            int i=ps.executeUpdate();
            
            if(i==1){
                f=true;
            }
        }catch(Exception e){
            
        }
        return f;
    }
    
    public boolean deleteSoilDetails(int id){
        boolean f=false;
        try{
            String deleteSoildetails="delete from soildetails where id=?";
            PreparedStatement ps=con.prepareStatement(deleteSoildetails);
            ps.setInt(1, id);
            int i=ps.executeUpdate();
            
            if(i==1){
                f=true;
            }
        }catch(Exception e){
            
        }
        return f;
        
    }
    
    public  List<SoilDetails> getSandySoilDetails(){
        SoilDetails sd=null;
        List<SoilDetails> soildetails=new ArrayList<>();
        try{
            String sql="select * from soildetails where soiltype='Sandy soil'";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                sd=new SoilDetails();
                sd.setAbout(rs.getString("about"));
                sd.setId(rs.getInt("id"));
                sd.setSoiltype(rs.getString("soiltype"));
                sd.setUses(rs.getString("uses"));
                sd.setClassification(rs.getString("classification"));
                soildetails.add(sd);
            }
        }catch(Exception e){
            
        }
        return soildetails;
    }
    
    public  List<SoilDetails> getClaySoilDetails(){
        SoilDetails sd=null;
        List<SoilDetails> soildetails=new ArrayList<>();
        try{
            String sql="select * from soildetails where soiltype='Clay soil'";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                sd=new SoilDetails();
                sd.setAbout(rs.getString("about"));
                sd.setId(rs.getInt("id"));
                sd.setSoiltype(rs.getString("soiltype"));
                sd.setUses(rs.getString("uses"));
                sd.setClassification(rs.getString("classification"));
                soildetails.add(sd);
            }
        }catch(Exception e){
            
        }
        return soildetails;
    }
    
     public  List<SoilDetails> getLoamSoilDetails(){
        SoilDetails sd=null;
        List<SoilDetails> soildetails=new ArrayList<>();
        try{
            String sql="select * from soildetails where soiltype='Loam soil'";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                sd=new SoilDetails();
                sd.setAbout(rs.getString("about"));
                sd.setId(rs.getInt("id"));
                sd.setSoiltype(rs.getString("soiltype"));
                sd.setUses(rs.getString("uses"));
                sd.setClassification(rs.getString("classification"));
                soildetails.add(sd);
            }
        }catch(Exception e){
            
        }
        return soildetails;
    }
     
      public  List<SoilDetails> getSlitSoilDetails(){
        SoilDetails sd=null;
        List<SoilDetails> soildetails=new ArrayList<>();
        try{
            String sql="select * from soildetails where soiltype='Silt soil'";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                sd=new SoilDetails();
                sd.setAbout(rs.getString("about"));
                sd.setId(rs.getInt("id"));
                sd.setSoiltype(rs.getString("soiltype"));
                sd.setUses(rs.getString("uses"));
                sd.setClassification(rs.getString("classification"));
                soildetails.add(sd);
            }
        }catch(Exception e){
            
        }
        return soildetails;
    }
      
       public  List<SoilDetails> getPeatSoilDetails(){
        SoilDetails sd=null;
        List<SoilDetails> soildetails=new ArrayList<>();
        try{
            String sql="select * from soildetails where soiltype='Peat soil'";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                sd=new SoilDetails();
                sd.setAbout(rs.getString("about"));
                sd.setId(rs.getInt("id"));
                sd.setSoiltype(rs.getString("soiltype"));
                sd.setUses(rs.getString("uses"));
                sd.setClassification(rs.getString("classification"));
                soildetails.add(sd);
            }
        }catch(Exception e){
            
        }
        return soildetails;
    }
       
        public  List<SoilDetails> getChalkSoilDetails(){
        SoilDetails sd=null;
        List<SoilDetails> soildetails=new ArrayList<>();
        try{
            String sql="select * from soildetails where soiltype='Chalk soil'";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                sd=new SoilDetails();
                sd.setAbout(rs.getString("about"));
                sd.setId(rs.getInt("id"));
                sd.setSoiltype(rs.getString("soiltype"));
                sd.setUses(rs.getString("uses"));
                sd.setClassification(rs.getString("classification"));
                soildetails.add(sd);
            }
        }catch(Exception e){
            
        }
        return soildetails;
    }
}
