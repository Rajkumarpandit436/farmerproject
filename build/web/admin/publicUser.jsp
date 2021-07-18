
<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page import="com.farmer.open.discussion.dao.UserDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="../css/admincss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>

        <!-- <div class="container-fluid p-0 m-0">
             <div class="jumbotron">
                 <div class="container">
                     <h1 class="display-4">FARMER OPEN DISCUSSION PORTAL</h1>
                 </div>
             </div>
 
         </div>-->

        <%@include file="adminNav.jsp" %>
        <%
            String msg = (String) session.getAttribute("updatemsg");
            if (msg != null) {%>
        <div class="form-control alert-success mt-2" style="text-align: center; font-weight: bold">
            <%=msg%>
        </div>
        <% }
            session.removeAttribute("updatemsg");
        %>

        <%
            String errormsg = (String) session.getAttribute("errorupdatemsg");
            if (errormsg != null) {%>
        <div class="form-control alert-danger" style="text-align: center; font-weight: bold">
            <p> <%=msg%></p>
        </div>
        <% }
        session.removeAttribute("errorupdatemsg");
        %>

        <div class="container">
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
                    <tbody>
                        <%                            UserDao dao = new UserDao(ConnectionProvider.getConnection());
                            List<User> list = dao.getPublicdata();
                            for (User u : list) {%>
                        <tr>
                            <td><%=u.getId()%></td>
                            <td><%=u.getUser_name()%></td>
                            <td><%=u.getUser_contact()%></td>
                            <td><%=u.getEmail_address()%></td>
                            <td><%=u.getPassword()%></td>
                            <td><%=u.getGender()%></td>
                            <td><a href="edit.jsp?id=<%= u.getId()%>&user_type=<%=u.getUser_type()%>"><button type="submit" class="btn btn-primary">update</button> </a></td>
                            <td><a href="../delete?id=<%= u.getId()%>&user_type=<%=u.getUser_type()%>"><button type="submit" class="btn btn-danger">delete</button></a> </td>
                        </tr> 
                        <%}
                        %>

                    </tbody>
                </table>
            </div>
        </div>


    </body>
</html>
