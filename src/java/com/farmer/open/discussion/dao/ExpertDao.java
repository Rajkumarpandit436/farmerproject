/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.dao;

import com.farmer.open.discussion.entities.Expert;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PANDIT
 */
public class ExpertDao {

    private final Connection con;

    public ExpertDao(Connection con) {
        this.con = con;
    }

    public boolean saveExpertData(Expert exp) {
        boolean f = false;
        try {
            String sql = "insert into expertreg(name,email,phone,profession,identity,identityno,idpic,password,state,district,region,pincode,gender)values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ps.setString(1, exp.getName());
            ps.setString(2, exp.getEmail());
            ps.setString(3, exp.getPhone());
            ps.setString(4, exp.getOccupation());
            ps.setString(5, exp.getIdentity());
            ps.setString(6, exp.getDocnum());
            ps.setString(7, exp.getPic());
            ps.setString(8, exp.getPassword());
            ps.setString(9, exp.getState());
            ps.setString(10, exp.getDistrict());
            ps.setString(11, exp.getRegion());
            ps.setString(12, exp.getPincode());
            ps.setString(13, exp.getGender());

            ps.executeUpdate();

            f = true;
        } catch (SQLException e) {

        }
        return f;

    }

    public List<Expert> expertDetails() {
        List<Expert> expertdetail = new ArrayList<>();
        Expert ex = null;
        try {
            String sql = "select * from expertreg";
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ex = new Expert();
                ex.setName(rs.getString("name"));
                ex.setEmail(rs.getString("email"));
                ex.setPhone(rs.getString("phone"));
                ex.setOccupation(rs.getString("profession"));
                ex.setIdentity(rs.getString("identity"));
                ex.setDocnum(rs.getString("identityno"));
                ex.setId(rs.getInt("id"));
                ex.setPassword(rs.getString("password"));
                ex.setState(rs.getString("state"));
                ex.setDistrict(rs.getString("district"));
                ex.setRegion(rs.getString("region"));
                ex.setPincode(rs.getString("pincode"));
                ex.setPic(rs.getString("idpic"));
                ex.setGender(rs.getString("gender"));
                expertdetail.add(ex);
            }
        } catch (SQLException e) {

        }
        return expertdetail;
    }

    public boolean deleteExpertDetail(int id) {
        boolean f = false;
        try {
            String sql = "delete from expertreg where id=?";
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {

        }
        return f;
    }

    /**
     *
     * @param exp
     * @return
     */
    public Expert validateLogin(Expert exp) {
        Expert ex = null;
        try {

            String query = "select * from expertreg where email=? and password=?";
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
            ps.setString(1, exp.getEmail());
            ps.setString(2, exp.getPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ex = new Expert();
                ex.setName(rs.getString("name"));
                ex.setEmail(rs.getString("email"));
                ex.setPhone(rs.getString("phone"));
                ex.setOccupation(rs.getString("profession"));
                ex.setIdentity(rs.getString("identity"));
                ex.setDocnum(rs.getString("identityno"));
                ex.setId(rs.getInt("id"));
                ex.setPassword(rs.getString("password"));
                ex.setState(rs.getString("state"));
                ex.setDistrict(rs.getString("district"));
                ex.setRegion(rs.getString("region"));
                ex.setPincode(rs.getString("pincode"));
                ex.setPic(rs.getString("idpic"));
                ex.setGender(rs.getString("gender"));
                //expertdetail.add(ex);
            }

        } catch (SQLException e) {
        }
        return ex;
    }
}
