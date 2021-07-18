

<%@page import="com.farmer.open.discussion.entities.CropInfo"%>
<%@page import="com.farmer.open.discussion.dao.CropInfoDao"%>
<%@page import="com.farmer.open.discussion.entities.SoilDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.dao.SoilDetailsDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <title>sandy soil details</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="../css/indexcss.css" rel="stylesheet" type="text/css"/>
    <link href="../css/admincss.css" rel="stylesheet" type="text/css"/>
    <link href="../css/soil.css" rel="stylesheet" type="text/css"/>
    <body>

        <div class="container-fluid mt-2">
            <div class="row">
                <div class="col-md-12">
                    <%@include file="soil_nav.jsp" %>
                </div>
            </div>
        </div>
        <div class=" sidenav nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="margin-top: 100px">
            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">About</a>
            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Crops</a>
            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">climate</a>
            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">portfolio</a>
        </div>
        <div class="tab-content" id="v-pills-tabContent">
            <div class="text-center mt-2 bg-light"><h2><b>Silt Soil</b></h2></div>

            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <%
                    SoilDetailsDao dao = new SoilDetailsDao(ConnectionProvider.getConnection());
                    List<SoilDetails> sd = dao.getSlitSoilDetails();
                    for (SoilDetails soildetails : sd) {%>
                <div class="row">
                    <div class="col-md-9 offset-md-2">
                        <div>
                            <h3><span>About</span></h3>
                            <p><%=soildetails.getAbout()%> </p>
                        </div>
                        <br><br>

                        <div>
                            <h3><span>Uses</span></h3>
                            <p><%=soildetails.getUses()%></p>
                        </div>
                        <br><br>

                        <div>
                            <h3><span>Classification</span></h3>
                            <p><%=soildetails.getClassification()%></p>
                        </div>
                    </div>
                </div>  
                <%}
                %>
            </div>
            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <div class="row">
                    <div class="col-md-9 offset-md-2">
                        <section id="team" class="team mt-5">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="row">
                                            <!---->
                                            <%
                                                CropInfoDao cdao = new CropInfoDao(ConnectionProvider.getConnection());
                                                List<CropInfo> sandycroplist = cdao.getDetailsBySiltSoil();
                                                for (CropInfo cp : sandycroplist) {%>

                                            <div class="col-lg-4 mt-4 mt-lg-3">
                                                <div class="member">
                                                    <div class="image">
                                                        <img src="../cropTitleImage/<%=cp.getTitlepic()%>" class="img-fluid" alt="img">
                                                        
                                                    </div>
                                                    <div class="info">
                                                        <h4 class="text-center"><%=cp.getTitle()%></h4>
                                                    </div>
                                                    <div class="mt-2">
                                                        <a href="viewCropdetails.jsp?id=<%=cp.getId()%>"><button class="btn btn-primary">view</button></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!---->

                                            <%}
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div> 

            </div>
            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">...</div>
            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
        </div>



        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>

