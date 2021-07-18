

<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="container-fluid p-0 m-0">
            <div class="jumbotron">
                <div class="container">
                    <h1 class="display-4">FARMER OPEN DISCUSSION PORTAL</h1>
                </div>
            </div>

        </div>
        <div>
            <nav class="navbar navbar-expand-lg navbar-light bg-primary">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link text-light" href="">HOME</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link text-light" href="#"> fertilizer details</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link text-light" href="#"> Crop details</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link text-light" href="#">FEEDBACK AND GRIEVANCE</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link text-light" href="#"> VIEW QUERY</a>
                        </li>
                    </ul>
                    <ul>
                        <%
                            User user = (User) session.getAttribute("details");
                            if (user != null) {%>
                            <a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="fa fa-user-circle-0" arial-hidden="true"></i><%=%>profile</a>
                        <a href="logout.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="fa fa-user-plus" arial-hidden="true"></i>Logout</a>
                        <%} 
                        %>

                    </ul>

                </div>
            </nav>

        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    </body>
</html>
