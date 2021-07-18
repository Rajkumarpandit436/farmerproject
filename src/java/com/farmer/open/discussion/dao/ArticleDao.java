
package com.farmer.open.discussion.dao;
import com.farmer.open.discussion.entities.Article;
import java.sql.*;


public class ArticleDao {
    
    private final Connection con;
    
    public ArticleDao(Connection con){
        this.con=con;
    }
    
    public boolean saveArticle(Article art){
        boolean f=false;
        try{
            String sql="insert into article(articletitle,articledesc,user_type,uid)values(?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, art.getArticletitle());
            ps.setString(2, art.getArticledesc());
            ps.setString(3, art.getUser_type());
            ps.setInt(4, art.getUid());
            
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
            }
        }catch(SQLException e){
            
        }
        return f;
    }
}
