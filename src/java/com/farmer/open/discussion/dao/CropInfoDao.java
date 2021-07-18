/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.dao;
import com.farmer.open.discussion.entities.CropInfo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author PANDIT
 */
public class CropInfoDao {
    
    private final Connection con;
    
    public CropInfoDao(Connection con){
        this.con=con;
    }
    
    public boolean addCropInfo(CropInfo crop){
        boolean f = false;
        
        try{
            
            String sql = "insert into cropInfo(title,title_type,title_desc,production,soil_category,soil_desc,fertilizer_desc,titlepic)values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, crop.getTitle());
           // ps.setString(2, crop.getTitlepic());
            ps.setString(2, crop.getTitleType());
            ps.setString(3, crop.getTitleDesc());
            ps.setString(4, crop.getProduction());
            ps.setString(5, crop.getSoilCat());
            ps.setString(6, crop.getSoilDesc());
            ps.setString(7, crop.getFertDesc());
            ps.setString(8, crop.getTitlepic());
            
            int i=ps.executeUpdate();
            
            if(i==1){
                
                f=true;
            }
            
        }catch(SQLException e){
        }
        
        return f;
        
    }
    
    public List<CropInfo> getcropInfo(){
        CropInfo crop=null;
        List<CropInfo> cropInfo=new ArrayList<>();
        try{
            String sql="select * from cropinfo";
            PreparedStatement ps=con.prepareStatement(sql);
           // ps.setInt(1, id);
           // ps.executeQuery();
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                crop=new CropInfo();
                crop.setId(rs.getInt("id"));
                crop.setTitle(rs.getString("title"));
                crop.setTitleType(rs.getString("title_type"));
                crop.setTitleDesc(rs.getString("title_desc"));
                crop.setProduction(rs.getString("production"));
                crop.setSoilCat(rs.getString("soil_category"));
                crop.setSoilDesc(rs.getString("soil_desc"));
                crop.setFertDesc(rs.getString("fertilizer_desc"));
                crop.setTitlepic(rs.getString("titlepic"));
                cropInfo.add(crop);
            }
            
        }catch(Exception e){
            
        }
        return cropInfo;
        
    }
    
    public CropInfo getCropInfoById(int id){
        CropInfo cropInfo=null;
        try{
            String sql="select * from cropinfo where id=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1, id);
            
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                cropInfo = new CropInfo();
                cropInfo.setTitle(rs.getString("title"));
                cropInfo.setTitleType(rs.getString("title_type"));
                cropInfo.setTitleDesc(rs.getString("title_desc"));
                cropInfo.setProduction(rs.getString("production"));
                cropInfo.setSoilCat(rs.getString("soil_category"));
                cropInfo.setSoilDesc(rs.getString("soil_desc"));
                cropInfo.setFertDesc(rs.getString("fertilizer_desc"));
                cropInfo.setTitlepic(rs.getString("titlepic"));
               
                
            }
            
        }catch(Exception e){
            
        }
        return cropInfo;
        
    }
    
    public boolean updateCropInfo(CropInfo crop){
        boolean f=false;
        int id=crop.getId();
        try{
            
            String updateCropInfo = "update cropinfo set title=?,title_type=?,title_desc=?,production=?,soil_category=?,soil_desc=?,fertilizer_desc=? where id="+id+"";
            PreparedStatement ps=con.prepareStatement(updateCropInfo);
            ps.setString(1, crop.getTitle());
            ps.setString(2, crop.getTitleType());
            ps.setString(3, crop.getTitleDesc());
            ps.setString(4, crop.getProduction());
            ps.setString(5, crop.getSoilCat());
            ps.setString(6, crop.getSoilDesc());
            ps.setString(7, crop.getFertDesc());
            
            int i=ps.executeUpdate();
            
            if(i==1){
                
                f=true;
            }
            
    }catch(SQLException e){
            
            }
        return f;
    }
    
   public boolean deleteCropInfoById(int id){
       boolean f=false;
       try{
           String sql="delete from cropinfo where id=?";
           PreparedStatement ps=con.prepareStatement(sql);
           ps.setInt(1, id);
           int i=ps.executeUpdate();
           
           if(i==1){
               f=true;
           }
       }catch(SQLException e){
           
       }
        return f;
   }
   
   public List<CropInfo> getDetailsBySansySoil(){
       List<CropInfo> sandysoil=new ArrayList<>();
       CropInfo ci=null;
       try{
           
           String getdetails = "select * from cropinfo where soil_category='Sandy soil'";
           PreparedStatement ps=con.prepareStatement(getdetails);
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
               ci=new CropInfo();
               ci.setId(rs.getInt("id"));
               ci.setTitle(rs.getString("title"));
               ci.setTitleType(rs.getString("title_type"));
               ci.setProduction(rs.getString("production"));
               ci.setTitleDesc(rs.getString("title_desc"));
               ci.setSoilCat(rs.getString("soil_category"));
               ci.setSoilDesc(rs.getString("soil_desc"));
               ci.setFertDesc(rs.getString("fertilizer_desc"));
               ci.setTitlepic(rs.getString("titlepic"));
               
               sandysoil.add(ci);
           }
           
       }catch(SQLException e){
           
       }
        return sandysoil;
   }
   
   public List<CropInfo> getDetailsByClaySoil(){
       List<CropInfo> claysoil=new ArrayList<>();
       CropInfo ci=null;
       try{
           
           String getdetails = "select * from cropinfo where soil_category='Clay soil'";
           PreparedStatement ps=con.prepareStatement(getdetails);
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
               ci=new CropInfo();
               ci.setId(rs.getInt("id"));
               ci.setTitle(rs.getString("title"));
               ci.setTitleType(rs.getString("title_type"));
               ci.setProduction(rs.getString("production"));
               ci.setTitleDesc(rs.getString("title_desc"));
               ci.setSoilCat(rs.getString("soil_category"));
               ci.setSoilDesc(rs.getString("soil_desc"));
               ci.setFertDesc(rs.getString("fertilizer_desc"));
               ci.setTitleType(rs.getString("titlepic"));
               
               claysoil.add(ci);
           }
           
       }catch(SQLException e){
           
       }
        return claysoil;
   }
   
   public List<CropInfo> getDetailsByLoamSoil(){
       List<CropInfo> loamsoil=new ArrayList<>();
       CropInfo ci=null;
       try{
           
           String getdetails = "select * from cropinfo where soil_category='Loam soil'";
           PreparedStatement ps=con.prepareStatement(getdetails);
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
               ci=new CropInfo();
               ci.setId(rs.getInt("id"));
               ci.setTitle(rs.getString("title"));
               ci.setTitleType(rs.getString("title_type"));
               ci.setProduction(rs.getString("production"));
               ci.setTitleDesc(rs.getString("title_desc"));
               ci.setSoilCat(rs.getString("soil_category"));
               ci.setSoilDesc(rs.getString("soil_desc"));
               ci.setFertDesc(rs.getString("fertilizer_desc"));
               ci.setTitlepic(rs.getString("titlepic"));
               
               loamsoil.add(ci);
           }
           
       }catch(SQLException e){
           
       }
        return loamsoil;
   }
   
   public List<CropInfo> getDetailsBySiltSoil(){
       List<CropInfo> siltsoil=new ArrayList<>();
       CropInfo ci=null;
       try{
           
           String getdetails = "select * from cropinfo where soil_category='Silt soil'";
           PreparedStatement ps=con.prepareStatement(getdetails);
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
               ci=new CropInfo();
               ci.setId(rs.getInt("id"));
               ci.setTitle(rs.getString("title"));
               ci.setTitleType(rs.getString("title_type"));
               ci.setProduction(rs.getString("production"));
               ci.setTitleDesc(rs.getString("title_desc"));
               ci.setSoilCat(rs.getString("soil_category"));
               ci.setSoilDesc(rs.getString("soil_desc"));
               ci.setFertDesc(rs.getString("fertilizer_desc"));
               ci.setTitlepic(rs.getString("titlepic"));
               
               siltsoil.add(ci);
           }
           
       }catch(SQLException e){
           
       }
        return siltsoil;
   }
   
   public List<CropInfo> getDetailsByPeatSoil(){
       List<CropInfo> peatsoil=new ArrayList<>();
       CropInfo ci=null;
       try{
           
           String getdetails = "select * from cropinfo where soil_category='Peat soil'";
           PreparedStatement ps=con.prepareStatement(getdetails);
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
               ci=new CropInfo();
               ci.setId(rs.getInt("id"));
               ci.setTitle(rs.getString("title"));
               ci.setTitleType(rs.getString("title_type"));
               ci.setProduction(rs.getString("production"));
               ci.setTitleDesc(rs.getString("title_desc"));
               ci.setSoilCat(rs.getString("soil_category"));
               ci.setSoilDesc(rs.getString("soil_desc"));
               ci.setFertDesc(rs.getString("fertilizer_desc"));
               ci.setTitlepic(rs.getString("titlepic"));
              
               peatsoil.add(ci);
           }
           
       }catch(SQLException e){
           
       }
        return peatsoil;
   }
   
   public List<CropInfo> getDetailsByChalkSoil(){
       List<CropInfo> chalksoil=new ArrayList<>();
       CropInfo ci=null;
       try{
           
           String getdetails = "select * from cropinfo where soil_category='Chalk soil'";
           PreparedStatement ps=con.prepareStatement(getdetails);
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
               ci=new CropInfo();
               ci.setId(rs.getInt("id"));
               ci.setTitle(rs.getString("title"));
               ci.setTitleType(rs.getString("title_type"));
               ci.setProduction(rs.getString("production"));
               ci.setTitleDesc(rs.getString("title_desc"));
               ci.setSoilCat(rs.getString("soil_category"));
               ci.setSoilDesc(rs.getString("soil_desc"));
               ci.setFertDesc(rs.getString("fertilizer_desc"));
               ci.setTitlepic(rs.getString("titlepic"));
              
               chalksoil.add(ci);
           }
           
       }catch(SQLException e){
           
       }
        return chalksoil;
   }
   
   public List<CropInfo> getRandomCrop(){
       List<CropInfo> list=new ArrayList<>();
       CropInfo ci=null;
       try{
           String randomselect = "select * from cropinfo order by rand() limit 4";
           PreparedStatement ps=con.prepareStatement(randomselect);
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
               //info=new CropInfo();
               ci=new CropInfo();
               ci.setId(rs.getInt("id"));
               ci.setTitle(rs.getString("title"));
               ci.setTitleType(rs.getString("title_type"));
               ci.setProduction(rs.getString("production"));
               ci.setTitleDesc(rs.getString("title_desc"));
               ci.setSoilCat(rs.getString("soil_category"));
               ci.setSoilDesc(rs.getString("soil_desc"));
               ci.setFertDesc(rs.getString("fertilizer_desc"));
               ci.setTitlepic(rs.getString("titlepic"));
              
               list.add(ci);
           }
               
           }catch(Exception e){
           
       }
        return list;
   }
   
}
