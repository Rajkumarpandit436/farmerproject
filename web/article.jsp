<%-- 
    Document   : article
    Created on : Jun 27, 2021, 9:55:11 PM
    Author     : PANDIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/admincss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div style="width: 100%; height: 200px; margin-top: 10px; background-image: url(image/banner-farmer-coppy.png); text-align: center" >
                        <h1 style="padding-top: 50px; text"><b>FARMER OPEN DISCUSSION PORTAL</b></h1>
                    </div>
                    <%@include file="nav_bar.jsp" %>
                    <form class="form-control form-group mt-5" action="ArticleServlet" method="post">
                        <div class="text-center text-primary" style="background-color: lavender"><h3><b>Give Some Article</b></h3></div>
                        <div>
                            <lable><span><b>Article title</b></span></lable>
                            <input type="text" name="articleTitle" id="articleTitleId" class="form-control">
                        </div>
                        <br>

                        <div>
                            <lable><span><b>Title Description</b></span></lable>
                            <textarea class="form-control" rows="6" name="articledesc"></textarea>
                        </div>
                        <br>
                        <div class="text-center">
                            <button class="btn btn-primary"><b>submit Article</b></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
