package com.farmer.open.discussion.dao;

import com.farmer.open.discussion.entities.Feedback;
import com.farmer.open.discussion.entities.Query;
import com.farmer.open.discussion.entities.Reply;
import com.farmer.open.discussion.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    private final Connection con;

//    private final DataSource dataSource;
    public UserDao(Connection con) {
        this.con = con;
        //this.dataSource = dataSource;
    }

    // method to insert data to database
    public boolean saveUser(User user) {
        boolean f = false;

        try {
            String email = user.getEmail_address();

            String sql = "select * from user_data where email_address='" + email + "'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next() == true) {

                return f;

            } else {
                String query = "insert into user_data(user_type, user_name, contact, email_address, password, gender, state, district, pincode) values(?,?,?,?,?,?,?,?,?)";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, user.getUser_type());
                pst.setString(2, user.getUser_name());
                pst.setString(3, user.getUser_contact());
                pst.setString(4, user.getEmail_address());
                pst.setString(5, user.getPassword());
                pst.setString(6, user.getGender());
                pst.setString(7, user.getState());
                pst.setString(8, user.getDistrict());
                pst.setInt(9, user.getPincode());

                int i = pst.executeUpdate();
                if (i == 1) {
                    f = true;
                }
            }

        } catch (SQLException e) {

        }
        return f;

    }

   
    /**
     *
     * @param user
     * @return
     */
    public User validateLogin(User user) {
        User u = null;
        try {

            String query = "select * from user_data where email_address=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getEmail_address());
            ps.setString(2, user.getPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setEmail_address(rs.getString("email_address"));
                u.setUser_name(rs.getString("user_name"));
                u.setUser_type(rs.getString("user_type"));
            }

        } catch (SQLException e) {
        }
        return u;
    }

    public List<User> userData() {

        List<User> userlist = new ArrayList<>();
        User user = null;
        try {
            String query = "select * from user_data";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setUser_type(rs.getString("user_type"));
                user.setUser_Contact(rs.getString("contact"));
                userlist.add(user);
            }
        } catch (SQLException e) {

        }
        return userlist;

    }

    public List<User> getstudentdata() {

        List<User> studentlist = new ArrayList<>();
        User us = null;
        try {
            String query = "select * from user_data where user_type='Agriculture student'";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // users = new User();
                us = new User();
                us.setId(rs.getInt("id"));
                us.setUser_name(rs.getString("user_name"));
                us.setUser_Contact(rs.getString("contact"));
                us.setEmail_address(rs.getString("email_address"));
                us.setPassword(rs.getString("password"));
                us.setGender(rs.getString("gender"));
                us.setUser_type(rs.getString("user_type"));
                studentlist.add(us);
                // users.setRed_date(rs.getTimestamp("reg_date"));
            }
        } catch (SQLException ex) {

        }
        return studentlist;
    }

    /////////////////
    public List<User> getFarmerdata() {

        List<User> farmerlist = new ArrayList<>();
        User us = null;
        try {
            String query = "select * from user_data where user_type='Farmer'";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // users = new User();
                us = new User();
                us.setId(rs.getInt("id"));
                us.setUser_name(rs.getString("user_name"));
                us.setUser_Contact(rs.getString("contact"));
                us.setEmail_address(rs.getString("email_address"));
                us.setPassword(rs.getString("password"));
                us.setGender(rs.getString("gender"));
                us.setUser_type(rs.getString("user_type"));
                farmerlist.add(us);
                // users.setRed_date(rs.getTimestamp("reg_date"));
            }
        } catch (SQLException ex) {

        }
        return farmerlist;
    }

    /////////////////////
    public List<User> getPublicdata() {
        List<User> publiclist = new ArrayList<>();
        User u = null;
        try {
            String sql = "select * from user_data where user_type='General Public'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setUser_name(rs.getString("user_name"));
                u.setUser_Contact(rs.getString("contact"));
                u.setEmail_address(rs.getString("email_address"));
                u.setPassword(rs.getString("password"));
                u.setGender(rs.getString("gender"));
                u.setUser_type(rs.getString("user_type"));
                publiclist.add(u);
            }
        } catch (Exception ex) {

        }
        return publiclist;

    }

    //////////////////////
    public List<User> getAdministratordata() {
        List<User> adminlist = new ArrayList<>();
        User u = null;
        try {
            String sql = "select * from user_data where user_type='Administrator'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setUser_name(rs.getString("user_name"));
                u.setUser_Contact(rs.getString("contact"));
                u.setEmail_address(rs.getString("email_address"));
                u.setPassword(rs.getString("password"));
                u.setGender(rs.getString("gender"));
                u.setUser_type(rs.getString("user_type"));
                //u.getRed_date(rs.("reg_date"));
                adminlist.add(u);
            }
        } catch (SQLException ex) {

        }
        return adminlist;

    }

    /////////////////////////
    public User SelectUserById(int idno) {

        // boolean f=false;
        User u = null;
        try {
            String sql = "select * from user_data where id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idno);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setUser_name(rs.getString("user_name"));
                u.setUser_Contact(rs.getString("contact"));
                u.setEmail_address(rs.getString("email_address"));
                u.setPassword(rs.getString("password"));
            }
            //f =true;
        } catch (SQLException e) {

        }
        return u;
    }

    public boolean UpdateUser(User user) throws SQLException {

        boolean f = false;
        try {
            String sql = "update user_data set user_name=?, contact=?, email_address=?, password=? where id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getUser_name());
            ps.setString(2, user.getUser_contact());
            ps.setString(3, user.getEmail_address());
            ps.setString(4, user.getPassword());
            ps.setInt(5, user.getId());
//            User u=new User();
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (SQLException e) {

        }
        return f;
    }

//***************delete user********************//
    public boolean deleteUser(int id) {
        boolean f = false;
        try {
            String q = "delete from user_data where id=?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);
            ps.executeUpdate();
            f = true;
        } catch (SQLException e) {

        }
        return f;
    }

   

    /*
 *@return @throws java.sql.SQLException
     */
   
    
    
    

    public boolean saveFeedback(Feedback fd) {
        boolean f = false;
        try {
            String sql = "insert into feedback(email,response)values(?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fd.getEmail());
            ps.setString(2, fd.getText());
            ps.executeUpdate();
            f = true;
        } catch (SQLException e) {

        }
        return f;
    }
    

    public User getPassword(User user) {
        User us = null;
        try {
            String query = "select * from user_data where email_address=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getEmail_address());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                us = new User();
                us.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {

        }
        return us;

    }
//    public void saveSoil(SoilEntry soilentry) {
//        try {
//
//            String sql = "insert into soil(soil_name)values(?)";
//            PreparedStatement ps = this.con.prepareStatement(sql);
//            ps.setString(1, soilentry.getSoil_name());
//            ps.executeUpdate();
//
//        } catch (SQLException e) {
//
//        }
//    }

}
