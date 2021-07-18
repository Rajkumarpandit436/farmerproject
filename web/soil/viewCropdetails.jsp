
<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.entities.CropInfo"%>
<%@page import="com.farmer.open.discussion.dao.CropInfoDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="../css/indexcss.css" rel="stylesheet" type="text/css"/>
        <link href="../css/admincss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <style>
            body{
                background-color: lavender;
            }
        </style>
    </head>
    <body>

        <div class="container-fluid mt-2">
            <div class="row">
                <div class="col-md-12">
                    <%@include file="soil_nav.jsp" %>
                </div>
            </div>
        </div>
        <%
            int cropId = Integer.parseInt(request.getParameter("id"));
            CropInfoDao dao = new CropInfoDao(ConnectionProvider.getConnection());
            CropInfo info = dao.getCropInfoById(cropId);
        %>

        <div class="row mt-5 container-fluid">
            <div class="col-md-8 offset-md-1"  style="background-color: #ffffcc">
                <div class="text-center">
                    <h3><span><%=info.getTitle()%></span></h3>
                </div>
                <div>
                    <img src="../cropTitleImage/<%=info.getTitlepic()%>">
                </div>
                <div>
                    <h4><span>Crop description</span></h4>
                    <p><%=info.getTitleDesc()%></p>
                </div>
                <br>
                <br>

                <div>
                    <h4><span>Production</span></h4>
                    <p><%=info.getProduction()%></p>
                </div>
                <br>
                <br>

                <div>
                    <h4>soil Description</h4>
                    <p><%=info.getSoilDesc()%></p>
                </div>
                <br>
                <br>

                <div>
                    <h4>Fertilizer Description</h4>
                    <p><%=info.getFertDesc()%></p>
                </div>
            </div>



            <div class="col-md-3">
                <h3 class="text-primary bg-light text-center"><b>See related crops</b></h3>
                <section id="team" class="team mt-5">
                    <div class="container">
                        <div class="row">
                            <%
                                List<CropInfo> cropinfo = dao.getRandomCrop();
                                for (CropInfo ci : cropinfo) {%>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-lg-12 mt-4 mt-lg-3">
                                        <div>
                                            <div class="member">
                                                <div class="image">
                                                    <img src="../cropTitleImage/<%=ci.getTitlepic()%>" class="img-fluid" alt="img">
                                                </div>
                                                <div class="info">
                                                    <h4 class="text-center"><%=ci.getTitle()%></h4>
                                                </div>
                                                <div class="text-center">
                                                    <a href="viewCropdetails.jsp?id=<%=ci.getId()%>"><button class="btn btn-primary">view</button></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%}
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
