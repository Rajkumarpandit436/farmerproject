
package com.farmer.open.discussion.dao;

import com.farmer.open.discussion.entities.AdminReg;
import java.sql.*;


public class AdminDao {
    
    private final Connection con;
    
    public AdminDao(Connection con){
        this.con=con;
    }
    
    public boolean saveAdmin(AdminReg ar){
        boolean f=false;
        try{
            String sql="insert into adminreg(name,email,phone,password,gender,docnum,docpic)values(?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, ar.getName());
            ps.setString(2, ar.getEmail());
            ps.setString(3, ar.getPhone());
            ps.setString(4, ar.getPassword());
            ps.setString(5, ar.getGender());
            ps.setString(6, ar.getDocnum());
            ps.setString(7, ar.getDocpic());
            
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
            }
        }catch(Exception e){
            
        }
        return f;
    }
}
