/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.dao;

import com.farmer.open.discussion.entities.Enotes;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PANDIT
 */
public class EnotesDao {

    private final Connection con;

    public EnotesDao(Connection con) {
        this.con = con;
    }

    public boolean saveNotes(Enotes e) {
        boolean f = false;
        try {
            String sql = "insert into enotes(title,description,uid)values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, e.getTitle());
            ps.setString(2, e.getDesc());
            ps.setInt(3, e.getUid());
            
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return f;

    }
    
    public List<Enotes> getNotes(int uid){
        List<Enotes> notes=new ArrayList<>();
        Enotes note=null;
        try{
            String sql="select * from enotes where uid='"+uid+"'";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                note = new Enotes();
                note.setTitle(rs.getString("title"));
                note.setDesc(rs.getString("description"));
                note.setId(rs.getInt("id"));
                notes.add(note);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return notes;
        
    }
    
    public Enotes getNotesById(int id){
        Enotes note=null;
        try{
            String sql="select * from enotes where id='"+id+"'";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                note=new Enotes();
                note.setTitle(rs.getString("title"));
                note.setDesc(rs.getString("description"));
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return note;
        
    }
    
    
    
     public boolean UpdateNotes(Enotes note){
         boolean f = false;
         try{
             String sql="update enotes set title=?,description=? where id=?";
             PreparedStatement ps=con.prepareStatement(sql);
             ps.setString(1, note.getTitle());
             ps.setString(2, note.getDesc());
             ps.setInt(3, note.getId());
             
             int i = ps.executeUpdate();
             if(i==1){
                 f=true;
             }
         }catch(Exception e){
             
         }
        return f;
     }
    
    public boolean deleteNotes(int id){
        boolean f=false;
        try{
            String sql="delete from enotes where id=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            f=true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return f;
    }
}
