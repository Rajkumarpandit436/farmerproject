<%-- 
    Document   : agricultureStudent
    Created on : Jan 2, 2021, 1:43:32 PM
    Author     : PANDIT
--%>

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

              
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <link href="../css/admincss.css" rel="stylesheet" type="text/css"/>
        <title>administrator Page</title>
    </head>
    <body>
        <%@include file="adminNav.jsp" %>
        <div class="container mt-5">

            <%
                String umsg = (String) session.getAttribute("updatemsg");
                if (umsg != null) {%>
            <div class="alert alert-success" role="alert"><%=umsg%></div>

            <% }
                session.removeAttribute("updatemsg");

            %>

            <%  String errormsg = (String) session.getAttribute("errorupdatemsg");
                if (errormsg != null) {%>
            <div class="alert alert-danger" role="alert"><%=errormsg%></div>

            <%  }

                session.removeAttribute("errorupdatemsg");
            %>


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
                            <th>update</th>
                            <th>delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  
                            UserDao dao = new UserDao(ConnectionProvider.getConnection());
                            List<User> list = dao.getAdministratordata();
                            for (User u : list) {%>
                        <tr>
                            <td><%=u.getId()%></td>
                            <td><%=u.getUser_name()%></td>
                            <td><%=u.getUser_contact()%></td>
                            <td><%=u.getEmail_address()%></td>
                            <td><%=u.getPassword()%></td>
                            <td><%=u.getGender()%> </td>
                            <td><a href="edit.jsp?id=<%= u.getId()%>& user_type=<%= u.getUser_type()%>"><button type="submit" class="btn btn-primary">update</button> </a></td>
                            <td><a href="../delete?id=<%= u.getId()%>& user_type=<%= u.getUser_type()%>"><button type="submit" class="btn btn-danger">delete</button></a> </td>
                        </tr> 

                        <%}
                        %>

                    </tbody>
                </table>
            </div>
        </div>


    </body>
</html>
