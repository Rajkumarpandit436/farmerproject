
package com.farmer.open.discussion.helper;

import java.sql.*;

/**
 *
 * @author PANDIT
 */
public class ConnectionProvider {
   
    private static Connection con;
    public static Connection getConnection()
    {
        try{
            
           if(con==null)
           {
                Class.forName("com.mysql.jdbc.Driver");
            
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/farmer?useUnicode=yes&characterEncoding=UTF-8","root","");
           }
        }catch(ClassNotFoundException | SQLException e){
            
            System.err.println(e);
        }
        return con;
       
        
    }
}
