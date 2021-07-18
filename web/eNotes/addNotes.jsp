<%-- 
    Document   : addNotes
    Created on : Jun 13, 2021, 6:56:26 AM
    Author     : PANDIT
--%>

<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="../css/enotes_nav.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nid = request.getParameter("nid");
        %>
        <!--Start nav-->
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
                            <a class="nav-link" href="../index.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <!--<li class="nav-item active">
                            <a class="nav-link" href="addNotes.jsp">Add notes<span class="sr-only">(current)</span></a>
                        </li>-->

                        <li class="nav-item active">
                            <a class="nav-link " href="showNotes.jsp?id=<%=nid%>">show notes</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link"  href="../index.jsp" ><button class="btn btn-success">goto main portal</button><span class="sr-only">(current)</span></a>

                        </li>

                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>
        </section>
        <!--End of nav-->
        <!--End nav-->

        <!--start add note-->
        <section class="add_notes mt-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="container">
                        <%
                            String savenoteError = (String) session.getAttribute("savenote-error");
                            if (savenoteError != null) {%>
                        <div class="text-danger">
                            <b><p><%=savenoteError%></p></b>
                        </div>
                        <% }
                        %>
                        <form class="form-group form-control" action="../NotesAddServlet" method="post">
                            <input type="hidden" name="uid" id="uid" value="<%=nid%>">
                            <div>
                                <label><b><p>Enter the notes title</p></b></label>
                                <input type="text" class="form-control" name="notestitle" id="notestitle">
                            </div>
                            <br>
                            <div>
                                <label><b><p>Enter the title description</p></b></label>
                                <textarea class="form-control" rows="10" cols="12" name="notesdesc" id="notesdesc"></textarea>
                            </div>
                            <br>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Add Notes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!--End add notes-->

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
