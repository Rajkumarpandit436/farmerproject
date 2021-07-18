<%-- 
    Document   : manage_query
    Created on : May 26, 2021, 2:50:32 PM
    Author     : PANDIT
--%>

<%@page import="com.farmer.open.discussion.dao.QueryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.entities.Query"%>
<%@page import="com.farmer.open.discussion.dao.UserDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="../css/admincss.css" rel="stylesheet" type="text/css"/>
        <link href="../css/table.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>


        <!--div class="container-fluid p-4">
            <div class="row">
                <div class="col-md-4">
                    <h1 style="color: green"><i class="fas fa-tint" style="color: green"></i>Farmer Portal</h1>
                </div>
                <div class="col-md-5 ">

                    <form class="form-inline my-2 my-lg-0" action="../search.jsp" method="post">

                        <input class="form-control mr-sm-2" type="search" placeholder="Search" id="search_user" arial-label="search">

                        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>

                    </form>

                </div>
                <div class="col-md-3">
                    <a href="" class="btn btn-success">Login</a>
                </div>
            </div>
        </div>-->

        <%@include file="adminNav.jsp" %>


        <div>
            <%
                String msg = (String) session.getAttribute("suc");
                if (msg != null) {%>
            <div class="alert alert-success" role="alert" style="text-align: center">
                <p><%=msg%> deleted</p>
            </div>

            <% }
                session.removeAttribute("suc");

                String errormsg = (String) session.getAttribute("errorsuc");
                if (errormsg != null) {%>

            <div class="alert alert-danger" role="alert">
                <h3><%=errormsg%></h3>
            </div>
            <%
                    session.removeAttribute("errorsuc");
                }
            %>

        </div>

        <table class="table mt-5 p-3" id="query">
            <thead>
                <tr>
                    <th>id</th>
                    <th>Query</th>
                    <th>email</th>
                    <th>delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    QueryDao dao = new QueryDao(ConnectionProvider.getConnection());
                    List<Query> qlist = dao.list();
                    for (Query q : qlist) {%>
                <tr>
                    <td><%=q.getId()%></td>
                    <td><%=q.getQuestion()%></td>
                    <td><%=q.getEmail()%></td>
                    <td><a href="../deleteQueryServlet?id=<%=q.getId()%>"><button class="btn btn-danger">delete</button></a></td>
                </tr>

                <%  }
                %>
            </tbody>
        </table>


        <h1>Hello World!</h1>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
