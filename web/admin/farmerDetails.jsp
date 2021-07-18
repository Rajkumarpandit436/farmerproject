<%-- 
    Document   : farmerDetails
    Created on : Jan 2, 2021, 1:45:17 PM
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
        <link href="../css/table.css" rel="stylesheet" type="text/css"/>
        <link href="../css/admincss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>


        <%@include file="adminNav.jsp" %>

        <%
            String msg = (String) session.getAttribute("updatemsg");
            if (msg != null) {%>
        <div class="form-control" style="color: green">
            <%=msg%>
        </div>
        <% }
            session.removeAttribute("updatemsg");
        %>

        <%
            String errormsg = (String) session.getAttribute("errorupdatemsg");
            if (errormsg != null) {%>
        <div class="form-control" style="color: red">
            <%=msg%>
        </div>
        <% }
            session.removeAttribute("errorupdatemsg");
        %>

        <div class="container-fluid">
            <div class="table-responsive">  
                <div class="text-center mt-3"><h3 style="background-color: lavender"><b>Farmer Details</b></h3></div>
                <table class="table mt-2" id="query">
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
                            List<User> list = dao.getFarmerdata();
                            for (User f : list) {%>
                        <tr>
                            <td><%=f.getId()%></td>
                            <td><%=f.getUser_name()%></td>
                            <td><%=f.getUser_contact()%></td>
                            <td><%=f.getEmail_address()%></td>
                            <td><%=f.getPassword()%></td>
                            <td><%=f.getGender()%></td>
                            <td><a href="edit.jsp?id=<%=f.getId()%>&user_type=<%=f.getUser_type()%>"><button type="submit" class="btn btn-primary">update</button></a></td>
                            <td><a href="../delete?id=<%=f.getId()%>&user_type=<%=f.getUser_type()%>"><button type="submit" class="btn btn-danger">delete</button></a> </td>
                        </tr>
                        <%  }
                        %>

                    </tbody>
                </table>
            </div>
        </div>


    </body>
</html>
