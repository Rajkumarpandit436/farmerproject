

<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="css/admincss.css" rel="stylesheet" type="text/css"/>

        <title>soil entry Page</title>
    </head>
    <body>

        <%@include file="nav_bar.jsp" %>
        <!--<div class="container-fluid p-0 m-0">
            <div class="jumbotron">
                <div class="container">
                    <h1 class="display-4">FARMER OPEN DISCUSSION PORTAL</h1>
                </div>
            </div>-->
        <div class="container mt-5">

            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="container">
                        <div class="card">
                            <div class="card-header" style="text-align: center; background-color: #6d4c41; color: white;">
                                <p><strong class="text-align-center"><b><h4>Enter Your Soil Here</h4></b></strong></p>
                            </div>
                            <div class="card-body">
                                <form action="soilServlet" method="post">
                                    <div>
                                        <%
                                            String msg1 = (String) session.getAttribute("msg");
                                            if (msg1 != null) {%>
                                        <div class="alert alert-success" role="alert"><%= msg1%> 
                                            <%
                                                session.removeAttribute("msg");
                                            %>
                                            <%  }
                                            %>

                                            <h3 class="text-align-center">Need help choosing the right soil for your growing needs?</h3>
                                        </div>
                                        <div class="form-group">
                                            <select id="inpuSoil" class="form-control" name="soil" >
                                                <option selected>Choose...</option>
                                                <option>Sandy soil</option>
                                                <option>Clay Soil</option>
                                                <option>Silt Soil</option>
                                                <option>Peat Soil</option>
                                                <option>Chalk Soil</option>
                                                <option>Loam Soil</option>
                                            </select>
                                        </div>

                                        <div class="container " style="text-align: center">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>

                                    </div>

                                </form>
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
