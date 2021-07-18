package com.farmer.open.discussion.dao;

import com.farmer.open.discussion.entities.Query;
import com.farmer.open.discussion.entities.Reply;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QueryDao {

    private final Connection con;

    public QueryDao(Connection con) {
        this.con = con;
    }

    public boolean saveQuery(Query query) {

        boolean f = false;
        try {

            String qt = "insert into query_data(email,category,question)values(?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(qt);
            ps.setString(1, query.getEmail());
            ps.setString(2, query.getCategory());
            ps.setString(3, query.getQuestion());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (SQLException e) {
        }
        return f;
    }

    
     public boolean deleteQuery(int id) {
        boolean f = false;
        try {
            String q = "delete from query_data where id=?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);
            ps.executeUpdate();

            f = true;

        } catch (SQLException e) {

        }
        return f;
    }
     
      public List<Query> list() throws SQLException {
        List<Query> query = new ArrayList<>();
        Query q = null;
        try (
                PreparedStatement ps = con.prepareStatement("SELECT * FROM query_data");
                ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                q = new Query();

                q.setQuestion(rs.getString("question"));
                q.setEmail(rs.getString("email"));
                q.setId(rs.getInt("id"));
                q.setCategory(rs.getString("category"));
                query.add(q);
            }
        }

        return query;
    }

      
      public Query getQueryByQuestion(String q) {

        Query query = null;
        try {
            String sql = "select * from query_data where question=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, q);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                query.setQuestion(rs.getString("question"));
                query.setEmail(rs.getString("email"));
                query.setId(rs.getInt("id"));
            }

        } catch (SQLException e) {

        }
        return query;
    }
      
      public List<Query> getQuestionRandomly(){
        Query q=null;
        List<Query> randquery=new ArrayList<>();
        try{
            String sql="select id,question from query_data order by rand() limit 4";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                q=new Query();
                q.setId(rs.getInt("id"));
                q.setQuestion(rs.getString("question"));
                randquery.add(q);
            }
        }catch(Exception e){
            
        }
        
        return randquery;
        
    }
      
      public Query getQuestionById(int id){
          Query q=null;
          try{
              String sql="select * from query_data where id=?";
              PreparedStatement ps=con.prepareStatement(sql);
              ps.setInt(1, id);
              ResultSet rs=ps.executeQuery();
              if(rs.next()){
                  q=new Query();
                  q.setQuestion(rs.getString("question"));
                  q.setId(rs.getInt("id"));
              }
          }catch(Exception e){
              
          }
          return q;
      }
      
     
}
