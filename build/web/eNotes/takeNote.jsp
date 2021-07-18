<%-- 
    Document   : takeNote
    Created on : Jun 13, 2021, 6:11:53 AM
    Author     : PANDIT
--%>

<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User u = (User) session.getAttribute("loginmsg");
    if (u == null) {
        session.setAttribute("enote_msg", "please login...");
        response.sendRedirect("../Login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="../css/enotes_nav.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>note taking Page</title>
    </head>
    <body>


        <!--Nav start-->
        <!--Start of nav-->
        <section class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-custom">
                <a class="navbar-brand text-success text-bold" href="#">Enote</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="takeNote.jsp"> Home <span class="sr-only">(current)</span></a>
                        </li>
                        <!-- <li class="nav-item active">
                             <a class="nav-link" href="takeNote.jsp"><span class="sr-only">(current)</span></a>
                         </li>-->

                        <li class="nav-item active">
                            <a class="nav-link " href="showNotes.jsp">show notes</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link"  href="../index.jsp" ><button class="btn btn-success">goto main portal</button><span class="sr-only">(current)</span></a>

                        </li>

                    </ul>
                    <!--<form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>-->
                </div>
            </nav>
        </section>
        <!--End of nav-->
        <!--Nav End-->
        <!--Add notes start-->
        <section class="start-taking-notes mt-3" style="text-align: center">
            <div class="row">
                <div class="col-md-12">
                    <div class="container">
                        <%                            String savenoteMsg = (String) session.getAttribute("savenote");
                            if (savenoteMsg != null) {%>
                        <div class="text-success">
                            <b><p><%=savenoteMsg%></p></b>
                        </div>
                        <%}

                            session.removeAttribute(
                                    "savenote");
                        %>
                        <img src="../image/notes.jpg" alt="Enotes_img" >
                    </div>
                    <div class="text-success">
                        <h1><b>START TAKING YOUR NOTES</b></h1>
                    </div>
                    <div>
                        <%
                            if (u != null) {%>

                        <a href="addNotes.jsp?nid=<%=u.getId()%>"><button type="button" class="btn btn-outline-primary mt-3"><b>Start</b></button></a>
                        <%} else {%>
                        <b><p>Please login first to add your notes...<span>Click here<a href="../Login.jsp">login</a></span></p></b>
                        <%}
                        %>
                    </div> 
                </div>
            </div>
        </section>
        <!--Add notes end-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
