<%-- 
    Document   : adminNav
    Created on : May 23, 2021, 10:33:54 PM
    Author     : PANDIT
--%>

<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
            <a class="navbar-brand" href="#">FARMER PORTAL</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"> <i class="fas fa-home"></i>HOME <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="soilEntry.jsp">SOIL DETAILS</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="ViewQuery.jsp">VIEW QUERY</a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="Query.jsp">SUBMIT QUERY</a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="feedback.jsp">FEEDBACK</a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="mail.jsp">mail</a>
                    </li>
                  
                    <li class="nav-item active">
                        <a class="nav-link" href="eNotes/takeNote.jsp">Enotes</a>
                    </li>

                </ul>
            </div>
        </nav>
    </body>
</html>
