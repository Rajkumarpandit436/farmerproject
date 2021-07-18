

<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User u = (User) session.getAttribute("loginmsg");
    if (u == null) {
        session.setAttribute("querylogin", "please Login first to submit query");
        response.sendRedirect("Login.jsp");
    } else {%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/admincss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="nav_bar.jsp" %>

        <main>
            <div class="container mt-5">
                <div class="card">
                    <div class="card-header text-light" style="background-color: #6d4c41; text-align: center">
                        <h3>Submit Your Query Here</h3>
                    </div>
                    <%
                        String regMsg = (String) session.getAttribute("reg-success");
                        if (regMsg != null) {%>
                    <div class="alert alert-success" role="alert"><%= regMsg%></div>
                    <%
                        session.removeAttribute("reg-success");
                    %>

                    <%  }
                    %>


                    <%
                        String failMsg = (String) session.getAttribute("fail-msg");
                        if (failMsg != null) {%>
                    <div class="alert alert-danger" role="alert"> <%=failMsg%> </div>
                    <%
                        session.removeAttribute("fail-msg");
                    %>

                    <%  }
                    %>
                </div>

                <div class="card-body">

                    <form action="QueryServlet" method="post">

                        <input type="hidden" class="form-control" value="<%=u.getEmail_address()%>" id="email" name="email" required >

                        <div class="form-group ">
                            <label for="email"><b><h4>choose category*</h4></b></label>
                            <select class="form-group form-control" name="category" id="category">
                                <option disabled selected="">
                                    ...choose category..
                                </option>
                                <option>
                                    Crop
                                </option>
                                <option>
                                    Fertilizer
                                </option>
                                <option>
                                    Other
                                </option>
                            </select>
                        </div>
                        <div class="form-group ">
                            <label for="comment"><b><h4>Enter Query</h4></b></label>
                            <textarea class="form-control" rows="3" id="comment" name="question"></textarea>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>

        </main>

        <!--script-->

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
<%}
%>