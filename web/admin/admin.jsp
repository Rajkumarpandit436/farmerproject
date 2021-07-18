

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="../css/admincss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>

        <style>
            .card-body:hover{
                background-color: lavender;
            }
        </style>

    </head>
    <body>
        <div class="container-fluid p-4">
            <div class="row">
                <div class="col-md-3">
                    <h4 style="color: green"><i class="fas fa-tint" style="color: green"></i>Farmer open discussion Portal</h4>
                </div>
                <div class="col-md-5 ">

                    <form class="form-inline my-2 my-lg-0" action="../SearchServlet" method="post">

                        <input class="form-control mr-sm-2" type="search" placeholder="Search" id="search_user" arial-label="search">

                        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>

                    </form>

                </div>

                <div class="col-md-3">
                    <a href="../expertRegistration.jsp" class="btn btn-success">Expert Registration</a>

                    <%
                        User user = (User) session.getAttribute("Adminloginmsg");
                        if (user != null) {%>

                    <a href="" class="btn btn-success"><%=user.getUser_name()%></a>
                    <a href="../AdminLogoutServlet" class="btn btn-success">Logout</a>
                </div>
                <% }

                %>

            </div>
        </div>

                <div class="mt-5">
            <%@include file="adminNav.jsp" %>
        </div>


        <!-- body part-->
        <main>
            <div class="container-fluid bg-light p-1 mt-3">
                <h3 style="text-align: center; margin-top: 30px; margin-bottom: 10px; background-color: lavender;">Admin Here</h3>
            </div>

            <div class="row mt-4">
                <div class="col-md-12">
                    <h4 style="text-align: center">MANAGE USER DATA</h4>
                    <%                        String addcrop = (String) session.getAttribute("cropAdd");
                        if (addcrop != null) {%>
                    <div class="text-center text-success"><p><b><%=addcrop%></b></p></div>  
                                <%}

                                    session.removeAttribute("cropAdd");

                                    String soiladdsuc = (String) session.getAttribute("soildetailAdd");
                                    if (soiladdsuc != null) {%>
                    <div class="text-center text-success"><p><b><%=soiladdsuc%></b></p></div>
                                <%}
                                    session.removeAttribute("soildetailAdd");
                                %>
                </div>

            </div>
            <div class="container">
                <div class="row mt-3">
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body" style="background-color: lavender">
                                <h3 id="type">Admin</h3>
                                <div class="container bg-light">
                                    <div class="col-md-3 offset-md-2" style="text-align: center">
                                        <a class="nav-link text-light" href="administrator.jsp"><button type="button" class="btn btn-primary">view</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body" style="background-color: lavender">
                                <h3 id="type">Expert</h3>
                                <div class="container bg-light">
                                    <div class="col-md-3 offset-md-2" style="text-align: center">
                                        <a class="nav-link text-light" href="expertDetails.jsp"><button type="button" class="btn btn-primary">view</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body" style="background-color: lavender">
                                <h3 id="type">Student</h3>
                                <div class="container bg-light">
                                    <div class="col-md-3 offset-md-2 text-center">
                                        <a class="nav-link text-light" href="studentDetails.jsp"><button type="button" class="btn btn-primary">view</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body" style="background-color: lavender">
                                <h3 id="type">public</h3>
                                <div class="container bg-light">
                                    <div class="col-md-2 offset-md-2 text-center">
                                        <a class="nav-link text-light" href="publicUser.jsp"><button type="button" class="btn btn-primary "> view </button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body" style="background-color: lavender">
                                <h3 id="type">Farmer</h3>
                                <div class="container bg-light">
                                    <div class="col-md-2 offset-md-2 text-center">
                                        <a class="nav-link text-light" href="farmerDetails.jsp"><button type="button" class="btn btn-primary">view</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 mt-3">
                        <div class="card">
                            <div class="card-body" style="background-color: lavender">
                                <h3 id="type">Add CropInfo</h3>
                                <div class="container bg-light">
                                    <div class="col-md-2 offset-md-2 text-center">
                                        <a class="nav-link text-light" href="cropInfo.jsp"><button type="button" class="btn btn-primary">view</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 mt-3">
                        <div class="card">
                            <div class="card-body" style="background-color: lavender">
                                <h3 id="type">view CropInfo</h3>
                                <div class="container bg-light">
                                    <div class="col-md-2 offset-md-2 text-center">
                                        <a class="nav-link text-light" href="view_cropInfo.jsp"><button type="button" class="btn btn-primary">view</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 mt-3">
                        <div class="card">
                            <div class="card-body" style="background-color: lavender">
                                <h3 id="type">Add SoilDetails</h3>
                                <div class="container bg-light">
                                    <div class="col-md-2 offset-md-2 text-center">
                                        <a class="nav-link text-light" href="addSoilDetails.jsp"><button type="button" class="btn btn-primary">view</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 mt-3">
                        <div class="card">
                            <div class="card-body" style="background-color: lavender">
                                <h3 id="type">View SoilDetails</h3>
                                <div class="container bg-light">
                                    <div class="col-md-2 offset-md-2 text-center">
                                        <a class="nav-link text-light" href="viewSoilDetails.jsp"><button type="button" class="btn btn-primary">view</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <!-- <div class="row mt-4">
                 <div class="col-md-12">
                     <h4 style="text-align: center">MANAGE QUERY DATA</h4>
                 </div>
 
             </div>
             <div class="container mt-md-4">
                 <div class="col-md-12">
                     <div class="card">
 
                         <div class="card-header text-center">
                             <div class="col-md-12 text-center">
                                 <h4>QUERY DETAILS</h4>
                             </div>
 
                         </div>
                         <div class="card-body">
                             <div class="col-md-6">
                                 <a class="nav-link text-light" href="administrator.jsp">
                                     <button type="button" class="btn btn-primary">view</button></a>
                             </div>
 
                         </div>
 
                     </div>
 
                 </div>
 
             </div>-->
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
