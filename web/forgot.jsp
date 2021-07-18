<%-- 
    Document   : forgot
    Created on : May 29, 2021, 6:57:03 PM
    Author     : PANDIT
--%>

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
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6 container-fluid ">
                    <form action="ForgetServlet" method="post" class="form-control form-group">
                        <div class="form-group">
                            <label><b>Enter Your Email:</b></label>
                            <input class="form-control" type="email" name="email" placeholder="enter email" id="emailinput">
                        </div>
<!--
                        <div class="mt-1 form-group">
                            <label><b>Enter mobile number:</b></label>
                            <input class="form-control" type="text" name="contact" placeholder="enter number" id="numberinput">
                        </div>

                        <div class="mt-1 form-group">
                            <label><b>Enter new Password:</b></label>
                            <input class="form-control" type="text" name="password" placeholder="Create new password" id="passwordinput">
                        </div>-->

                        <div class="form-group">
                            <button type="submit" class="btn bg-primary form-control text-light">Submit</button>
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
