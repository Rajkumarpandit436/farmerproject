
package com.farmer.open.discussion.dao;
import com.farmer.open.discussion.entities.Reply;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReplyDao {
    
    private final Connection con;
    public ReplyDao(Connection con){
        this.con=con;
    }
    
    public boolean saveResponse(Reply rp) {
        boolean f = false;
        try {
            String sql = "insert into query_answer(category,question,answer,email,q_id)values(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, rp.getCategory());
            ps.setString(2, rp.getQuestion());
            ps.setString(3, rp.getResponse());
            ps.setString(4, rp.getEmail());
            ps.setInt(5, rp.getQ_id());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {

        }
        return f;

    }
    
    
    public List<Reply> getReplyBYIdno(int id) {
        List<Reply> replyArray = new ArrayList<>();
        Reply rep = null;
        try {
            String sql = "select * from query_answer where q_id=?";
//            String sql1 = "select query_answer.response, query_data.question"
//                    + "from query_response"
//                    + "INNER JOIN query_data ON query_answer.q_id=query_data.id where q_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                rep = new Reply();
                rep.setQ_id(rs.getInt("q_id"));
                rep.setResponse(rs.getString("answer"));
                rep.setEmail(rs.getString("email"));
                rep.setQuestion(rs.getString("question"));
                rep.setCategory(rs.getString("category"));
                replyArray.add(rep);
                // rep.setDate(rs.getTimestamp("date"));
            }
        } catch (SQLException e) {

        }
        return replyArray;
    }
    
    
     public List<Reply> getReply(){
        List<Reply> listReply=new ArrayList<>();
        Reply rp=null;
        try{
            String sql="select * from query_answer";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                rp=new Reply();
                rp.setQuestion(rs.getString("question"));
                rp.setResponse(rs.getString("answer"));
                rp.setId(rs.getInt("id"));
                listReply.add(rp);
            }
        }catch(SQLException e){
        
    }
        return listReply;
    }
     
      public List<Reply> getdataBydate(){
        List<Reply> replydata=new ArrayList<>();
        Reply rep=null;
        try{
           String sql="select * from query_answer where date==now()"; 
           PreparedStatement ps=con.prepareStatement(sql);
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
               rep=new Reply();
               rep.setEmail(rs.getString(""));
               replydata.add(rep);
           }
        }catch(SQLException e){
            
        }
        return replydata;
    }
      
      
    public Reply searchByQuestion(String q){
        Reply reply=null;
        try{
            String sql="select * from query_answer where question=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, q);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                reply=new Reply();
                reply.setQuestion(rs.getString("question"));
                reply.setCategory(rs.getString("category"));
                reply.setResponse(rs.getString("answer"));
                reply.setId(rs.getInt("id"));
            }
        }catch(SQLException e){
        }
        return reply;
        
    }
    
    public Reply getReplyByQid(int id){
       // List<Reply> replylist=new ArrayList<>();
        Reply r=null;
        try{
            String sql="select * from where q_id=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                r=new Reply();
                r.setResponse(rs.getString("answer"));
                r.setId(rs.getInt("id"));
                //replylist.add(r);
            }
        }catch(SQLException e){
            
        }
        return r;
    }
    
    
}
