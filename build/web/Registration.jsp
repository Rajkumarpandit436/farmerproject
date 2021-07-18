


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/admincss.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <!--
        <div class="container-fluid p-4">
            <div class="row">
                <div class="col-md-3">
                    <h1 style="color: green">Farmer Portal</h1>
                </div>
                <div class="col-md-6 ">
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search"
                               placeholder="Search" arial-label="search">
                        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>

                <div class="col-md-3">
                    <a href="Login.jsp" class="btn btn-success">Login</a>
        <!-- <a href="Registration.jsp" class="btn btn-primary">Register</a>
    </div>

</div>
</div>
        -->
        <%@include file="nav_bar.jsp" %>

        <script src="js/validation.js" type="text/javascript"></script>
        <main>

            <div class="container">
                <div style="text-align: center; background-color: blue; height: 50px; padding-top: 10px; color: white; font-weight: bold; font-size: 20px; margin-top: 5px">Registration</div>
                <div>
                    <%

                        String regMsg = (String) session.getAttribute("reg-success");
                        if (regMsg != null) {%>
                    <div class="alert alert-success" role="alert"><%= regMsg%> .Click here to <a href="index.jsp" class="alert-link">Login</a> </div>

                    <%  }

                        session.removeAttribute("reg-success");
                    %>




                    <%
                        String failMsg = (String) session.getAttribute("fail-msg");
                        if (failMsg != null) {%>
                    <div class="alert alert-danger" role="alert"> <%=failMsg%> </div>


                    <%  }
                        session.removeAttribute("fail-msg");
                    %>

                </div>
                <form class="form-control form-group mt-" name="myform" action="RegisterServlet" method="post"  onsubmit="return Validateform()">

                    <div class="row">

                        <div class="col-md-6 ">
                            <div class="form-group">
                                <label for="exampleFormControlSelect2">User Type <b><span id="user_type_error" class="text-danger"></span></b></label>
                                <select id="inputUserTpe" class="form-control" name="user_type" >
                                    <option selected="" disabled="">...Choose...</option>
                                    <option>Agriculture Student</option>
                                    <option>General Public</option>
                                    <option>Farmer</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputName">User Name <b><span id="name_error" class="text-danger"></span></b></label>
                                <input type="text" class="form-control" id="exampleInputName" name="user_name" placeholder="Enter Youe Name" >
                            </div>

                            <div class="form-group">
                                <label for="exampleInputContact"> Contact No <b><span id="contact_error" class="text-danger"></span></b></label>
                                <input type="text" class="form-control" id="exampleInputContact" name="user_contact" placeholder="Enter your Contact No" >
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address <b><span id="email_error" class="text-danger"></span></b> </label>
                                <input type="email" class="form-control" id="exampleInputEmail1" name="user_email" aria-describedby="emailHelp" placeholder="Enter email" >
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">Password <b><span id="pass_error" class="text-danger"></span></b></label>
                                <input type="password" class="form-control" id="exampleInputPassword1" name="user_password" placeholder="Password" >
                            </div>

                            <div class="form-group">
                                <label for="exampleInputRadio">Gender <b><span id="gender_error" class="text-danger"></span></b></label>
                                <br>
                                <input type="radio" id="gender" name="gender" value="male"> Male</input>
                                <input type="radio" id="gender" name="gender" value="female"> Female</input> 
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label>State <b><span id="state_error" class="text-danger"></span></b></label>
                                <br>
                                <input type="text" class="form-control" id="state" name="state" placeholder="Enter your state">
                            </div>

                            <div class="form-group">
                                <label>District <b><span id="dist_error" class="text-danger"></span></b></label>
                                <br>
                                <input type="text" class="form-control" id="district" name="district" placeholder="Enter your district">
                            </div>

                            <div class="form-group">
                                <label>pin_code <b><span id="pin_error" class="text-danger"></span></b></label>
                                <br>
                                <input type="text" class="form-control" id="pincode" name="pincode" placeholder="Enter your pincode">
                            </div>

                        </div>
                        <div class="border border-light p-3 mb-4 text-center container">
                            <button type="submit" class="btn btn-primary">Register</button>
                        </div>
                    </div>
                </form>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
