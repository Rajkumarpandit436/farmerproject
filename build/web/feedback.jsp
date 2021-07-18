<%-- 
    Document   : feedback
    Created on : May 24, 2021, 9:55:37 PM
    Author     : PANDIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User u = (User) session.getAttribute("loginmsg");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="css/admincss.css" rel="stylesheet" type="text/css"/>

        <title>feedback Page</title>
    </head>
    <body>

        <%@include file="nav_bar.jsp" %>

        <div class="container-fluid">

        </div>

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-12">

                    <div class="card">
                        <div class="card-header" style="text-align: center; background-color: #a1887f ;">
                            <h3>Give Your Feedback</h3>
                            <%
                                String msg = (String) session.getAttribute("feedbackmsg");
                                if (msg != null) {%>

                            <div class="alert alert-danger" role="alert"><%=msg%></div>

                            <%
                                session.removeAttribute("feedbackmsg");
                            %>
                            <% }
                            %>

                            <%
                                String errormsg = (String) session.getAttribute("errorfeedbackmsg");
                                if (errormsg != null) {%>

                            <div class="alert alert-danger" role="alert"><%=errormsg%></div>

                            <%
                                session.removeAttribute("errorfeedbackmsg");
                            %>
                            <% }
                            %>
                        </div>
                        <div class="card-body">
                            <form action="FeedbackServlet" method="post">
                                <%
                                    if (u != null) {%>
                                <!-- <div class="form-group ">
                                     <label for="email"><b><h5>Enter your Email *</h5></b></label>-->
                                <input type="hidden" class="form-control" id="email" value="<%=u.getEmail_address()%>" name="email" required>
                                </div>
                                <%} else {%>
                                <div class="form-group ">
                                    <label for="email"><b><h5>Enter your Email *</h5></b></label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                                <%}
                                %>

                                <div class="form-group ">
                                    <label for="comment"><b><h5>Enter Feedback</h5></b></label>
                                    <textarea class="form-control" rows="3" id="comment" name="feedback"></textarea>
                                </div>
                                <div class="container" style="text-align: center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
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
