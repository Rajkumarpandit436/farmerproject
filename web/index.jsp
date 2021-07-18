
<%@page import="com.farmer.open.discussion.entities.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.dao.QueryDao"%>
<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page import="com.sun.jdi.connect.spi.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--css-->

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
        <script src="js/searchValidation.js" type="text/javascript"></script>
        <link href="css/index_image.css" rel="stylesheet" type="text/css"/>
        <link href="css/admincss.css" rel="stylesheet" type="text/css"/>
        <link href="css/slider.css" rel="stylesheet" type="text/css"/>
        <link href="css/indexcss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <script src="js/loginValidate.js" type="text/javascript"></script>
        <div class="container-fluid p-4">

            <div class="row">
                <div class="col-md-3">
                    <h1 style="color: green">Farmer Portal</h1>
                </div>
                <div class="col-md-6 ">
                    <form class="form-inline  my-2 my-lg-0" action="SearchServlet" method="post" name="myform"  onsubmit="return validateSearch()">
                        <input class="form-control mr-sm-2" type="search" name="search"
                               placeholder="Search your query or type crop or fertilizer" arial-label="search">
                        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
                <%
                    User usersession = (User) session.getAttribute("loginmsg");
                    if (usersession != null) {%>

                <div class="col-md-3">
                    <a href="" class="btn btn-success" ><b>Welcome: </b><%=usersession.getUser_name()%></a>
                    <a href="UserLogoutServlet" class="btn btn-danger">Logout</a>
                </div>

                <%} else {
                    session.removeAttribute("loginmsg");
                %>

                <div class="col-md-3">
                    <a href="Login.jsp" class="btn btn-success">Login<i class="material-icons right"></i></a>
                    <a href="Registration.jsp" class="btn btn-primary">Register</a>
                </div>

                <% }

                    // session.removeAttribute("loginmsg");
                %>


            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="container">
                    <%                        String emptyMsg = (String) session.getAttribute("empty-search");
                        if (emptyMsg != null) {%>
                    <p><%=emptyMsg%></p>
                    <%  }

                        session.removeAttribute("empty-search");
                    %>
                    <h4></h4>
                </div>
            </div>
        </div>

        <%@include file="nav_bar.jsp" %>


        <!-- Slideshow container -->
    <marquee class="w-100 btn-light mt-2" direction="left" height="30px" style="color: green; font-weight: bold" >
        This is a forum where user can send agriculture related query and get their answer by 
        expert and also by another user. This is also helpful for agriculture students.
    </marquee>
    <section class="my-2">
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" height="360"  src="image/photo.png" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" height="360" src="image/farmer croping copy.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" height="360" src="image/images copy.png" alt="Third slide">
                </div>
            </div>
        </div>
    </section>
    <marquee class="w-100 btn-light mt-2" direction="right" height="30px" style="color: green; font-weight: bold" >
        This is a forum where user can send agriculture related query and get their answer by 
        expert and also by another user. This is also helpful for agriculture students.
    </marquee>

    <!--end of slider-->
    <!-- start of category-->
    <!--end of category-->
    <!--start of team section-->
    <section id="team" class="team mt-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="row">
                        <div class="container text-center mt-2"><h2 style="background-color: lavender"><b>Choose Crop by Category</b></h2></div>

                        <!---->
                        <div class="col-lg-12 mt-4 mt-lg-3">
                            <div class="member">
                                <div class="image">
                                    <img src="image/foodcrop.jpg" class="img-fluid" alt="img">
                                </div>
                                <div class="info">
                                    <h3 class="text-center">food crop</h3>
                                    <span></span>
                                    <p>Like Wheat, Maize, Rice, Millets and Pulses etc.</p>
                                    <div class="container mt-2">
                                        <a href="crop/foodcrop.jsp"><button class="btn btn-primary">Click View</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!---->

                        <!---->
                        <div class="col-lg-12 mt-4 mt-lg-3">
                            <div class="member">
                                <div class="image">
                                    <img src="image/cashcrop.jpg" class="img-fluid" alt="img">
                                </div>
                                <div class="info">
                                    <h3>Cash Crops</h3>
                                    <span></span>
                                    <p>Like Sugarcane, Tobacco, Cotton, Oilseeds etc. </p>
                                    <div class="container mt-2">
                                        <a href="crop/cash_crop.jsp"><button class="btn btn-primary">Click View</button></a>
                                    </div>

                                    <!--<div class="social">
                                        <a>
                                            <i class="fab fa-facebook"></i>
                                        </a>
                                        <a>
                                            <i class="fab fa-twitter"></i>
                                        </a>
                                        <a>
                                            <i class="fab fa-instagram"></i>
                                        </a>
                                    </div>-->

                                </div>
                            </div>
                        </div>
                        <!---->
                        <!---->
                        <div class="col-lg-12 mt-4 mt-lg-3">
                            <div class="member">
                                <div class="image">
                                    <img src="image/plantationcrop.jpg" class="img-fluid" alt="img">
                                </div>
                                <div class="info">
                                    <h3>Plantation Crops</h3>
                                    <span></span>
                                    <p>Coffee, Coconut, Tea, and Rubber etc.</p>
                                    <div class="container mt-2">
                                        <a href="crop/plantation_crop.jsp"><button class="btn btn-primary">Click View</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!---->
                        <!---->
                        <div class="col-lg-12 mt-4 mt-lg-3">
                            <div class="member">
                                <div class="image">
                                    <img src="image/hordiculturecrop.jpg" class="img-fluid" alt="img">
                                </div>
                                <div class="info">
                                    <h3>Horticulture crops </h3>
                                    <span></span>
                                    <p>Fruits and Vegetables etc.</p>
                                    <div class="container mt-2">
                                        <a href="crop/horticulture_crop.jsp"><button class="btn btn-primary">Click View</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!---->
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="row">
                        <div class=" container text-center mt-2"><h2 style="background-color: lavender"><b>Agriculture related Questions</b></h2></div>
                        <!---->
                        <div class="col-lg-12 mt-4 mt-lg-3">
                            <div>
                                <%
                                QueryDao dao=new QueryDao(ConnectionProvider.getConnection());
                                List<Query> qlist=dao.list();
                                for(Query q:qlist){%>
                                <div>
                                    <div style="background-color: #ddd" class="text-center"><a href="GetAnswerServlet?id=<%=q.getId()%>" style="font-size: 20px;font-weight: bold"><%=q.getQuestion()%></a></div>
                                    <br>
                                    
                                </div>
                                <%}
                                %>
                            </div>
                        </div>
                        <!---->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--end of crop category section-->
    <script>
        $('.carousel').carousel({
            interval: 2000
        })
    </script>
    <script src="js/slider_image.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
</html>
