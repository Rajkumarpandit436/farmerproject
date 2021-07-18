<%-- 
    Document   : expertdashboard
    Created on : Jun 27, 2021, 8:00:10 AM
    Author     : PANDIT
--%>

<%@page import="com.farmer.open.discussion.entities.Expert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>JSP Page</title>
    </head>
    <body>
        <%
            Expert exp = (Expert) session.getAttribute("expertLogin");
            if (exp != null) {%>
        <div class="alert alert-success text-center" role="alert"><b><h3>EXPERT DASHBOARD</h3></b></div>  
                    <%}

                    %>
        <div class="container-fluid p-4">
            <div class="row">
                <div class="col-md-3">
                    <h1 style="color: green">Farmer Portal</h1>
                </div>
                <!--<div class="col-md-6 ">
                    <form class="form-inline my-2 my-lg-0" action="SearchServlet" method="post" name="myform"  onsubmit="return validateSearch()">
                        <input class="form-control mr-sm-2" type="search" name="search"
                               placeholder="Search your query or type crop or fertilizer" arial-label="search">
                        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>-->

                <div class="col-md-3 offset-md-6">
                    <%                       
                        if (exp != null) {%>
                    <a href="" class="btn btn-success" ><b>Welcome: </b><%=exp.getName()%></a>
                    <a href="ExpertLogoutServlet" class="btn btn-danger">Logout</a>
                    <% }
                    %>

                </div>
            </div>
        </div>
        <%@include file="nav_bar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body" style="background-color: lavender">
                            <h3 id="type">Query</h3>
                            <div class="container bg-light">
                                <div class="col-md-3 offset-md-2" style="text-align: center">
                                    <a class="nav-link text-light" href="expertManage_query.jsp"><button type="button" class="btn btn-primary">view</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
