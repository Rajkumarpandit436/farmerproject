<%-- 
    Document   : nowdata
    Created on : Jun 28, 2021, 12:06:53 PM
    Author     : PANDIT
--%>

<%@page import="com.farmer.open.discussion.entities.Reply"%>
<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.dao.UserDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            List<Reply> list=dao.getdataBydate();
            for(Reply rp:list){%>
            <div><p><b><%=rp.getEmail()%></b></p></div>  
            <%}
        %>
    </body>
</html>
