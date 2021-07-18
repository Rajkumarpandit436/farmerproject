

<%@page import="java.util.ListIterator"%>
<%@page import="com.farmer.open.discussion.servlets.StudentDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.dao.UserDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../css/admincss.css" rel="stylesheet" type="text/css"/>
        <title>Student details</title>
        
        <style>
            th,td{
                text-align: center;
            }
        </style>
    </head>
    <body>
        
        <%@include file="adminNav.jsp" %>
        
       
        <%
            String msg = (String) session.getAttribute("updatemsg");
            if (msg != null) {%>
        <div class="alert-success" role="alert" style="text-align: center">
            <p><%=msg%></p>
        </div>
        <% }
            session.removeAttribute("updatemsg");
        %>

        <%
            String errormsg = (String) session.getAttribute("errorupdatemsg");
            if (errormsg != null) {%>
        <div class="form-control alert-danger" role="alert" style="text-align: center">
            <%=msg%>
        </div>
        <% }
        session.removeAttribute("errorupdatemsg");
        %>
        <div class="container-fluid mt-5">
            <div class="table-responsive">          
                <table class="table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>user_name</th>
                            <th>contact</th>
                            <th>Email</th>
                            <th>password</th>
                            <th>gender</th>
                        </tr>
                    </thead>

                    <%

                        UserDao dao = new UserDao(ConnectionProvider.getConnection());
                        List<User> list = dao.getstudentdata();
//                        ListIterator <User> u=list.listIterator();
//                        while(u.hasNext())
                        for (User u : list) {%>
                    <tr>
                        <td><%= u.getId()%></td>
                        <td><%= u.getUser_name()%></td>
                        <td><%= u.getUser_contact()%></td>
                        <td><%= u.getEmail_address()%></td>
                        <td><%= u.getPassword()%></td>
                        <td><%= u.getGender()%></td>
                        <td><a href="edit.jsp?id=<%= u.getId()%>&user_type=<%= u.getUser_type()%>"><button type="submit" class="btn btn-primary">update</button> </a></td>
                        <td><a href="../delete?id=<%= u.getId()%>&user_type=<%= u.getUser_type()%>"> <button type="submit" class="btn btn-danger">delete</button></a> </td>
                    </tr>
                    <% }
                    %>

                    </tbody>
                </table>
            </div>
        </div>

    </body>


    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
