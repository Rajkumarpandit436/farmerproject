<%-- 
    Document   : Login
    Created on : Dec 7, 2020, 8:23:21 AM
    Author     : PANDIT
--%>
<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/admincss.css" rel="stylesheet" type="text/css"/>

        <style>

            body{
                background-image: url(image/banner-farmer-coppy.png);
            }

            .fas{
                color: blueviolet;
                font-size: 2x;
            }
        </style>
    </head>
    <body>
        <%@include file="nav_bar.jsp" %>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 mt-5 offset-md-4">

                        <div class="card bg-primary text-light mr-auto">
                            <div class="card-header" style="text-align: center">
                                <a class="btn btn-warning" href="expertReg.jsp" role="button">New Expert Registration</a>
                                <a class="btn btn-warning mt-2" href="Login.jsp" role="button">User Login</a>

                                <h3>Login Here</h3>



                                <%  String captchamsg = (String) session.getAttribute("captchaError");
                                    if (captchamsg != null) {%>

                                <div class="alert alert-danger" role="alert"><%=captchamsg%> </div>

                                <% }
                                %>
                                <%
                                    session.removeAttribute("captchaError");
                                    String errorAccess = (String) session.getAttribute("expertError");
                                    if (errorAccess != null) {%>
                                <div class="alert alert-danger" role="alert"><%=errorAccess%></div>
                                <%  }

                                    session.removeAttribute("expertError");
                                %>


                                <%
                                    String susmsg = (String) session.getAttribute("expReg_success");
                                    if (susmsg != null) {%>
                                <div><%=susmsg%></div>  
                                <%}
                                    session.removeAttribute("expReg_success");
                                %>
                                <%
                                String expLogout = (String)session.getAttribute("logout");
                                if(expLogout!=null){%>
                                    <div class="alert alert-danger" role="alert"><%=expLogout%> </div>
                                <%}
                                    session.removeAttribute("logout");
                                %>
                            </div>
                            <div class="card-body">
                                <form name="myform" action="ExpLoginServlet" method="POST" onsubmit="return loginValidate()">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="emaillInput" name="email" aria-describedby="emailHelp" placeholder="Enter email">

                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password">
                                    </div>

                                    <label for="forExampleInputCaptcha">Enter Captcha:</label>
                                    <div class="form-row">
                                        <div class="form-group col-md-4">
                                            <input type="text" class="form-control" id="captcha" readonly>
                                        </div>
                                        <div class="col-md-4" style="color: black">
                                            <a class="form-control" onclick="return cap()">refresh<i class="fas fa-sync-alt"></i></a>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <input type="text" id="text_captcha" class="form-control" name="captcha">
                                        </div>

                                    </div>

                                    <div class="container " style="text-align: center">
                                        <button onclick=" return validcap()" type="submit" class="btn btn-warning">Login</button>
                                    </div>
                                    <div class="mt-2">
                                        <p>Forgot password ?    <a href="forgot.jsp" class="text-light">Click here</a></p>
                                    </div>
                                </form> 

                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </main>
        <script>
            function cap() {
                var alpha = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                    'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
                    'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7',
                    '8', '9'];

                var a = alpha[Math.floor(Math.random() * 67)];
                var b = alpha[Math.floor(Math.random() * 67)];
                var c = alpha[Math.floor(Math.random() * 67)];
                var d = alpha[Math.floor(Math.random() * 67)];
                var e = alpha[Math.floor(Math.random() * 67)];
                var f = alpha[Math.floor(Math.random() * 67)];

                var final = a + b + c + d + e + f;

                document.getElementById("captcha").value = final;
            }

            function validcap() {
                var strg1 = document.getElementById('captcha').value;
                var strg2 = document.getElementById('text_captcha').value;

                if (strg1 === strg2) {
                    return true;
                } else {
                    alert("captcha is incorrect");
                    return false;
                }
            }
        </script>


        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
